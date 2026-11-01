USE Hospital_Cursor_Trigger_Lab;

DELIMITER //

CREATE PROCEDURE AverageDoctorFee()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_fee DECIMAL(10,2);
    DECLARE total DECIMAL(10,2) DEFAULT 0;
    DECLARE counter INT DEFAULT 0;

    DECLARE cur CURSOR FOR
        SELECT ConsultationFee FROM Doctors;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO v_fee;

        IF done THEN
            LEAVE read_loop;
        END IF;

        SET total = total + v_fee;
        SET counter = counter + 1;
    END LOOP;

    CLOSE cur;

    IF counter > 0 THEN
        SELECT total / counter AS Average_Consultation_Fee;
    ELSE
        SELECT 'No doctors available' AS Message;
    END IF;
END //

DELIMITER ;

CALL AverageDoctorFee();