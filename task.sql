CREATE DATABASE demo;
USE demo;
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary BIGINT CHECK (salary > 0),
    department VARCHAR(50),
    hire_date DATE
);
INSERT INTO employee VALUES
(1,'Ravi','ravi@gmail.com',50000,'IT','2023-01-15'),
(2,'Raju','raju@gmail.com',70000,'HR','2022-03-10'),
(3,'Ramya','ramya@gmail.com',80000,'IT','2021-05-20'),
(4,'Anil','anil@gmail.com',45000,'Finance','2020-08-12'),
(5,'Aruna','aruna@gmail.com',60000,'Marketing','2024-02-01'),
(6,'Kiran','kiran@gmail.com',55000,'IT','2019-06-18'),
(7,'Suresh','suresh@gmail.com',40000,'HR','2021-09-25'),
(8,'Madhu','madhu@gmail.com',35000,'Finance','2023-11-11'),
(9,'Rani','rani@gmail.com',65000,'IT','2022-07-30'),
(10,'Ashok','ashok@gmail.com',72000,'Testing','2020-12-05'),
(11,'Deepa','deepa@gmail.com',27000,'Marketing','2018-04-15'),
(12,'Naveen','naveen@gmail.com',68000,'IT','2023-06-01'),
(13,'Tarun','tarun@gmail.com',80000,'Finance','2022-01-10'),
(14,'Varun','varun@gmail.com',70000,'HR','2024-03-20'),
(15,'Kavya','kavya@gmail.com',56000,'Testing','2021-10-10');
ALTER TABLE employee
ADD phone_no VARCHAR(15);
ALTER TABLE employee
RENAME COLUMN phone_no TO mobile_no;
ALTER TABLE employee
MODIFY emp_name VARCHAR(100);
ALTER TABLE employee
DROP COLUMN mobile_no;
CREATE INDEX idx_salary
ON employee(salary);
CREATE VIEW emp_view AS
SELECT emp_name, salary
FROM employee;
SELECT * FROM employee;
SELECT emp_name, salary
FROM employee;
SELECT *
FROM employee
WHERE salary > 50000;
SELECT *
FROM employee
WHERE salary BETWEEN 40000 AND 70000;
SELECT *
FROM employee
WHERE department = 'IT';
SELECT *
FROM employee
WHERE department <> 'HR';
SELECT *
FROM employee
WHERE emp_name LIKE 'A%';
SELECT *
FROM employee
WHERE emp_name LIKE '%N';
SELECT *
FROM employee
WHERE emp_name LIKE '%RA%';
SELECT UPPER(emp_name)
FROM employee;
SELECT LOWER(emp_name)
FROM employee;
SELECT emp_name,
       LENGTH(emp_name)
FROM employee;
SELECT emp_name,
       LEFT(emp_name,3)
FROM employee;
SELECT REPLACE(emp_name,'a','*')
FROM employee;
SELECT CONCAT(emp_name,' - ',email)
FROM employee;
SELECT RPAD(emp_name,20,'*')
FROM employee;
SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();
SELECT *
FROM employee
WHERE YEAR(hire_date)=YEAR(CURDATE());
SELECT *
FROM employee
WHERE MONTH(hire_date)=MONTH(CURDATE())
AND YEAR(hire_date)=YEAR(CURDATE());
SELECT emp_name,
       DATEDIFF(CURDATE(),hire_date) AS days_worked
FROM employee;
SELECT emp_name,
       DATE_ADD(hire_date,INTERVAL 30 DAY)
FROM employee;
SELECT *
FROM employee
WHERE hire_date < '2020-01-01';
SELECT *
FROM employee
ORDER BY salary DESC;
SELECT *
FROM employee
ORDER BY department,salary DESC;
SELECT *
FROM employee
ORDER BY salary DESC
LIMIT 5;
SELECT COUNT(*)
FROM employee;
SELECT department,
       COUNT(*)
FROM employee
GROUP BY department;
SELECT MAX(salary)
FROM employee;
SELECT MIN(salary)
FROM employee;
SELECT AVG(salary)
FROM employee;
SELECT SUM(salary)
FROM employee;
SELECT department,
       COUNT(*)
FROM employee
GROUP BY department
HAVING COUNT(*) > 3;
SELECT department,
       AVG(salary)
FROM employee
GROUP BY department
HAVING AVG(salary) > 60000;
SELECT *
FROM employee
WHERE salary=(SELECT MAX(salary) FROM employee);
SELECT *
FROM employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;
SELECT *
FROM employee
ORDER BY salary DESC
LIMIT 1 OFFSET 2;
SELECT emp_name,
       COUNT(*)
FROM employee
GROUP BY emp_name
HAVING COUNT(*) > 1;
SELECT *
FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee);
SELECT *
FROM employee
WHERE salary < (SELECT AVG(salary) FROM employee);
UPDATE employee
SET salary = salary * 1.10
WHERE department='IT';
UPDATE employee
SET email='newmail@gmail.com'
WHERE emp_id=5;
DELETE FROM employee
WHERE salary < 20000;
DELETE FROM employee
WHERE hire_date < '2020-01-01';
START TRANSACTION;

INSERT INTO employee
VALUES(16,'Rahul','rahul@gmail.com',50000,'IT','2026-06-04');
ROLLBACK;
START TRANSACTION;

UPDATE employee
SET salary = salary + 5000
WHERE department='IT';
COMMIT;
