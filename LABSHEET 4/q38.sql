USE sql_lab;

UPDATE employees
SET salary = salary + 2000
WHERE department = 'Finance';

SELECT * FROM employees;