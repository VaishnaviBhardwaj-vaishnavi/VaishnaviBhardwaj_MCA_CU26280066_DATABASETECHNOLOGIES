USE company_db;

START TRANSACTION;

SELECT *
FROM departments
WHERE dept_id = 10
FOR SHARE;

-- Generate analytical report
SELECT dept_id, dept_name, budget
FROM departments
WHERE dept_id = 10;

COMMIT;