USE company_db;

-- Create roles
CREATE ROLE IF NOT EXISTS 'read_role';
CREATE ROLE IF NOT EXISTS 'write_role';
CREATE ROLE IF NOT EXISTS 'admin_role';

-- Assign privileges
GRANT SELECT
ON company_db.*
TO 'read_role';

GRANT INSERT, UPDATE, DELETE
ON company_db.*
TO 'write_role';

-- Role inheritance
GRANT 'read_role'
TO 'write_role';

GRANT 'write_role'
TO 'admin_role';

-- Create new user
CREATE USER IF NOT EXISTS 'super_dev'@'localhost'
IDENTIFIED BY 'SuperDev2026!';

-- Assign admin role
GRANT 'admin_role'
TO 'super_dev'@'localhost';

SET DEFAULT ROLE 'admin_role'
TO 'super_dev'@'localhost';

SHOW GRANTS FOR 'super_dev'@'localhost';