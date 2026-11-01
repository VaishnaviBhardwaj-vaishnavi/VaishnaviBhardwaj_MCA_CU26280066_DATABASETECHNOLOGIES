USE CollegeDB;

DELIMITER //

CREATE PROCEDURE ShowStudents()
BEGIN
    SELECT * FROM Student;
END //

DELIMITER ;

CALL ShowStudents();