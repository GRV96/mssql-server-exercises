CREATE DATABASE EXERCISE5
GO
USE EXERCISE5
GO

-- Initializing the tables
CREATE TABLE Employee(
employeeId INT,
lastName VARCHAR(200),
firstName VARCHAR(200),
age VARCHAR(2000),
gender VARCHAR(200),
birthDate VARCHAR(200),
position VARCHAR(200))
GO

INSERT INTO Employee VALUES
(1,'Marchand', 'Elisabeth', 18, 'F', '1976-08-04', 'HR'),
(1,'Truchon', 'Melanie', 32, 'F', '1978-08-04', 'Trade'),
(2,'Teslu', 'Sandrine', 35, 'F', '1987-02-05', 'IT'),
(1,'Portail', 'Bruno', 23, 'M', '1970-05-06', 'Finance'),
(1,'Virenque', 'Michel', 22, 'M', '1983-08-02', 'IT'),
(3,'Dutruel', 'Pascal', 22, 'M', '1983-08-02', 'Trade'), -- Same age as Virenque Michel
(2,'Virenque', 'Micheline', 37, 'M', '1975-08-02', 'Trade'),
(2,'Fournillet', 'Alain', 22, 'M', '1983-01-01', 'HR'),
(2,'Faurnillet', 'Pascal', 48, 'M', '1960-06-12', 'HR'),
(2,'Boutin', 'Ludivine', 47, 'F', '1965-01-22', 'IT'),
(1,'Delors', 'Valerie', 28, 'M', '1978-09-24', 'HR'),
(1,'Thuillier', 'Olivier', 41, 'M', '1976-08-12', 'Trade'),
(2,'Chuillier', 'Bertrand', 43, 'M', '1978-08-12', 'Finance'),
(1,'Meilhac', 'Ludivine', 45, 'F', '1983-05-08', 'Finance'),
(2,'Boutin', 'Ludivine', 47, 'F', '1965-01-22', 'Finance'),
(4,'Batin', 'Alain', 59, 'M', '1983-01-01', 'HR'),
(2,'Dupont', 'Pascal', 48, 'M', '1960-06-12', 'HR'),
(3,'Dujardin', 'Laetitia', 47, 'F', '1965-01-22', 'IT'),
(1,'Duchemin', 'Valerie', 57, 'M', '1978-09-24', 'HR'),
(2,'Martin', 'Olivier', 41, 'M', '1976-08-12', 'IT'),
(2,'Fontaine', 'Olivier', 44, 'M', '1976-08-12', 'Finance'),
(1,'Chevalier', 'Amelie', 37,'F', '1983-05-08', 'Trade'),
(6,'Jolly', 'Ludivine', 47, 'F', '1965-01-22', 'Finance'),
(5,'Le Mée', 'Aurore', 22, 'M', '1983-01-01', 'HR'),
(4,'Bonnet', 'Pascal', 48, 'M', '1960-06-12', 'HR'),
(2,'Binet', 'Ludivine', 47, 'F', '1965-01-22', 'IT'),
(2,'Lopez', 'Valerie', 28, 'M', '1988-09-24', 'HR'),
(3,'Dumont', 'Bruno', 55, 'M', '1973-08-12', 'Trade'),
(3,'Girard', 'Olivier', 58, 'M', '1970-08-12', 'Finance'),
(4,'Roussel', 'Amelie', 47, 'F', '1978-05-08', 'IT'),
(1,'Muller', 'Ludivine', 52, 'F', '1963-01-22', 'IT')
GO

CREATE TABLE SalaryRange(
position VARCHAR(200),
lowerBound INT,
upperBound INT)
GO

INSERT INTO SalaryRange VALUES
('HR', 2000, 3000),
('Trade', 2500, 5000),
('IT', 2200, 6000),
('Finance', 5000, 10000)
GO

CREATE TABLE EmploymentStatus(
employeeId INT,
emplStatus VARCHAR (200))
GO

INSERT INTO EmploymentStatus VALUES
(1, 'CDD'),
(2, 'CDI'),
(3, 'Interim'),
(4, 'Trial period')
GO
-- Tables initialized

-- Each employee's position (INNER JOIN)
SELECT E.employeeId, E.lastName, E.firstName, E.position
FROM Employee E
INNER JOIN SalaryRange SR
ON E.position = SR.position

-- Each employee's position (CROSS APPLY)
SELECT E.employeeId, E.lastName, E.firstName, T.position
FROM Employee E
CROSS APPLY(
SELECT *
FROM SalaryRange SR
WHERE E.position = SR.position) T

-- Female trade employees
SELECT E.employeeId, E.lastName, E.firstName, E.gender, E.position
FROM Employee E
INNER JOIN SalaryRange SR
ON E.position = SR.position
WHERE E.gender = 'F' AND E.position = 'Trade'

-- CDI employees earning from 2000$ to 3000$
SELECT E.employeeId, E.lastName, E.firstName, E.position, ES.emplStatus, SR.lowerBound,  SR.upperBound
FROM SalaryRange SR
INNER JOIN Employee E
ON SR.position = E.position
INNER JOIN EmploymentStatus ES
ON E.employeeId = ES.employeeId
WHERE ES.emplStatus = 'CDI' AND SR.lowerBound = 2000 AND SR.upperBound = 3000

-- People with no contract
SELECT E.employeeId, E.lastName, E.firstName, ES.emplStatus,
CASE WHEN ES.emplStatus IS NULL THEN 'No contract' END AS 'No contract'
FROM Employee E
LEFT JOIN EmploymentStatus ES
ON E.employeeId = ES.employeeId
WHERE ES.emplStatus IS NULL

-- People with a contract
SELECT E.employeeId, E.lastName, E.firstName, ES.emplStatus,
CASE WHEN ES.emplStatus IS NOT NULL THEN 'Has a contract' END AS 'Has a contract'
FROM Employee E
RIGHT JOIN EmploymentStatus ES
ON E.employeeID = ES.employeeId

-- People with or without contract
SELECT E.employeeId, E.lastName, E.firstName, ES.emplStatus,
CASE WHEN ES.emplStatus IS NULL THEN 'No' ELSE 'Yes' END AS 'Has a contract'
FROM Employee E
FULL JOIN EmploymentStatus ES
ON E.employeeID = ES.employeeId

-- Delete the database
GO
USE master
GO
DROP DATABASE EXERCISE5
