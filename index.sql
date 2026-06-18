CREATE INDEX idx_employee_name
ON employee(name);
CREATE UNIQUE INDEX idx_employee_email
ON employee(email);
CREATE INDEX idx_emp_dept_salary
ON employee(department, salary);
DROP INDEX idx_employee_name ON employee;
SHOW INDEX FROM employee;
employee(id, name, department, salary, email, location)
SELECT * FROM employee
WHERE department = 'IT';