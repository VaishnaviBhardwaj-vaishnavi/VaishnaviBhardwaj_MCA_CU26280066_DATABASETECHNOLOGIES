USE CollegeJoinDB;

SELECT
    EmpName,
    DeptName,
    Location
FROM Employees
NATURAL JOIN Departments
WHERE Location = 'Block B';