USE company_db;

START TRANSACTION;

UPDATE employees
SET salary = salary * 1.15
WHERE dept_id = 10;

SAVEPOINT sp_salary_done;

UPDATE departments
SET budget = budget + 50000.00
WHERE dept_id = 10;

-- Check the updated budget.
SELECT budget INTO @new_budget
FROM departments
WHERE dept_id = 10;

-- Roll back budget update if it exceeds 520000.
ROLLBACK TO SAVEPOINT sp_salary_done;

-- Reapply the budget update only if it does not exceed 520000.
UPDATE departments
SET budget = budget + 50000.00
WHERE dept_id = 10
AND budget + 50000.00 <= 520000.00;

COMMIT;