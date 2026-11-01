INSERT INTO employees
(emp_id, first_name, last_name, dept_id, salary, hire_date, is_active)
SELECT
    emp_id + 500,
    first_name,
    last_name,
    50,
    salary,
    hire_date,
    is_active
FROM employees
WHERE dept_id = 10;