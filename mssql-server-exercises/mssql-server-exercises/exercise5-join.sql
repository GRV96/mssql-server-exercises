CREATE DATABASE EXERCISE5
GO
USE EXERCISE5

-- Execute script exercise5-init.sql before the next statements.

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
