USE CollegeJoinDB;

SELECT
    d.DeptName,
    COUNT(e.EmpID) AS TotalEmployees
FROM Employees e
INNER JOIN Departments d
ON e.DeptID = d.DeptID
GROUP BY d.DeptID, d.DeptName;