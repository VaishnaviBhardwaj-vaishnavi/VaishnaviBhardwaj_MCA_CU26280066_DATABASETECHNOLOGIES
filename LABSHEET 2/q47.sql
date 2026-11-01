SELECT
    dept_name,
    (
        SELECT COUNT(*)
        FROM employees
        WHERE employees.dept_id = departments.dept_id
    ) AS total_employees
FROM departments;