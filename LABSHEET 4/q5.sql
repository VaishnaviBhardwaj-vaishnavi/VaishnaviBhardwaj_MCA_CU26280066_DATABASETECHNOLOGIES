USE sql_lab;

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseName VARCHAR(100)
);

INSERT INTO Enrollment VALUES
(1, 101, 'DBMS'),
(2, 102, 'Operating Systems'),
(3, 103, 'Pharmacology'),
(4, 104, 'Python');

SELECT * FROM Enrollment;