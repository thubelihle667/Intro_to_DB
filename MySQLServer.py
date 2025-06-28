import mysql.connector


mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="MySQLInst@11er",
    database="alx_book_store"
)

mycursor = mydb.cursor()

try:
    mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
    print("Database 'alx_book_store' created successfully!")

except Exception as e:
    print(f"DB connection Error: {e}")

mycursor.close()
mydb.close()
print("Database connection closed.")