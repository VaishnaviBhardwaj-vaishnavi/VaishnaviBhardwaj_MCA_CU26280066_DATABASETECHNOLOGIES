USE sql_lab;

CREATE TABLE Library (
    BookID INT UNIQUE,
    Title VARCHAR(150) NOT NULL
);

INSERT INTO Library VALUES
(1, 'Database Systems'),
(2, 'Operating Systems'),
(3, 'Computer Networks'),
(4, 'Python Programming'),
(5, 'Data Mining');

SELECT * FROM Library;