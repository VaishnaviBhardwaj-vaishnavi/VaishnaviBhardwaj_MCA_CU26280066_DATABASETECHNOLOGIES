USE company_db;

START TRANSACTION;

UPDATE orders
SET status = 'Shipped'
WHERE order_id = 5002;

SELECT order_id, total_amount, status
FROM orders
WHERE order_id = 5002;

-- Since total_amount is 450.00 (< 500),
-- rollback the transaction.

ROLLBACK;

SELECT * FROM orders
WHERE order_id = 5002;