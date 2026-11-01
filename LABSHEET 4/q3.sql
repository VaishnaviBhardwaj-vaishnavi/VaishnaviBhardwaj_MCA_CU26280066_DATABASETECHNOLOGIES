USE sql_lab;

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Age INT,
    DeptID INT,
    JoiningDate DATE
);

INSERT INTO Student VALUES
(101, 'Amit Sharma', 'amit@example.com', 20, 10, '2026-07-01'),
(102, 'Priya Singh', 'priya@example.com', 21, 20, '2026-07-03'),
(103, 'Rahul Verma', 'rahul@example.com', 22, 30, '2026-07-05'),
(104, 'Neha Gupta', 'neha@example.com', 20, 10, '2026-07-08'),
(105, 'Arjun Mehta', 'arjun@example.com', 23, 40, '2026-07-10');

SELECT * FROM Student;