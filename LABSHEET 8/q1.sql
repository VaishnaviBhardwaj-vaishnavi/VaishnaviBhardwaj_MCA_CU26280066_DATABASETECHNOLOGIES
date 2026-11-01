USE Hospital_Functions_Lab;

DROP FUNCTION IF EXISTS calculate_bmi;

DELIMITER //

CREATE FUNCTION calculate_bmi(
    weight_kg DECIMAL(5,2),
    height_m DECIMAL(5,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE bmi DECIMAL(10,2);

    IF height_m <= 0 THEN
        RETURN NULL;
    END IF;

    SET bmi = weight_kg / (height_m * height_m);

    RETURN bmi;
END //

DELIMITER ;

SELECT calculate_bmi(65, 1.70) AS BMI;