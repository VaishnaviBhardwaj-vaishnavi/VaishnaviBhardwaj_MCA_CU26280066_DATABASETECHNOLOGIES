USE CollegeDB;

DELIMITER //

CREATE PROCEDURE GetStudentsByDept(IN did INT)
BEGIN
    SELECT *
    FROM Student
    WHERE DeptID = did;
END //

DELIMITER ;

CALL GetStudentsByDept(102);