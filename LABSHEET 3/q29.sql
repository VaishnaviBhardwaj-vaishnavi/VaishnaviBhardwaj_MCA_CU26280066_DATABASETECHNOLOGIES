USE company_db;

START TRANSACTION;

-- Insert first order
INSERT INTO orders
(order_id, customer_name, order_date, total_amount, status)
VALUES
(5008, 'Delta Technologies', '2024-02-01', 1500.00, 'Pending');

SAVEPOINT sp_5008;

-- Insert second order
INSERT INTO orders
(order_id, customer_name, order_date, total_amount, status)
VALUES
(5009, 'Omega Solutions', '2024-02-02', 0.00, 'Pending');

SAVEPOINT sp_5009;

-- Business rule: total_amount must be greater than zero.
-- If order 5009 violates the rule:
ROLLBACK TO SAVEPOINT sp_5008;

COMMIT;

SELECT * FROM orders
WHERE order_id IN (5008, 5009);