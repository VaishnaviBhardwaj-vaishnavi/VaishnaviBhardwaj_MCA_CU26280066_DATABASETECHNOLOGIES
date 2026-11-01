USE sql_lab;

DELETE FROM products
WHERE stock_quantity = 0;

SELECT * FROM products;