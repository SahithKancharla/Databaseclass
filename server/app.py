from flask import Flask, render_template, redirect, url_for, request, session, jsonify
import hashlib
from datetime import datetime, timedelta
import json
import database
from datetime import datetime
import os

app = Flask(__name__, template_folder='../templates',)
app.secret_key = "super secret key"

import employee, investor, stakeholder, manager


# Login route
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        role = request.form['role']
        if role == "employee":
            statement = 'SELECT * FROM employee WHERE email = %s'
        elif role == "investor":
            statement = 'SELECT * FROM investor WHERE email = %s'
        elif role == "manager":
            statement = 'SELECT * FROM portfoliomanager WHERE email = %s'
        elif role == "stakeholder":
            statement = 'SELECT * FROM stakeholder WHERE email = %s'
        
        input_hash = hashlib.sha256(password.encode('utf-8')).hexdigest()
        user = database.execute_db(statement, (email,))
        print(input_hash, user, statement, email, password, password.encode('utf-8'))
        if user and input_hash == user['PASSWORD']:
            session['id'] = user[list(user.keys())[0]]
            session['logged_in'] = True
            session['email'] = email
            session['role'] = role
            return redirect(url_for('index'))
        else:
            error = 'Invalid email or password.'
            return render_template('login.html', error=error)

    return render_template("login.html")

# Index route (accessible only to logged-in users)
@app.route('/')
def index():
    if session.get('logged_in'):
        user_role = session['role']
        if user_role == 'employee':
            return redirect(url_for('employee_home'))
        elif user_role == 'investor':
            return redirect(url_for('investor_home'))
        elif user_role == 'manager':
            return redirect(url_for('manager_home'))
        elif user_role == 'stakeholder':
            return redirect(url_for('stakeholder_home'))
        else:
            return 'Unauthorized'
    else:
        return redirect(url_for('login'))

# Registration route
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        key = request.form["registerkey"]
        file_path = os.path.join(os.pardir, 'keys.txt')

        # Open and read the contents of the text file
        with open(file_path, 'r') as file:
            keys_content = file.read()
            if (key not in keys_content):
                return redirect(url_for('register'))
        firstname = request.form['firstname']
        lastname = request.form['lastname']
        email = request.form['email']
        password = request.form['password']
        role = request.form['role']
        input_hash = hashlib.sha256(password.encode('utf-8')).hexdigest()

        if role == "employee":
            statement = 'SELECT * FROM employee WHERE email = %s'
        elif role == "investor":
            statement = 'SELECT * FROM investor WHERE email = %s'
        elif role == "manager":
            statement = 'SELECT * FROM portfoliomanager WHERE email = %s'
        elif role == "stakeholder":
            statement = 'SELECT * FROM stakeholder WHERE email = %s'

        user = database.execute_db(statement, (email,))
        if user is None:
            if role == "employee":
                statement = "SELECT MAX(EMPLOYEEID) AS max_id FROM employee;"
                id = database.execute_db(statement, ())
                new_id = int(id['max_id']) + 1 if id['max_id'] is not None else 1
                statement = "INSERT INTO employee (EMPLOYEEID, FIRSTNAME, LASTNAME, MANAGERID, EMAIL, PASSWORD) VALUES (%s, %s, %s, 1, %s, %s)"
                user = database.execute_db(statement, (new_id, firstname, lastname, email, input_hash,))
            elif role == "investor":
                statement = "SELECT MAX(INVESTORID) AS max_id FROM investor;"
                id = database.execute_db(statement, ())
                new_id = int(id['max_id']) + 1 if id['max_id'] is not None else 1
                time = datetime.now().date()
                statement = "INSERT INTO PORTFOLIO (PORTFOLIOID, PERFORMANCE, INVESTMENTTIME, MANAGERID, TOTALVALUE) VALUES (%s, %s, %s, %s, %s)"
                user = database.execute_db(statement, (new_id, 0, time, 1, 0,))
                statement = "INSERT INTO investor (INVESTORID, FIRSTNAME, LASTNAME, PORTFOLIOID, EMAIL, PASSWORD) VALUES (%s, %s, %s, %s, %s, %s)"
                user = database.execute_db(statement, (new_id, firstname, lastname, new_id, email, input_hash,))
            elif role == "manager":
                statement = "SELECT MAX(MANAGERID) AS max_id FROM portfoliomanager;"
                id = database.execute_db(statement, ())
                new_id = int(id['max_id']) + 1 if id['max_id'] is not None else 1
                statement = "INSERT INTO portfoliomanager (MANAGERID, FIRSTNAME, LASTNAME, EMAIL, PASSWORD) VALUES (%s, %s, %s, %s, %s)"
                user = database.execute_db(statement, (new_id, firstname, lastname, email, input_hash,))
            elif role == "stakeholder":
                statement = "SELECT MAX(STAKEHOLDERID) AS max_id FROM stakeholder;"
                id = database.execute_db(statement, ())
                new_id = int(id['max_id']) + 1 if id['max_id'] is not None else 1
                statement = "INSERT INTO stakeholder (STAKEHOLDERID, FIRSTNAME, LASTNAME, STAKEPERCENT, EMAIL, PASSWORD) VALUES (%s, %s, %s, %s, %s, %s)"
                user = database.execute_db(statement, (new_id, firstname, lastname, 1, email, input_hash,))
            return redirect(url_for('login'))
        else:
            return redirect(url_for('register'))

    return render_template('register.html')


# Logout route
@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('login'))


if __name__ == "__main__":
    app.run(debug=True)
