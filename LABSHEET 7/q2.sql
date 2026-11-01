USE Hospital_Cursor_Trigger_Lab;

DELIMITER //

CREATE PROCEDURE HighFeeDoctors()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_name VARCHAR(50);
    DECLARE v_fee DECIMAL(10,2);

    DECLARE cur CURSOR FOR
        SELECT DoctorName, ConsultationFee
        FROM Doctors
        WHERE ConsultationFee > 1000;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO v_name, v_fee;

        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT v_name AS DoctorName, v_fee AS ConsultationFee;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;

CALL HighFeeDoctors();