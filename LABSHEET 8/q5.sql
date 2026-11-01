USE Hospital_Functions_Lab;

DROP PROCEDURE IF EXISTS patient_by_gender;

DELIMITER //

CREATE PROCEDURE patient_by_gender(
    IN p_gender VARCHAR(10)
)
BEGIN
    SELECT *
    FROM Patients
    WHERE Gender = p_gender;
END //

DELIMITER ;

CALL patient_by_gender('F');

CALL patient_by_gender('M');