USE sql_lab;

UPDATE employees
SET department = 'Operations'
WHERE salary < 50000;

SELECT * FROM employees;