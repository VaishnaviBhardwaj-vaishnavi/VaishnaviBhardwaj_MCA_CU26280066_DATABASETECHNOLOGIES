USE CollegeDB;

DELIMITER //

CREATE PROCEDURE GetStudent(IN sid INT)
BEGIN
    SELECT *
    FROM Student
    WHERE StudentID = sid;
END //

DELIMITER ;

CALL GetStudent(3);