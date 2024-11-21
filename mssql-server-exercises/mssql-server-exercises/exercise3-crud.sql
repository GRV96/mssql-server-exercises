CREATE DATABASE EXERCISE3;
USE EXERCISE3;

CREATE TABLE Student(
lastName VARCHAR(200),
firstName CHAR(10),
age INT);

INSERT INTO Student VALUES
('Marchand', 'Élisabeth', 18),
('Truchon', 'Mélanie', 16),
('Teslu', 'Sandrine', 18),
('Portail', 'Bruno', 23),
('Virenque', 'Michel', 22);

SELECT *
FROM Student;

SELECT *
FROM Student
WHERE lastName = 'Teslu';

UPDATE Student
SET age = 17
WHERE lastName = 'Teslu';

SELECT *
FROM Student
WHERE lastName = 'Teslu';

DELETE FROM Student
WHERE lastName = 'Virenque' AND firstName = 'Michel';

SELECT *
FROM Student;

--USE MASTER;
--DROP DATABASE EXERCICE3;
