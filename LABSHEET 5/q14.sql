USE CollegeJoinDB;

SELECT
    EmpName,
    DeptName,
    Salary
FROM Employees
NATURAL JOIN Departments
WHERE Salary >= 70000;