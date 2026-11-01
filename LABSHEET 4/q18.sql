USE sql_lab;

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT CHECK (Credits BETWEEN 1 AND 6)
);

INSERT INTO Course VALUES
(1, 'DBMS', 8);

-- Expected: CHECK constraint error.