USE CollegeDB;

DELIMITER //

CREATE FUNCTION AgeAfterFiveYears(current_age INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN current_age + 5;
END //

DELIMITER ;

SELECT AgeAfterFiveYears(20) AS Age_After_Five_Years;