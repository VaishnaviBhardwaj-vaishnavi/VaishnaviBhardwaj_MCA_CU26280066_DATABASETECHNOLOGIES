USE Hospital_Functions_Lab;

DROP FUNCTION IF EXISTS age_category;

DELIMITER //

CREATE FUNCTION age_category(p_age INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    IF p_age < 18 THEN
        RETURN 'Child';

    ELSEIF p_age < 60 THEN
        RETURN 'Adult';

    ELSE
        RETURN 'Senior';
    END IF;
END //

DELIMITER ;

SELECT
    PatientID,
    PatientName,
    Age,
    age_category(Age) AS Age_Category
FROM Patients;