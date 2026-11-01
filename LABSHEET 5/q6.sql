USE CollegeJoinDB;

SELECT
    e.EmpName,
    e.City,
    d.DeptName,
    d.Location
FROM Employees e
INNER JOIN Departments d
ON e.DeptID = d.DeptID;