USE CollegeJoinDB;

SELECT
    e.EmpName,
    e.Salary,
    s.Grade,
    s.MinSalary
FROM Employees e
INNER JOIN SalaryGrades s
ON e.Salary > s.MinSalary;