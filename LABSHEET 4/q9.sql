USE sql_lab;

INSERT INTO Student VALUES
(106, 'Riya Das', 'riya@example.com', 21, 99, '2026-08-01');

-- Expected: Foreign key constraint error.
-- Department ID 99 does not exist.