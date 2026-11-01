USE sql_lab;

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(100) NOT NULL,
    Designation VARCHAR(50) DEFAULT 'Lecturer'
);

INSERT INTO Faculty
(FacultyID, FacultyName)
VALUES
(1, 'Dr. Meera Sharma');

SELECT * FROM Faculty;