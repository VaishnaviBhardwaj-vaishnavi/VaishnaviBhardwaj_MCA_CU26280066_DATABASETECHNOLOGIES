USE sql_lab;

ALTER TABLE Student
ADD COLUMN JoiningDate2 DATE DEFAULT (CURRENT_DATE);

INSERT INTO Student
(StudentID, Name, Email, Age, DeptID)
VALUES
(106, 'Riya Das', 'riya@example.com', 21, 20);

SELECT * FROM Student;