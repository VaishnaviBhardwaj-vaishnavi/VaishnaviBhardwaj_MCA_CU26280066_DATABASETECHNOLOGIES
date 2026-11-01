USE CollegeJoinDB;

SELECT *
FROM Employees e
INNER JOIN Departments d
ON e.DeptID = d.DeptID;