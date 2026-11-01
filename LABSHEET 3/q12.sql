USE company_db;

START TRANSACTION;

UPDATE employees
SET salary = 80000.00
WHERE emp_id = 101;

SAVEPOINT sp_first;

UPDATE employees
SET salary = 95000.00
WHERE emp_id = 102;

ROLLBACK TO SAVEPOINT sp_first;

COMMIT;