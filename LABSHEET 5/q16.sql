USE CollegeJoinDB;

SELECT DISTINCT
    d.DeptName
FROM Employees e
INNER JOIN Departments d
ON e.DeptID = d.DeptID;