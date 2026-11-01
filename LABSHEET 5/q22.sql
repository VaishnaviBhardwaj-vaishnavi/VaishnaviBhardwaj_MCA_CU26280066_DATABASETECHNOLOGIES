USE CollegeJoinDB;

SELECT
    e.EmpName,
    e.City,
    e.Salary,
    d.DeptName
FROM Employees e
INNER JOIN Departments d
ON e.DeptID = d.DeptID
WHERE e.City IN ('Delhi', 'Pune')
AND e.Salary >= 50000;