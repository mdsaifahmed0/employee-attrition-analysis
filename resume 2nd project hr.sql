CREATE DATABASE employee_project;
use employee_project;


SHOW TABLES;
USE employee_project;

SELECT *
FROM employees
LIMIT 10;


SELECT COUNT(*) FROM employees;
ALTER TABLE employees
MODIFY COLUMN StartDate DATE;

DESCRIBE employees;

-- Q1. What is the total number of employees?

SELECT COUNT(*) AS Total_Employees
FROM employees;


-- Q2. What is the employee count by status?

SELECT
    EmployeeStatus,
    COUNT(*) AS Employee_Count
FROM employees
GROUP BY EmployeeStatus;


-- Q3. What is the employee count by department?

SELECT
    DepartmentType,
    COUNT(*) AS Employee_Count
FROM employees
GROUP BY DepartmentType
ORDER BY Employee_Count DESC;


-- Q4. What is the employee count by gender?

SELECT
    GenderCode,
    COUNT(*) AS Employee_Count
FROM employees
GROUP BY GenderCode;


-- Q5. What is the employee status distribution by department?

SELECT
    DepartmentType,
    EmployeeStatus,
    COUNT(*) AS Employee_Count
FROM employees
GROUP BY DepartmentType, EmployeeStatus
ORDER BY DepartmentType;


-- Q6. What is the termination rate by department?

SELECT
    DepartmentType,
    COUNT(*) AS Total_Employees,
    SUM(EmployeeStatus = 'Terminated') AS Terminated_Employees,
    ROUND(
        SUM(EmployeeStatus = 'Terminated') * 100.0 / COUNT(*),
        2
    ) AS Termination_Rate
FROM employees
GROUP BY DepartmentType
ORDER BY Termination_Rate DESC;


-- Q7. What is the employee distribution by age group?

SELECT
    AgeGroup,
    COUNT(*) AS Employee_Count
FROM employees
GROUP BY AgeGroup
ORDER BY Employee_Count DESC;


-- Q8. What is the gender distribution across departments?

SELECT
    DepartmentType,
    GenderCode,
    COUNT(*) AS Employee_Count
FROM employees
GROUP BY DepartmentType, GenderCode
ORDER BY DepartmentType;


-- Q9. What is the average tenure by department?

SELECT
    DepartmentType,
    ROUND(AVG(TenureYears), 2) AS Avg_Tenure_Years
FROM employees
GROUP BY DepartmentType
ORDER BY Avg_Tenure_Years DESC;


-- Q10. What is the average tenure by employee status?

SELECT
    EmployeeStatus,
    COUNT(*) AS Employee_Count,
    ROUND(AVG(TenureYears), 2) AS Avg_Tenure
FROM employees
GROUP BY EmployeeStatus;


-- Q11. What is the employee distribution by performance score?

SELECT
    Performance_Score,
    COUNT(*) AS Employee_Count
FROM employees
GROUP BY Performance_Score
ORDER BY Employee_Count DESC;


-- Q12. What is the relationship between performance score and employee status?

SELECT
    Performance_Score,
    EmployeeStatus,
    COUNT(*) AS Employee_Count
FROM employees
GROUP BY Performance_Score, EmployeeStatus
ORDER BY Performance_Score;


-- Q13. What is the employee distribution by training type?

SELECT
    Training_Type,
    COUNT(*) AS Employee_Count
FROM employees
GROUP BY Training_Type
ORDER BY Employee_Count DESC;


-- Q14. What is the distribution of training outcomes?

SELECT
    Training_Outcome,
    COUNT(*) AS Employee_Count
FROM employees
GROUP BY Training_Outcome
ORDER BY Employee_Count DESC;


-- Q15. What is the average training cost?

SELECT
    ROUND(AVG(Training_Cost), 2) AS Avg_Training_Cost
FROM employees;

