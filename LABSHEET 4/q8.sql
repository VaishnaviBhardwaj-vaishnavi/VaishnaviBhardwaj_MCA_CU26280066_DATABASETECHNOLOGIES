USE sql_lab;

ALTER TABLE Enrollment
ADD CONSTRAINT fk_enrollment_student
FOREIGN KEY (StudentID)
REFERENCES Student(StudentID);

DESC Enrollment;