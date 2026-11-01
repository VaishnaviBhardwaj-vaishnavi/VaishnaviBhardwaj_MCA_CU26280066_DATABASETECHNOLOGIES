USE Hospital_Functions_Lab;

DROP FUNCTION IF EXISTS medicine_stock_value;

DELIMITER //

CREATE FUNCTION medicine_stock_value(
    unit_price DECIMAL(10,2),
    stock INT
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN unit_price * stock;
END //

DELIMITER ;

SELECT
    MedicineID,
    MedicineName,
    UnitPrice,
    Stock,
    medicine_stock_value(UnitPrice, Stock) AS Stock_Value
FROM Medicines;