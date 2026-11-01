USE Hospital_Cursor_Trigger_Lab;

DELIMITER //

CREATE PROCEDURE DisplayDoctors()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_id INT;
    DECLARE v_name VARCHAR(50);

    DECLARE cur CURSOR FOR
        SELECT DoctorID, DoctorName FROM Doctors;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO v_id, v_name;

        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT v_id AS DoctorID, v_name AS DoctorName;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;

CALL DisplayDoctors();