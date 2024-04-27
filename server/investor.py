from flask import Flask, render_template, request, session, redirect, url_for
import database
import hashlib
from __main__ import app

@app.route('/investor', methods=['GET'])
def investor_home():
    if session['role'] == "investor":
        statement = "SELECT * FROM portfolio WHERE PORTFOLIOID = %s"
        user = database.execute_db(statement, (session["id"],))
        if user["MANAGERID"] == 1:
            statement = "SELECT MANAGERID, FIRSTNAME, LASTNAME FROM portfoliomanager"
            manager = database.execute_db_all(statement)
            return render_template(
                "investor/investor-manager-first.html", manager=manager
            )
        return render_template('investor/investor.html')
    else:
        return "this page is not accepted"


@app.route('/investor-manager-first', methods=['POST', 'GET'])
def investor_manager_first():
    if session['role'] == "investor":
        id = request.form['selected_manager']
        statement = 'UPDATE portfolio SET MANAGERID = %s WHERE PORTFOLIOID = %s'
        database.execute_db(statement, (id, session['id'])) #set the manager

        statement = 'SELECT TOTALVALUE from portfolio WHERE PORTFOLIOID = %s' #get the investment value
        adding = database.execute_db(statement, (session['id'],))
        print(adding)

        statement = 'SELECT TOTALCASH from portfoliomanager WHERE MANAGERID = %s'
        totalcash = database.execute_db(statement, (id,)) #get the manager infomration
        print(totalcash)

        statement = 'UPDATE portfoliomanager SET TOTALCASH = %s WHERE MANAGERID = %s'
        user = database.execute_db(statement, (totalcash['TOTALCASH'] + adding['TOTALVALUE'], id))

        return render_template('investor/investor-manager.html')
    else:
        return "this page is not accepted"


@app.route('/investor-balance', methods=['GET', 'POST'])
def invesotr_balence():
    if session['role'] == "investor":
        return render_template('investor/investor-balance.html')
    else:
        return "this page is not accepted"


@app.route("/investor-profile", methods=["GET"])
def investor_profile():
    if session["role"] == "investor":
        return render_template("investor/investor_profile.html", email=session["email"])
    else:
        return "not logged in with the right credentials"


@app.route("/investor_change_password", methods=["GET", "POST"])
def investor_change_password():
    if session["role"] == "investor":
        password = request.form["password"]
        oldpassword = request.form["oldpassword"]
        input_hash = hashlib.sha256(oldpassword.encode("utf-8")).hexdigest()
        statement = "SELECT * FROM investor WHERE email = %s"
        user = database.execute_db(statement, (session["email"],))
        if user and input_hash == user["PASSWORD"]:
            statement = "UPDATE investor SET PASSWORD = %s WHERE EMAIL = %s"
            input_hash_1 = hashlib.sha256(password.encode("utf-8")).hexdigest()
            user = database.execute_db(statement, (input_hash_1, session["email"]))
        return render_template("investor/investor_profile.html", email=session["email"])
    else:
        return "not logged in with the right credentials"


@app.route('/investor-balance-change', methods=['GET', 'POST'])
def investor_balence_change():
    if session['role'] == "investor":
        transaction_type = request.form['transaction_type']
        amount = int(request.form['amount'])

        statement = 'SELECT MANAGERID, TOTALVALUE from portfolio WHERE PORTFOLIOID = %s'
        user = database.execute_db(statement, (session['id'],))
        totalvalue = user['TOTALVALUE']
        manager = user['MANAGERID']

        statement1 = 'UPDATE portfoliomanager SET TOTALCASH = %s WHERE MANAGERID = %s'
        statement2 = 'UPDATE portfolio SET TOTALVALUE = %s WHERE PORTFOLIOID = %s'

        if transaction_type == "add":
            user = database.execute_db(statement1, (totalvalue + amount, manager))
            user = database.execute_db(statement2, (totalvalue + amount, session['id']))
        else:
            user = database.execute_db(statement1, (totalvalue - amount, manager))
            user = database.execute_db(statement2, (totalvalue - amount, session['id']))

        return render_template('investor/investor-balance.html')
    else:
        return "this page is not accepted"
