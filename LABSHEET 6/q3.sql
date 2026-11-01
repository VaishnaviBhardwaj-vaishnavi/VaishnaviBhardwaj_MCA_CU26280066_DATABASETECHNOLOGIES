USE CollegeDB;

DELIMITER //

CREATE PROCEDURE ShowCourses()
BEGIN
    SELECT * FROM Course;
END //

DELIMITER ;

CALL ShowCourses();