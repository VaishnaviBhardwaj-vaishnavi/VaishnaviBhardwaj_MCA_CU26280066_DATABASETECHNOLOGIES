USE Hospital_Functions_Lab;

DROP PROCEDURE IF EXISTS patients_above_age;

DELIMITER //

CREATE PROCEDURE patients_above_age(
    IN p_age INT
)
BEGIN
    SELECT *
    FROM Patients
    WHERE Age > p_age;
END //

DELIMITER ;

CALL patients_above_age(25);

CALL patients_above_age(40);