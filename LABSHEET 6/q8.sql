USE CollegeDB;

DELIMITER //

CREATE PROCEDURE CheckResult(IN sid INT)
BEGIN
    SELECT
        StudentID,
        StudentName,
        Marks,
        CASE
            WHEN Marks >= 50 THEN 'Pass'
            ELSE 'Fail'
        END AS Result
    FROM Student
    WHERE StudentID = sid;
END //

DELIMITER ;

CALL CheckResult(3);