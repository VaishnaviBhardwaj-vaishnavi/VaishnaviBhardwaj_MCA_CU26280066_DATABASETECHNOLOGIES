USE CollegeDB;

DELIMITER //

CREATE PROCEDURE ShowDepartments()
BEGIN
    SELECT * FROM Department;
END //

DELIMITER ;

CALL ShowDepartments();