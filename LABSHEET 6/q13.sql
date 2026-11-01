USE CollegeDB;

DELIMITER //

CREATE FUNCTION ResultStatus(input_marks DECIMAL(5,2))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    IF input_marks >= 50 THEN
        RETURN 'Pass';
    ELSE
        RETURN 'Fail';
    END IF;
END //

DELIMITER ;

SELECT ResultStatus(75) AS Result;