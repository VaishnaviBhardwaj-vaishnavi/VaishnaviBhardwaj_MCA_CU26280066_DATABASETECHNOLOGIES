USE CollegeDB;

DELIMITER //

CREATE FUNCTION HigherNumber(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
    IF a > b THEN
        RETURN a;
    ELSE
        RETURN b;
    END IF;
END //

DELIMITER ;

SELECT HigherNumber(25, 40) AS Higher_Number;