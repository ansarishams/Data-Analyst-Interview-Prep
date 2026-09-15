-- Q1. Count the total number of customers.
SELECT COUNT(*) AS total_customer
FROM telco_churn

-- Q2. Find the total number of churned customers.
SELECT COUNT(*) AS total_customer
FROM telco_churn
WHERE churn = 'Yes'

-- Q3. Find the total number of retained customers.
SELECT COUNT(*) AS total_customer
FROM telco_churn
WHERE churn = 'No'

-- Q4. Calculate the overall churn rate.
SELECT  
	COUNT(*) AS total_customer,
	ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)*100.0
	/COUNT(*),
	2) AS churn_rate
FROM telco_churn


-- Q5. Calculate the overall retention rate.
SELECT 
	COUNT(*) AS total_customer,
	ROUND(SUM(CASE WHEN churn = 'No' THEN 1 ELSE 0 END)*100.0
	/COUNT(*),
	2) AS retaintion_rate
FROM telco_churn

-- Q6. Find the unique contract types in the dataset.
SELECT 
	DISTINCT contract
FROM telco_churn

-- Q7. Find the unique payment methods in the dataset.
SELECT 
	DISTINCT payment_method
FROM telco_churn

-- Q8. Find the unique internet service types in the dataset.
SELECT 
	DISTINCT internet_service
FROM telco_churn

-- Q9. Find the distinct values in the Churn column and their frequencies.
SELECT  
	churn,
	COUNT(*) AS frequency
FROM telco_churn
GROUP BY 1

-- Q10. Show the complete details of all churned customers.
SELECT 
	*
FROM telco_churn
WHERE churn = 'Yes'

-- Q11. Find churned customers whose monthly charge is $70 or more.
SELECT 
	*
FROM telco_churn
WHERE churn = 'Yes' AND monthly_charges >= 70


-- Q12. Find customers whose tenure is less than 12 months.
SELECT 
	*
FROM telco_churn 
WHERE tenure < 12

-- Q13. Find customers whose monthly charge is higher than the average monthly charge.
SELECT 
	*
FROM telco_churn
WHERE monthly_charges > (SELECT AVG(monthly_charges) FROM telco_churn)

-- Q14. Find the maximum monthly charge.
SELECT 
	MAX(monthly_charges) AS max_monthly_charges
FROM telco_churn

-- Q15. Calculate the minimum, maximum, and average tenure.
SELECT
	MIN(tenure) AS min_tenure,
	MAX(tenure) AS max_tenure,
	ROUND(AVG(tenure),2) AS avg_tenure
FROM telco_churn