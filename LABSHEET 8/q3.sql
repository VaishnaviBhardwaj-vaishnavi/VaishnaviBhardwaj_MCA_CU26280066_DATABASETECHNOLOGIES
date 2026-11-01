USE Hospital_Functions_Lab;

DROP FUNCTION IF EXISTS consultation_with_tax;

DELIMITER //

CREATE FUNCTION consultation_with_tax(
    fee DECIMAL(10,2),
    tax_percent DECIMAL(5,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN fee + (fee * tax_percent / 100);
END //

DELIMITER ;

SELECT
    PatientName,
    ConsultationFee AS Original_Fee,
    consultation_with_tax(ConsultationFee, 18) AS Fee_With_Tax
FROM Patients;