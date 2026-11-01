USE CollegeDB;

DELIMITER //

CREATE FUNCTION AgeCategory(input_age INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    IF input_age >= 18 THEN
        RETURN 'Adult';
    ELSE
        RETURN 'Minor';
    END IF;
END //

DELIMITER ;

SELECT AgeCategory(20) AS Age_Category;