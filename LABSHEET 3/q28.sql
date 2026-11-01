CREATE USER IF NOT EXISTS 'cloud_user'@'%'
IDENTIFIED BY 'CloudPass2026!'
REQUIRE SSL;

GRANT SELECT, INSERT
ON company_db.*
TO 'cloud_user'@'%';

SHOW GRANTS FOR 'cloud_user'@'%';