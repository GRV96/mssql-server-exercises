CREATE DATABASE EXERCISE4
GO
USE EXERCISE4
GO

-- Initializing table Contact
CREATE TABLE Contact(
lastName VARCHAR(200),
firstName VARCHAR(200),
age INT,
gender CHAR(1),
birthDate DATE)

INSERT INTO Contact VALUES
('Marchand', 'Elisabeth', 18, 'F', '1976-08-04'),
('Truchon', 'Melanie', 16, 'F', '1978-08-04'),
('Teslu', 'Sandrine', 17, 'F', '1987-05-02'),
('Portail', 'Bruno', 23, 'M', '1970-05-06'),
('Virenque', 'Michel', 22, 'M', '1983-08-02'),
('Dutruel', 'Pascal', 22, 'M', '1983-08-02'),
('Virenque', 'Micheline', 37, 'F', '1975-08-02'),
('Fournillet', 'Alain', 22, 'M', '1983-01-01'),
('Faurnillet', 'Pascal', 48, 'M', '1960-06-12'),
('Boutin', 'Ludivine', 47, 'F', '1965-01-22'),
('Delors', 'Valerie', 28, 'F', '1978-09-24'),
('Thuillier', 'Olivier', 41, 'M', '1976-08-12'),
('Chuillier', 'Olivier', 41, 'M', '1976-08-12'),
('Meilhac', 'Amelie', 34, 'F', '1983-05-08'),
('Boutin', 'Ludivine', 47, 'F', '1965-01-22')
GO
-- Table Contact initialized

-- People's age without duplicates
SELECT DISTINCT age
FROM Contact

-- People born in 1976
SELECT lastName, firstName, birthDate AS Year1976
FROM Contact
WHERE YEAR(birthDate) = 1976

-- People born on a January 1st
SELECT lastName, firstName, birthDate
FROM Contact
WHERE MONTH(birthDate) = 1 AND DAY(birthDate) = 1

-- First names ending in e
SELECT lastName, firstName
FROM Contact
WHERE firstName LIKE '%e'

-- Only women
SELECT lastName, firstName
FROM Contact
WHERE gender = 'F'

SELECT lastName, firstName
FROM Contact
WHERE gender != 'M'

-- People 17 or younger
SELECT lastName, firstName, age
FROM Contact
WHERE age <= 17

-- People not 17 or 48 years old
SELECT lastName, firstName, age
FROM Contact
WHERE age NOT IN (17, 48)

-- First seven lines
SELECT TOP(7) *
FROM Contact

-- Bruno Portail's line copied in a separate table
SELECT * INTO ContactPortail
FROM Contact
WHERE lastName = 'Portail' AND firstName = 'Bruno'

SELECT *
FROM ContactPortail

-- People not born in 1976
SELECT lastName, firstName, birthDate
FROM Contact
WHERE YEAR(birthDate) != 1976

-- People not born in August
SELECT lastName, firstName, birthDate
FROM Contact
WHERE MONTH(birthDate) != 8

-- Delete the database
GO
USE master
GO
DROP DATABASE EXERCISE4
