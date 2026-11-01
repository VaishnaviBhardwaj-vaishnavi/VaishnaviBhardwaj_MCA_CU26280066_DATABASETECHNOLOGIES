USE company_db;

-- Step 1: Create test user
CREATE USER IF NOT EXISTS 'test_maint'@'localhost'
IDENTIFIED BY 'TestMaint2026!';

-- Step 2: Grant permissions
GRANT SELECT, INSERT, UPDATE
ON company_db.*
TO 'test_maint'@'localhost';

-- Step 3: Start transaction
START TRANSACTION;

-- Step 4: Update employee active status
UPDATE employees
SET is_active = TRUE
WHERE emp_id = 104;

-- Step 5: Rollback changes
ROLLBACK;

-- Step 6: Audit user privileges
SHOW GRANTS FOR 'test_maint'@'localhost';

-- Step 7: Revoke permissions
REVOKE SELECT, INSERT, UPDATE
ON company_db.*
FROM 'test_maint'@'localhost';

-- Step 8: Lock user account
ALTER USER 'test_maint'@'localhost'
ACCOUNT LOCK;

-- Verify account
SELECT user, host, account_locked
FROM mysql.user
WHERE user = 'test_maint';