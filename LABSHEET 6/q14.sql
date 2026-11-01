USE CollegeDB;

DELIMITER //

CREATE FUNCTION StudentGrade(input_marks DECIMAL(5,2))
RETURNS VARCHAR(2)
DETERMINISTIC
BEGIN
    IF input_marks >= 90 THEN
        RETURN 'A';
    ELSEIF input_marks >= 75 THEN
        RETURN 'B';
    ELSEIF input_marks >= 60 THEN
        RETURN 'C';
    ELSE
        RETURN 'D';
    END IF;
END //

DELIMITER ;

SELECT StudentGrade(85) AS Grade;