from flask import Flask, render_template, request, session, redirect, url_for, jsonify
import database
import hashlib
import plotly.graph_objs as go
from __main__ import app


@app.route('/stakeholder', methods=['GET'])
def stakeholder_home():
    if session['role'] == "stakeholder":
        graph_data = generate_overall_graph()
        return render_template('stakeholder/stakeholder.html', graph_data=graph_data)
    else:
        return "this page is not accepted"


@app.route("/stakeholder_profile", methods=["GET"])
def stakeholder_profile():
    if session["role"] == "stakeholder":
        return render_template("stakeholder/stakeholder_profile.html", email=session["email"])
    else:
        return "not logged in with the right credentials"


@app.route("/stakeholder_change_password", methods=["GET", "POST"])
def stakeholder_change_password():
    if session["role"] == "stakeholder":
        password = request.form["password"]
        oldpassword = request.form["oldpassword"]
        input_hash = hashlib.sha256(oldpassword.encode("utf-8")).hexdigest()
        statement = "SELECT * FROM stakeholder WHERE email = %s"
        user = database.execute_db(statement, (session["email"],))
        if user and input_hash == user["PASSWORD"]:
            statement = "UPDATE stakeholder SET PASSWORD = %s WHERE EMAIL = %s"
            input_hash_1 = hashlib.sha256(password.encode("utf-8")).hexdigest()
            user = database.execute_db(statement, (input_hash_1, session["email"]))
        return render_template("stakeholder/stakeholder_profile.html", email=session["email"])
    else:
        return "not logged in with the right credentials"


def generate_overall_graph():
    # Generate data for the plot (replace with your own data)
    statement = "SELECT * from hedgefund"
    report = database.execute_db_all(statement)
    x_data = []
    y_totalvalue = []
    y_dailychange = []
    y_cashposition = []
    for data in report:
        reportdata = data['REPORTDATE']
        totalvalue = data['TOTALVALUE']
        dailychange = data['DAILYCHANGE']
        cashposition = data['CASHPOSITION']

        x_data.append(reportdata)
        y_totalvalue.append(totalvalue)
        y_dailychange.append(dailychange)
        y_cashposition.append(cashposition)

    # Create Plotly figures for each option
    fig_option1 = go.Figure()
    fig_option1.add_trace(go.Scatter(x=x_data, y=y_totalvalue, mode='lines', name='Totol Value'))

    fig_option2 = go.Figure()
    fig_option2.add_trace(go.Scatter(x=x_data, y=y_dailychange, mode='lines', name='Daily Change'))

    fig_option3 = go.Figure()
    fig_option3.add_trace(go.Scatter(x=x_data, y=y_cashposition, mode='lines', name='Cash Position'))

    # Convert figures to JSON for sending to the frontend
    graph_data = {
        'option1': fig_option1.to_json(),
        'option2': fig_option2.to_json(),
        'option3': fig_option3.to_json()
    }

    return graph_data
