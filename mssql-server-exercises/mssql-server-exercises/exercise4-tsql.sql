CREATE DATABASE EXERCISE4
GO
USE EXERCISE4

-- Run script create-table-contact.sql.

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

GO
USE master
GO
DROP DATABASE EXERCISE4
