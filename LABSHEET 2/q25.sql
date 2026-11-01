SELECT *
FROM orders
WHERE status = 'Cancelled'
OR total_amount > 2000.00;