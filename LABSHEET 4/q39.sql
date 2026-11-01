USE sql_lab;

UPDATE employees
SET department = 'Senior Staff'
WHERE hire_date < '2024-02-01';

SELECT * FROM employees;