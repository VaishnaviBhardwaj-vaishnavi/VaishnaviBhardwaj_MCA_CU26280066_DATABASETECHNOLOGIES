USE CollegeJoinDB;

SELECT
    e.EmpName,
    d.DeptName,
    e.Salary
FROM Employees e
INNER JOIN Departments d
ON e.DeptID = d.DeptID
WHERE e.Salary > 60000;