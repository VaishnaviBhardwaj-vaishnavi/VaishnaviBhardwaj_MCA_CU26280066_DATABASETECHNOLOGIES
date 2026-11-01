USE Hospital_Functions_Lab;

DROP PROCEDURE IF EXISTS medicine_report;

DELIMITER //

CREATE PROCEDURE medicine_report()
BEGIN
    SELECT
        MedicineID,
        MedicineName,
        UnitPrice,
        Stock,

        medicine_stock_value(UnitPrice, Stock) AS Stock_Value,

        CASE
            WHEN Stock < 30 THEN 'Low Stock'
            WHEN Stock <= 70 THEN 'Medium Stock'
            ELSE 'High Stock'
        END AS Stock_Status

    FROM Medicines;
END //

DELIMITER ;

CALL medicine_report();