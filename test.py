import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Youtuber1!"
)

cur = mydb.cursor()
cur.execute("select * from hedge_fund.stakeholder")

print(cur.description)