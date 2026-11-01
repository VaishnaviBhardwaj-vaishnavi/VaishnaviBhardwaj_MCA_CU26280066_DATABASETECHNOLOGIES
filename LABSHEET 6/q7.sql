USE CollegeDB;

DELIMITER //

CREATE PROCEDURE TotalStudents()
BEGIN
    SELECT COUNT(*) AS Total_Students
    FROM Student;
END //

DELIMITER ;

CALL TotalStudents();