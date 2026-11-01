USE CollegeDB;

SELECT
    StudentName,
    Marks,
    StudentGrade(Marks) AS Grade
FROM Student;