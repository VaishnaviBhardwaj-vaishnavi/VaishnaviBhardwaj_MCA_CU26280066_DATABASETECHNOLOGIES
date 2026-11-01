USE CollegeJoinDB;

SELECT
    e.EmpName,
    e.Salary,
    d.DeptName
FROM Employees e
INNER JOIN Departments d
ON e.DeptID = d.DeptID
WHERE d.DeptName = 'Computer Science';