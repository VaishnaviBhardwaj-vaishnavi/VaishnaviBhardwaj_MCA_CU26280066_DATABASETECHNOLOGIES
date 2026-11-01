USE CollegeJoinDB;

SELECT
    e.EmpID,
    e.EmpName,
    d.DeptName
FROM Employees e
INNER JOIN Departments d
ON e.DeptID = d.DeptID
WHERE d.DeptName = 'Pharmacy';