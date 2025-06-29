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

except mysql.connector.Error as e:
    print(f"DB connection Error: {e}")

mycursor.execute(""""
CREATE TABLE IF NOT EXISTS Authors (
        author_id INT PRIMARY KEY,
        author_name VARCHAR(215)
);

CREATE TABLE IF NOT EXISTS Books (
        book_id INT PRIMARY KEY,
        title VARCHAR(130),
        author_id INT,
        price DOUBLE,
        publication_date DATE,
        FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE IF NOT EXISTS Customers (
        customer_id INT PRIMARY KEY,
        customer_name VARCHAR(215),
        email VARCHAR(215),
        address TEXT
);

CREATE TABLE IF NOT EXISTS Orders (
        order_id INT PRIMARY KEY,
        customer_id INT,
        order_date DATE,
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE IF NOT EXISTS Order_Details (
        orderdetailid INT PRIMARY KEY,
        order_id INT,
        book_id INT,
        quantity DOUBLE,
        FOREIGN KEY (order_id) REFERENCES Orders(order_id),
        FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
"""")

sql = "INSERT INTO customer (customer_id, customer_name, email, address ) VALUES (%s, %s, %s, %s)"
val = [
    (2, "Blessing Malik", "bmalik@sandtech.com", "124 Happiness  Ave."),
    (3, "Obed Ehoneah", "bmalik@sandtech.com", "125 Happiness  Ave."),
    (4, "Nehemial Kamolu", "nkamolu@sandtech.co", "126 Happiness  Ave.")
]

mycursor.executemany(sql, val)
mydb.commit()

mycursor.close()
mydb.close()
print("Database connection closed.")
