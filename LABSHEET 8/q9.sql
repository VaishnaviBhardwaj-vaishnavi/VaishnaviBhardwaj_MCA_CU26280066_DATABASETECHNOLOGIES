USE Hospital_Functions_Lab;

DROP PROCEDURE IF EXISTS patient_report;

DELIMITER //

CREATE PROCEDURE patient_report()
BEGIN
    SELECT
        PatientID,
        PatientName,
        Age,
        calculate_bmi(WeightKg, 1.65) AS BMI,
        age_category(Age) AS Age_Category
    FROM Patients;
END //

DELIMITER ;

CALL patient_report();