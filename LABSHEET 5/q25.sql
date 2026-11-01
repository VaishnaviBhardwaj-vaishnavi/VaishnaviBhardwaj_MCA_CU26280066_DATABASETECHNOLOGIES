USE CollegeJoinDB;

SELECT
    d.DeptName,
    SUM(e.Salary) AS TotalSalary
FROM Employees e
INNER JOIN Departments d
ON e.DeptID = d.DeptID
GROUP BY d.DeptID, d.DeptName
HAVING SUM(e.Salary) > 100000;