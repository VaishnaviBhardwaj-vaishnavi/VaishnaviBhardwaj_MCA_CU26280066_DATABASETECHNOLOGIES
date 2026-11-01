UPDATE orders
SET status = 'Cancelled'
WHERE total_amount < 200.00;