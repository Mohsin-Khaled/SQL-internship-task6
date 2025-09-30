DROP DATABASE IF EXISTS Employees_info;
CREATE DATABASE Employees_info;
USE Employees_info;

CREATE TABLE Employees(
employee_id INT,
name VARCHAR(100),
salary INT,
department_id INT
);

INSERT INTO Employees(employee_id, name, salary, department_id)
VALUES 
(1, 'Alice', 60000, 101),
(2, 'Bob', 45000, 102),
(3, 'Charlie', 70000, 103),
(4, 'Diana', 50000, 104),
(5, 'Ethan', 55000, 105),
(6, 'Frank', 65000, 103),
(7, 'Grace', 48000, 101),
(8, 'Helen', 72000, 102);

-- scalar subqery using '='
SELECT name, salary
FROM Employees
WHERE salary = (
SELECT AVG(salary)
FROM Employees
); -- Here avg(salary) will be 56000 and no employee earns exactly that salary so the result will be no rows

-- scalar subqery using '>'
SELECT name, salary
FROM Employees
WHERE salary > (
SELECT AVG(salary)
FROM Employees
);

-- Correlated subquery
SELECT e.name, e.salary
FROM Employees e
WHERE e.salary > (
SELECT AVG(salary)
FROM Employees
WHERE department_id = e.department_id
);

 -- Subquery using IN 
 SELECT name, department_id
FROM Employees
WHERE department_id IN (
SELECT department_id
FROM Employees
GROUP BY department_id
HAVING AVG(salary) > 55000
);

-- Subquery using EXISTS
SELECT e1.name, e1.department_id
FROM Employees e1
WHERE EXISTS (
SELECT 1
FROM Employees e2
WHERE e2.department_id = e1.department_id
AND e2.employee_id != e1.employee_id
);

-- Subquery using ALL
SELECT name, salary
FROM Employees
WHERE salary = ALL ( -- This returns only the person with the highest salary
SELECT MAX(salary)
FROM Employees
);

-- Subquery using ANY
SELECT name, salary
FROM Employees
WHERE salary > ANY ( -- This returns everyone except the person with the lowest salary.
SELECT salary
FROM Employees
);

-
 


 
 