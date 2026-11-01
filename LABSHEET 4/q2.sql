USE sql_lab;

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

INSERT INTO Department VALUES
(10, 'Computer Science'),
(20, 'Information Technology'),
(30, 'Pharmacy'),
(40, 'Management');

SELECT * FROM Department;