-- Q1. Count the total number of orders.
SELECT
	COUNT(*) AS total_order
FROM orders

-- Q2. Count the total number of customers.
SELECT
	COUNT(*) AS total_customers
FROM customers

-- Q3. Count the total number of order items.
SELECT
	COUNT(*) AS total_order_items
FROM order_items

-- Q4. Count the total number of products.
SELECT
	COUNT(*) AS total_product
FROM products

-- Q5. Count the total number of sellers.
SELECT
	COUNT(*) AS total_sellers
FROM sellers

-- Q6. Check for duplicate order IDs in the Orders table.
SELECT
	order_id,
	COUNT(*) AS total_order
FROM orders
GROUP BY 1
HAVING COUNT(*) > 1

-- Q7. Check for duplicate customer IDs in the Customers table.
SELECT
	customer_id,
	COUNT(*) AS total_customer
FROM customers
GROUP BY 1
HAVING COUNT(*) > 1

-- Q8. Check for missing product IDs in the Order Items table.
SELECT 
	order_id,
	product_id
FROM order_items
WHERE product_id IS NULL
	

-- Q9. Check for missing customer IDs in the Orders table.
SELECT 
	order_id,
	customer_id
FROM orders
WHERE customer_id IS NULL

-- Q10. Check for missing order IDs in the Payment table.
SELECT 
	order_id,
	payment_type
FROM payments
WHERE order_id IS NULL

-- Q11. Find the distinct values of order status.
SELECT 
	DISTINCT order_status
FROM orders

-- Q12. Find the minimum and maximum order purchase dates.
SELECT
	MIN(order_purchase_timestamp) AS min_date,
	MAX(order_purchase_timestamp) AS mmax_date
FROM orders

-- Q13. Check for NULL values in estimated delivery date and actual delivery date.
SELECT
    COUNT(*) FILTER (WHERE order_estimated_delivery_date IS NULL) AS estimated_nulls,
    COUNT(*) FILTER (WHERE order_delivered_customer_date IS NULL) AS actual_nulls
FROM orders;

-- Q14. Validate the delivery calculation.
SELECT
    order_id,
    order_purchase_timestamp,
    order_estimated_delivery_date,
    order_delivered_customer_date,
    
    (order_delivered_customer_date::date - order_purchase_timestamp::date) 
        AS actual_delivery_days,

    (order_estimated_delivery_date::date - order_purchase_timestamp::date) 
        AS estimated_delivery_days,

    CASE
        WHEN order_delivered_customer_date::date <= order_estimated_delivery_date::date
            THEN 'On Time'
        WHEN order_delivered_customer_date::date > order_estimated_delivery_date::date
            THEN 'Late'
        ELSE 'Not Delivered'
    END AS delivery_status

FROM orders;

-- Q15. Calculate the count of different order statuses.
SELECT
	order_status,
	COUNT(*) AS total_order
FROM orders
GROUP BY 1