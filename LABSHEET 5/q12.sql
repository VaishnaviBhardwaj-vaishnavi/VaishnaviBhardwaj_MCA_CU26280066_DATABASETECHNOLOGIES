USE CollegeJoinDB;

SELECT
    EmpName,
    DeptID,
    DeptName
FROM Employees
NATURAL JOIN Departments;