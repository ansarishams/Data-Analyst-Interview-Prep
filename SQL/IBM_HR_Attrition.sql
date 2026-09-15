-- Q1. Count the total number of employees.
SELECT 
	COUNT(*) AS total_employee
FROM employee_attrition

-- Q2. Find the total number of employees who left the company.
SELECT 
	COUNT(*) AS left_employee
FROM employee_attrition
WHERE attrition = 'Yes'

-- Q3. Calculate the overall attrition rate.
SELECT
	COUNT(*) AS employeee_left,
	ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)*100.0
	/COUNT(*),
	2) AS attrition_rate
FROM employee_attrition

-- Q4. Find the total number of retained employees.
SELECT 
	COUNT(*) AS retained_employee
FROM employee_attrition
WHERE attrition = 'No'

-- Q5. Find the distinct values in the Gender column.
SELECT 
	DISTINCT gender
FROM employee_attrition

-- Q6. Find the distinct values in the Department column.
SELECT 
	DISTINCT department
FROM employee_attrition

-- Q7. Find the distinct values in the Job Role column.
SELECT 
	DISTINCT job_role
FROM employee_attrition

-- Q8. Count the number of employees by Marital Status.
SELECT
	marital_status,
	COUNT(*) AS total_employee
FROM employee_attrition
GROUP BY 1

-- Q9. Count the number of employees by Education Field.
SELECT
	education_field,
	COUNT(*) AS total_employee
FROM employee_attrition
GROUP BY 1

-- Q10. Find the average age of employees.
SELECT
	ROUND(AVG(age),2) AS avg_age
FROM employee_attrition

-- Q11. Find the average monthly income of employees.
SELECT
	ROUND(AVG(monthly_income),2) AS avg_monthly_income
FROM employee_attrition

-- Q12. Find the average number of years employees have been with the company.
SELECT
	ROUND(AVG(years_at_company),2) AS avg_year_at_company
FROM employee_attrition

-- Q13. Find the highest monthly income.
SELECT 
	MAX(monthly_income) AS highest_income
FROM employee_attrition

-- Q14. Find the lowest monthly income.
SELECT 
	MIN(monthly_income) AS lowest_income
FROM employee_attrition

-- Q15. Find the employees whose age is less than 30.
SELECT 
	*
FROM employee_attrition
WHERE age < 30