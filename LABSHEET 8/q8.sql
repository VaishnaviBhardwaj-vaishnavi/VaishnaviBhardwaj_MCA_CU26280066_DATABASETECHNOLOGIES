USE Hospital_Functions_Lab;

DROP PROCEDURE IF EXISTS medicine_count;

DELIMITER //

CREATE PROCEDURE medicine_count(
    OUT p_count INT
)
BEGIN
    SELECT COUNT(*)
    INTO p_count
    FROM Medicines;
END //

DELIMITER ;

CALL medicine_count(@total);

SELECT @total AS Total_Medicines;