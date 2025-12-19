# libraries/db_helper.py
import mysql.connector

def get_connection():
    return mysql.connector.connect(
        host="localhost",
        user="robotuser",
        password="RobotPass123!",
        database="pyrobotrpa",
    )

def get_order_count(username):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        "SELECT COUNT(*) FROM orders WHERE username = %s",
        (username,),
    )
    (count,) = cursor.fetchone()
    cursor.close()
    conn.close()
    return count
