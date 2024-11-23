CREATE DATABASE EXERCISE3
GO
USE EXERCISE3

CREATE TABLE Student(
lastName VARCHAR(200),
firstName CHAR(10),
age INT)

INSERT INTO Student VALUES
('Marchand', 'Elisabeth', 18),
('Truchon', 'Melanie', 16),
('Teslu', 'Sandrine', 18),
('Portail', 'Bruno', 23),
('Virenque', 'Michel', 22)

SELECT *
FROM Student

-- The student name Teslu
SELECT *
FROM Student
WHERE lastName = 'Teslu'

-- Set Teslu's age to 17
UPDATE Student
SET age = 17
WHERE lastName = 'Teslu'

SELECT *
FROM Student
WHERE lastName = 'Teslu'

-- Remove Vinrenque Michel
DELETE FROM Student
WHERE lastName = 'Virenque' AND firstName = 'Michel'

SELECT *
FROM Student

-- Delete the database
GO
USE MASTER
GO
DROP DATABASE EXERCICE3
