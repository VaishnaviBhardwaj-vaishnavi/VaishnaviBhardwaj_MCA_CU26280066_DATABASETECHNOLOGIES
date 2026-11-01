USE sql_lab;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    course VARCHAR(100),
    marks INT,
    city VARCHAR(50)
);

INSERT INTO students VALUES
(1, 'Alice Brown', 'Computer Science', 85, 'Mumbai'),
(2, 'Bob Wilson', 'Mathematics', 92, 'Delhi'),
(3, 'Carol Davis', 'Computer Science', 78, 'Mumbai'),
(4, 'David Miller', 'Physics', 88, 'Chennai'),
(5, 'Eva Garcia', 'Mathematics', 95, 'Delhi'),
(6, 'Frank Johnson', 'Computer Science', 82, 'Bangalore'),
(7, 'Grace Lee', 'Physics', 90, 'Mumbai'),
(8, 'Henry Smith', 'Mathematics', 76, 'Chennai'),
(9, 'Ivy Chen', 'Computer Science', 89, 'Delhi'),
(10, 'Jack Taylor', 'Physics', 84, 'Bangalore');

SELECT * FROM students;