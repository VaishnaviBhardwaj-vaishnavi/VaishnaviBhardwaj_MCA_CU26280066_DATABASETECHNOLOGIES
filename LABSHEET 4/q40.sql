USE sql_lab;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);

INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 999.99, 5),
(2, 'Mouse', 'Electronics', 25.50, 0),
(3, 'Desk Chair', 'Furniture', 150.00, 3),
(4, 'Monitor', 'Electronics', 1200.00, 2),
(5, 'Keyboard', 'Electronics', 75.00, 0),
(6, 'Coffee Mug', 'Office', 12.99, 10),
(7, 'Notebook', 'Office', 5.99, 8),
(8, 'Smartphone', 'Electronics', 1500.00, 1);

SELECT * FROM products;