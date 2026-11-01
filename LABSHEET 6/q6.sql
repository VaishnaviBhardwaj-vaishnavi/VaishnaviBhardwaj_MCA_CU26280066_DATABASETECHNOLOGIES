USE CollegeDB;

DELIMITER //

CREATE PROCEDURE StudentsAboveMarks(IN input_marks DECIMAL(5,2))
BEGIN
    SELECT *
    FROM Student
    WHERE Marks > input_marks;
END //

DELIMITER ;

CALL StudentsAboveMarks(80);