USE sql_lab;

UPDATE employees
SET
    salary = 47000,
    hire_date = '2024-03-05'
WHERE name = 'Lisa Wilson';

SELECT * FROM employees;