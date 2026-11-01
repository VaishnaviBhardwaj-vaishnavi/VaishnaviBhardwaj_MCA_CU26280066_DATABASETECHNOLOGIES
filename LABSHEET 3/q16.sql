USE company_db;

START TRANSACTION;

UPDATE departments
SET budget = budget - 10000.00
WHERE dept_id = 10
AND budget >= 10000.00;

UPDATE departments
SET budget = budget + 10000.00
WHERE dept_id = 20;

COMMIT;

SELECT * FROM departments
WHERE dept_id IN (10, 20);