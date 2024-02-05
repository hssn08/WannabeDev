CREATE PROCEDURE sp_minimum_avg_salary_dept
AS
BEGIN
    SELECT TOP 1 DepartmentName
    FROM (
        SELECT DepartmentName, AVG(Salary) AS AvgSalary
        FROM Employee
        GROUP BY DepartmentName
    ) AS AvgSalaries
    ORDER BY AvgSalary ASC
END
