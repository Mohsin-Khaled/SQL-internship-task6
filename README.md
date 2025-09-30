
# 🔗 SQL Developer Internship - Task 6

This repository contains the solution for **Task 6: SQL Subqueries in MySQL** from the SQL Developer Internship program.

---

## 📝 Task Overview
- **Objective**:  Use subqueries in SELECT, WHERE, and FROM
- **Tools**: MySQL Workbench  
- **Deliverables**: SQL script showcasing scalar, correlated, and multi-row subqueries.

---

## 📂 Files in this Repository
- **sql-task-6.sql** → SQL script containing database setup, sample data, and subquery examples.
- **Task Screenshot** → Reference outputs for each subquery type.

---

## 🗂️ Database & Table

The database created is **Employees_info**, with one table: **Employees**.

```sql
CREATE DATABASE Employees_info;
USE Employees_info;

CREATE TABLE Employees(
  employee_id INT,
  name VARCHAR(100),
  salary INT,
  department_id INT
);
```

## 📥 Sample Data

```sql
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
```

---

## 🔍 Implemented Subquery Types With Screenshots

### Scalar Subquery using `=`
```sql
SELECT name, salary
FROM Employees
WHERE salary = (
  SELECT AVG(salary)
  FROM Employees
);
```
<img src= "https://github.com/user-attachments/assets/5328fcf5-c847-4d25-8a72-ce98223af8cd"  width="45%" />
<img src= "https://github.com/user-attachments/assets/960fa00f-35de-428e-8477-f4f551144317"  width="45%" />

### Scalar Subquery using `>`
```sql
SELECT name, salary
FROM Employees
WHERE salary > (
  SELECT AVG(salary)
  FROM Employees
);
```
<img src= "https://github.com/user-attachments/assets/bed49aed-0022-41c2-ba1c-24d6d66dfe40" width="45%" />
<img src= "https://github.com/user-attachments/assets/b3714c7f-fb43-4bd7-9469-7b116db76538" width="45%" />

### Correlated Subquery
```sql
SELECT e.name, e.salary
FROM Employees e
WHERE e.salary > (
  SELECT AVG(salary)
  FROM Employees
  WHERE department_id = e.department_id
);
```
<img src= "https://github.com/user-attachments/assets/32c90cc7-129b-4f8a-88f9-a453a0f9cee5" width="45%" /> 
<img src= "https://github.com/user-attachments/assets/610faf7e-25df-4c53-a196-cbdfab752960" width="45%" />



### Subquery using `IN`
```sql
SELECT name, department_id
FROM Employees
WHERE department_id IN (
  SELECT department_id
  FROM Employees
  GROUP BY department_id
  HAVING AVG(salary) > 55000
);
```
<img src= "https://github.com/user-attachments/assets/6ab21107-47f9-4823-ba4c-c73b9e7f0e98" width="45%" />
<img src= "https://github.com/user-attachments/assets/e9fb0a46-54a7-4855-a94f-eecaf06b1447" width="45%" />

### Subquery using `EXISTS`
```sql
SELECT e1.name, e1.department_id
FROM Employees e1
WHERE EXISTS (
  SELECT 1
  FROM Employees e2
  WHERE e2.department_id = e1.department_id
  AND e2.employee_id != e1.employee_id
);
```
<img src= "https://github.com/user-attachments/assets/fcd4a70c-883e-467b-a981-619d2a875750" width="45%" />
<img src= "https://github.com/user-attachments/assets/de1100f7-4cfc-47d6-ba32-6a09ceb06882" width="45%" />

### Subquery using `ALL`
```sql
SELECT name, salary
FROM Employees
WHERE salary = ALL (
  SELECT MAX(salary)
  FROM Employees
);
```
<img src= "https://github.com/user-attachments/assets/d59769ac-7915-4769-928e-438791e1934d" width="45%" />
<img src= "https://github.com/user-attachments/assets/c085dce4-1784-4780-b842-600d9d56bb5f" width="45%" />


### Subquery using `ANY`
```sql
SELECT name, salary
FROM Employees
WHERE salary > ANY (
  SELECT salary
  FROM Employees
);
```
<img src= "https://github.com/user-attachments/assets/faf456d4-82e5-4cdb-9bf9-daaaa600c131" width="45%" />
<img src= "https://github.com/user-attachments/assets/a23264a4-2aac-41fa-8600-3b37042cf328" width="45%" />

---

## 📌 Key Learning Points
- Scalar subqueries return a single value for comparison.
- Correlated subqueries depend on outer query rows.
- Multi-row subqueries allow flexible filtering using `IN`, `EXISTS`, `ALL`, and `ANY`.

---

✅ **Completed Task 6: SQL Subqueries in MySQL**

 
