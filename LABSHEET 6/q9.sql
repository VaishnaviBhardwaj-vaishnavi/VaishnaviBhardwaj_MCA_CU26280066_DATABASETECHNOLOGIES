USE CollegeDB;

DELIMITER //

CREATE PROCEDURE GetStudentsByGender(IN input_gender VARCHAR(10))
BEGIN
    SELECT *
    FROM Student
    WHERE Gender = input_gender;
END //

DELIMITER ;

CALL GetStudentsByGender('Female');