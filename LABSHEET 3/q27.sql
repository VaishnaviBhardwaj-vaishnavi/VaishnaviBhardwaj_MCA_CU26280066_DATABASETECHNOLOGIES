-- SESSION 1: Login as dev_user

USE company_db;

START TRANSACTION;

UPDATE employees
SET salary = salary + 1000
WHERE emp_id = 101;

-- Now execute Session 2 before continuing.

UPDATE employees
SET salary = salary + 1000
WHERE emp_id = 102;

COMMIT;

