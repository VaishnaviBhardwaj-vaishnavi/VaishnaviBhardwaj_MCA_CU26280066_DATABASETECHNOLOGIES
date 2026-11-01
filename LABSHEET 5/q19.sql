USE CollegeJoinDB;

SELECT
    d.DeptName,
    AVG(e.Salary) AS AverageSalary
FROM Employees e
INNER JOIN Departments d
ON e.DeptID = d.DeptID
GROUP BY d.DeptID, d.DeptName
HAVING AVG(e.Salary) > 60000;