USE Hospital_Cursor_Trigger_Lab;

DELIMITER //

CREATE PROCEDURE TotalDoctorFee(OUT total DECIMAL(10,2))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_fee DECIMAL(10,2);

    DECLARE cur CURSOR FOR
        SELECT ConsultationFee FROM Doctors;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = TRUE;

    SET total = 0;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO v_fee;

        IF done THEN
            LEAVE read_loop;
        END IF;

        SET total = total + v_fee;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;

CALL TotalDoctorFee(@total);

SELECT @total AS Total_Consultation_Fee;