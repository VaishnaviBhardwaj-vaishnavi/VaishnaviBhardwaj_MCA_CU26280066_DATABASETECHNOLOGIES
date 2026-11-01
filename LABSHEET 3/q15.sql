USE company_db;

START TRANSACTION;

UPDATE employees
SET salary = 85000.00
WHERE emp_id = 101;

-- ALTER TABLE causes an implicit COMMIT
ALTER TABLE employees
ADD COLUMN test_column VARCHAR(50);

-- This rollback cannot undo the committed UPDATE
ROLLBACK;

SELECT * FROM employees;