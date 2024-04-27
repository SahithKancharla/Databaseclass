from flask import Flask, render_template, request, session, redirect, url_for, jsonify
import plotly.graph_objs as go
import database
import hashlib
import datetime
import json
from __main__ import app

@app.route('/manager', methods=['GET'])
def manager_home():
    if session['role'] == "manager":
        return render_template('manager/manager.html')
    else:
        return "this page is not accepted"


@app.route('/manage-employee-recruitment', methods=['GET'])
def manager_employee_recruitment():
    if session['role'] == "manager":
        statement = 'SELECT * FROM employee WHERE MANAGERID = %s'
        team = database.execute_db_all(statement, (session['id'],))
        free = database.execute_db_all('SELECT * FROM employee WHERE MANAGERID = 1')
        if team is None or len(team) == 0:
            team = []
        if free is None or len(free) == 0:
            free = []
        return render_template('manager/manager-employee-recruitment.html', team=team, free=free)
    else:
        return "this page is not accepted"


@app.route("/manager_profile", methods=["GET"])
def manager_profile():
    if session["role"] == "manager":
        return render_template("manager/manager_profile.html", email=session["email"])
    else:
        return "not logged in with the right credentials"


@app.route("/manager_change_password", methods=["GET", "POST"])
def manager_change_password():
    if session["role"] == "manager":
        password = request.form["password"]
        oldpassword = request.form["oldpassword"]
        input_hash = hashlib.sha256(oldpassword.encode("utf-8")).hexdigest()
        statement = "SELECT * FROM portfoliomanager WHERE email = %s"
        user = database.execute_db(statement, (session["email"],))
        if user and input_hash == user["PASSWORD"]:
            statement = "UPDATE portfoliomanager SET PASSWORD = %s WHERE EMAIL = %s"
            input_hash_1 = hashlib.sha256(password.encode("utf-8")).hexdigest()
            user = database.execute_db(statement, (input_hash_1, session["email"]))
        return render_template("manager/manager_profile.html", email=session["email"])
    else:
        return "not logged in with the right credentials"


@app.route('/manager-add-team-member', methods=['POST', 'GET'])
def manager_add_member():
    if session['role'] == "manager":
        id = request.form['selected_employee']
        print(session['id'], id)
        statement = 'UPDATE employee SET MANAGERID = %s WHERE EMPLOYEEID = %s'
        user = database.execute_db(statement, (session['id'], id))
        return redirect(url_for('manager_employee_recruitment'))
    else:
        return "this page is not accepted"

@app.route('/manager-remove-team-member', methods=['POST', 'GET'])
def manager_remove_team_member():
    if session['role'] == "manager":
        id = request.form['employee_id']
        print(session['id'], id)
        statement = 'UPDATE employee SET MANAGERID = %s WHERE EMPLOYEEID = %s'
        user = database.execute_db(statement, (1, id))
        return redirect(url_for('manager_employee_recruitment'))
    else:
        return "this page is not accepted"

@app.route('/generate_progress_bar_manager', methods=['GET'])
def graph_design():
    # Execute the SQL query with the date filter
    statement = "SELECT * from portfoliomanager WHERE MANAGERID = %s"
    manager = database.execute_db_all(statement, (session['id'], ))[0]
    totalcash = int(manager['TOTALCASH'])
    totalinvested = int(manager['TOTALINVESTED'])

    progress = (totalinvested / (totalinvested + totalcash)) * 100
    fig = go.Figure(go.Indicator(
        mode="gauge+number",
        value=progress,
        title='Investment to cash ratio',
        gauge=dict(
            axis=dict(range=[None, 100]),
            bar=dict(color="green"),
            bgcolor="white",
            borderwidth=2,
            bordercolor="gray",
        )
    ))

    statement = "SELECT * from employee WHERE MANAGERID = %s"
    employee = database.execute_db_all(statement, (session['id'], ))
    string =  {'fig': fig.to_dict(), 'employee':employee, 'investment': totalinvested}
    return string

@app.route('/get_graph_data', methods=['GET'])
def get_graph_data():
    # Get the employee ID from the query parameters
    employee_id = request.args.get('employee_id')
    three_months_ago = datetime.datetime.now() - datetime.timedelta(days=3*30)  # Assuming 30 days per month

    # Format the date in MySQL date format (YYYY-MM-DD HH:MM:SS)
    three_months_ago_str = three_months_ago.strftime('%Y-%m-%d %H:%M:%S')

    # Execute the SQL query with the date filter
    statement = "SELECT * from trade WHERE EMPLOYEEID = %s AND FULFILLEDTIME >= %s AND EXITED = 1"
    trades = database.execute_db_all(statement, (employee_id, three_months_ago_str))
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
    trades = database.execute_db_all(statement, (employee_id,))
    statement = 'SELECT * from contracttype'
    contracts = database.execute_db_all(statement)
    print(trades)
    ratio = 0
    if sum != 0:
        ratio = returns /sum
    response_data = {'fig': fig.to_dict(), 'total_returns': returns, 'return_ratio':ratio, 'open_trades': trades, "contracts":contracts}

    # Send the JSON data to the front end
    return response_data
