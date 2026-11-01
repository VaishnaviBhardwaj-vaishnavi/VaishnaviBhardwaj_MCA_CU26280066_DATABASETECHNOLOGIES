USE sql_lab;

ALTER TABLE Student
ADD CONSTRAINT uq_student_email UNIQUE (Email);

INSERT INTO Student VALUES
(106, 'Riya Das', 'amit@example.com', 21, 20, '2026-08-01');

-- Expected: Duplicate email error.