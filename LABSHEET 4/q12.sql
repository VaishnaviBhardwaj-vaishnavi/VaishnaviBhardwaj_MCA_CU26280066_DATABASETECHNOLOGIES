USE sql_lab;

SELECT
    e.EnrollmentID,
    s.Name,
    e.CourseName
FROM Enrollment e
INNER JOIN Student s
ON e.StudentID = s.StudentID;