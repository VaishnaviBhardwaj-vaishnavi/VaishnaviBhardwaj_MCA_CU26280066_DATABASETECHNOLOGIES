USE CollegeJoinDB;

SELECT
    e.EmpName,
    e.Salary,
    s.Grade,
    s.MaxSalary
FROM Employees e
INNER JOIN SalaryGrades s
ON e.Salary < s.MaxSalary;