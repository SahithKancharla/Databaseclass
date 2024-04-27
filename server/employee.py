from flask import Flask, render_template, request, session, redirect, url_for, jsonify
import plotly.graph_objs as go
import hashlib
import database
import datetime
import json
from __main__ import app


@app.route('/employee', methods=['GET'])
def employee_home():
    if session['role'] == "employee":
        return render_template('employee/employee_home.html')
    else:
        return "not logged in with the right credentials"


@app.route('/employee-trades', methods=['GET'])
def employee_trades():
    if session['role'] == "employee":
        statement = 'SELECT TRADEID, ENTRYPRICE, QUANTITY, CONTRACTID from trade WHERE EXITED = 0 AND EMPLOYEEID = %s'
        trades = database.execute_db_all(statement, (session['id'],))

        statement = 'SELECT MANAGERID from employee WHERE EMPLOYEEID = %s'
        managerid = database.execute_db(statement, (session['id'],))['MANAGERID']

        statement = 'SELECT TOTALCASH, TOTALINVESTED from portfoliomanager WHERE MANAGERID = %s'
        assets = database.execute_db(statement, (managerid,))
        print(assets)

        statement = 'SELECT * from contracttype'
        contracts = database.execute_db_all(statement)

        session['managerid'] = managerid
        session['totalcash'] = int(assets['TOTALCASH'])
        session['totalinvested'] = int(assets['TOTALINVESTED'])
        print(trades)

        return render_template('employee/employee_trade.html', open_trade=trades, total_assets = assets, contracts = contracts)
    else:
        return "not logged in with the right credentials"


@app.route("/employee_profile", methods=["GET"])
def employee_profile():
    if session["role"] == "employee":
        return render_template("employee/employee_profile.html", email = session['email'])
    else:
        return "not logged in with the right credentials"


@app.route("/employee_change_password", methods=["GET", "POST"])
def employee_change_password():
    if session["role"] == "employee":
        password = request.form["password"]
        oldpassword = request.form["oldpassword"]
        input_hash = hashlib.sha256(oldpassword.encode('utf-8')).hexdigest()
        statement = 'SELECT * FROM employee WHERE email = %s'
        user = database.execute_db(statement, (session['email'],))
        if user and input_hash == user['PASSWORD']:
            statement = "UPDATE employee SET PASSWORD = %s WHERE EMAIL = %s"
            input_hash_1 = hashlib.sha256(password.encode('utf-8')).hexdigest()
            user = database.execute_db(statement, (input_hash_1, session["email"]))
        return render_template("employee/employee_profile.html", email=session["email"])
    else:
        return "not logged in with the right credentials"


@app.route('/employee_submit_trade', methods=['GET', 'POST'])
def employee_submit_trade():
    if session['role'] == "employee":
        data = request.json
        print(data)
        entry = data['entry']
        quantity = data['quantity']
        contract = data['contract_selected']
        time_now = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        print(entry, quantity, contract)
        statement = 'INSERT INTO trade (ENTRYPRICE, QUANTITY, EXITED, FULFILLEDTIME, CONTRACTID, EMPLOYEEID) VALUES (%s, %s, %s, %s, %s, %s)'
        user = database.execute_db(statement, (entry, quantity, 0, time_now, contract, session['id']))
        statement = 'UPDATE portfoliomanager SET TOTALCASH = %s, TOTALINVESTED = %s WHERE MANAGERID = %s'
        invested = int(entry)* int(quantity)

        session['totalinvested'] = session['totalinvested'] + invested
        session['totalcash'] = session['totalcash'] - invested
        user = database.execute_db(statement, (session['totalcash'], session['totalinvested'], session['managerid'])) #set the manager
        return redirect(url_for('employee_trades'))
    else:
        return "not logged in with the right credentials"

@app.route('/employee_close_trade', methods=['GET', 'POST'])
def employee_close_trade():
    if session['role'] == "employee":
        data_str = request.form['closed_trade']
        data = data_str.replace("'", "\"")
        data = json.loads(data)
        print(data)
        entry = data['ENTRYPRICE']
        quantity = data['QUANTITY']
        exit_price = request.form['exit']
        print(data, entry, quantity, exit_price)
        id = data['TRADEID']

        statement = 'UPDATE portfoliomanager SET TOTALCASH = %s, TOTALINVESTED = %s WHERE MANAGERID = %s'
        invested = int(entry) * int(quantity)
        returned = int(exit_price) * int(quantity) 
        print(invested, returned)

        session['totalinvested'] = session['totalinvested'] - invested
        session['totalcash'] = session['totalcash'] + returned
        user = database.execute_db(statement, (session['totalcash'], session['totalinvested'], session['managerid'])) #set the manager

        statement = 'UPDATE trade SET EXITPRICE = %s, EXITED = %s WHERE TRADEID = %s'
        user = database.execute_db(statement, (exit_price, 1, id))


        return redirect(url_for('employee_trades'))
    else:
        return "not logged in with the right credentials"


@app.route('/generate_progress_bar_employee', methods=['GET'])
def target_graph():
    three_months_ago = datetime.datetime.now() - datetime.timedelta(days=3*30)  # Assuming 30 days per month

    # Format the date in MySQL date format (YYYY-MM-DD HH:MM:SS)
    three_months_ago_str = three_months_ago.strftime('%Y-%m-%d %H:%M:%S')

    # Execute the SQL query with the date filter
    statement = "SELECT * from trade WHERE EMPLOYEEID = %s AND FULFILLEDTIME >= %s AND EXITED = 1"
    trades = database.execute_db_all(statement, (session['id'], three_months_ago_str))
    sum = 0
    returns = 0
    for data in trades:
        inp = int(data['ENTRYPRICE']) * int(data['QUANTITY'])
        sum = sum + inp
        returns = returns + int(data['EXITPRICE']) * int(data['QUANTITY'])

    progress = sum / 10000
    fig = go.Figure(go.Indicator(
        mode="gauge+number",
        value=progress,
        title='Target investment this Quarter',
        gauge=dict(
            axis=dict(range=[None, 100]),
            bar=dict(color="green"),
            bgcolor="white",
            borderwidth=2,
            bordercolor="gray",
        )
    ))
    statement = 'SELECT TRADEID, ENTRYPRICE, QUANTITY, CONTRACTID from trade WHERE EXITED = 0 AND EMPLOYEEID = %s'
    trades = database.execute_db_all(statement, (session['id'],))
    statement = "SELECT TRADEID, ENTRYPRICE, QUANTITY, CONTRACTID from trade WHERE EXITED = 1 AND EMPLOYEEID = %s"
    closetrades = database.execute_db_all(statement, (session["id"],))
    statement = 'SELECT * from contracttype'
    contracts = database.execute_db_all(statement)
    print(trades)
    if (sum == 0):
        return_ratio = 0
    else:
        return_ratio = returns/sum
    response_data = {
        "fig": fig.to_dict(),
        "total_returns": returns,
        "return_ratio": return_ratio,
        "open_trades": trades,
        "contracts": contracts,
        "close_trades": closetrades,
    }

    # Send the JSON data to the front end
    return response_data
