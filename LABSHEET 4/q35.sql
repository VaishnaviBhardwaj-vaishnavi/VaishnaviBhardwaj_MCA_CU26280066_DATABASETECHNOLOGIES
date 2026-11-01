USE sql_lab;

UPDATE employees
SET salary = salary * 1.05
WHERE department = 'HR';

SELECT * FROM employees;