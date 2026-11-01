SELECT customer_name
FROM orders
GROUP BY customer_name
HAVING COUNT(*) > 1
OR SUM(total_amount) > 1000.00;