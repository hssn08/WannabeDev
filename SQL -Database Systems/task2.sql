CREATE PROCEDURE display_employees(IN department_name VARCHAR(50), IN max_salary DECIMAL(10,2))
BEGIN
  SELECT first_name, last_name, salary 
  FROM employees 
  WHERE department_name = department_name AND salary < max_salary;
END;
