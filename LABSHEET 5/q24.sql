USE CollegeJoinDB;

SELECT
    DeptID,
    DeptName,
    COUNT(EmpID) AS TotalEmployees
FROM Employees
NATURAL JOIN Departments
GROUP BY DeptID, DeptName;