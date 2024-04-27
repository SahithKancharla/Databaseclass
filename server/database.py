import mysql.connector

db_config = {
        "host": "localhost",
        "user": "root",
        "password": "Youtuber1!",
        "database":"hedge_fund"
        }

def execute_db(statement, params=None):
    try:
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor(dictionary=True)
        print(statement)
        if params:
            cursor.execute(statement, params)
        else:
            cursor.execute(statement)
        if statement.startswith('SELECT'):
            output = cursor.fetchone()
        else:
            output = None
        connection.commit()
        cursor.close()
        connection.close()
        return output
    except mysql.connector.Error as e:
        print(f"Error executing SQL statement: {e}")
        return None
    
def execute_db_all(statement, params=None):
    try:
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor(dictionary=True)
        if params:
            cursor.execute(statement, params)
        else:
            cursor.execute(statement)
        if statement.startswith('SELECT'):
            output = cursor.fetchall()
        else:
            output = None
        connection.commit()
        cursor.close()
        connection.close()
        return output
    except mysql.connector.Error as e:
        print(f"Error executing SQL statement: {e}")
        return None