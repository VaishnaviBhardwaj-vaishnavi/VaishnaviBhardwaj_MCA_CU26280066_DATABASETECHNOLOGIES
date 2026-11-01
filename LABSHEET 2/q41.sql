UPDATE employees
SET salary = salary * 1.15
WHERE dept_id = (
    SELECT dept_id
    FROM departments
    ORDER BY budget DESC
    LIMIT 1
);