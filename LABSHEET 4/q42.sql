USE sql_lab;

DELETE FROM products
WHERE category = 'Electronics'
AND price > 1000;

SELECT * FROM products;