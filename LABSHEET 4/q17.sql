USE sql_lab;

ALTER TABLE Student
ADD CONSTRAINT chk_student_age
CHECK (Age > 18);

INSERT INTO Student VALUES
(106, 'Riya Das', 'riya@example.com', 17, 20, '2026-08-01');

-- Expected: CHECK constraint error.