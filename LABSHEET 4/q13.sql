USE sql_lab;

CREATE TABLE Department2 (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

INSERT INTO Department2 VALUES
(50, NULL);

-- Expected: DeptName cannot be NULL.