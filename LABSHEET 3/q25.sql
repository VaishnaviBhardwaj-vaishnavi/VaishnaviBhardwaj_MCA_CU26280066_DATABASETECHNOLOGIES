USE company_db;

START TRANSACTION;

UPDATE orders
SET status = 'Cancelled'
WHERE order_id = 5002
AND status = 'Pending'
AND total_amount = 450.00;

UPDATE departments
SET budget = budget + 450.00
WHERE dept_id = 20;

COMMIT;

SELECT * FROM orders
WHERE order_id = 5002;

SELECT * FROM departments
WHERE dept_id = 20;