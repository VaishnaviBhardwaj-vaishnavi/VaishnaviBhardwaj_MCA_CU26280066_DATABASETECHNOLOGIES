SELECT dept_id, AVG(salary) AS average_salary
FROM employees
GROUP BY dept_id
HAVING AVG(salary) > (
    SELECT AVG(salary)
    FROM employees
);