DELETE FROM employees
WHERE is_active = FALSE
AND salary < (
    SELECT average_salary
    FROM (
        SELECT dept_id, AVG(salary) AS average_salary
        FROM employees
        GROUP BY dept_id
    ) AS department_average
    WHERE department_average.dept_id = employees.dept_id
);