CREATE ROLE IF NOT EXISTS 'reporter_role';

GRANT SELECT
ON company_db.*
TO 'reporter_role';

GRANT 'reporter_role'
TO 'analyst'@'localhost';

SET DEFAULT ROLE 'reporter_role'
TO 'analyst'@'localhost';

SHOW GRANTS FOR 'analyst'@'localhost';