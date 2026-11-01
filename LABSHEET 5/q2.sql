USE CollegeJoinDB;

SELECT
    e.EmpID,
    e.EmpName,
    e.DeptID,
    d.DeptName
FROM Employees e
INNER JOIN Departments d
ON e.DeptID = d.DeptID;