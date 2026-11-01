USE sql_lab;

INSERT INTO Enrollment VALUES
(5, 999, 'DBMS');

-- Expected: Foreign key constraint error.
-- Student ID 999 does not exist.