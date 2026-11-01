SELECT dept_id, SUM(salary) AS total_salary
FROM employees
GROUP BY dept_id;