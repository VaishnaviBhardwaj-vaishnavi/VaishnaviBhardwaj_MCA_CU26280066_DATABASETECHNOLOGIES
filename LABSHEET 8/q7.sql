USE Hospital_Functions_Lab;

DROP PROCEDURE IF EXISTS update_medicine_stock;

DELIMITER //

CREATE PROCEDURE update_medicine_stock(
    IN p_id INT,
    IN p_quantity INT
)
BEGIN
    UPDATE Medicines
    SET Stock = Stock + p_quantity
    WHERE MedicineID = p_id;
END //

DELIMITER ;

CALL update_medicine_stock(301, 20);

SELECT * FROM Medicines
WHERE MedicineID = 301;