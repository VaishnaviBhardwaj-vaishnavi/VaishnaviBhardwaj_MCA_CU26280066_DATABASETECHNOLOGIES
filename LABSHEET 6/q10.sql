USE CollegeDB;

DELIMITER //

CREATE PROCEDURE StudentsBetweenMarks(
    IN min_marks DECIMAL(5,2),
    IN max_marks DECIMAL(5,2)
)
BEGIN
    SELECT *
    FROM Student
    WHERE Marks BETWEEN min_marks AND max_marks;
END //

DELIMITER ;

CALL StudentsBetweenMarks(70, 90);