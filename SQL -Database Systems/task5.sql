CREATE FUNCTION fn_GetDepartmentSalarySum
(
    @DepartmentName VARCHAR(50)
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @SalarySum DECIMAL(10, 2);
    
    SELECT @SalarySum = SUM(Salary)
    FROM EmployeeTable
    WHERE Department = @DepartmentName;
    
    RETURN @SalarySum;
END;

SELECT dbo.fn_GetDepartmentSalarySum('IT') AS IT_Salary_Sum;
