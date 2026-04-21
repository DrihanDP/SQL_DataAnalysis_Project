-- Project: SQL Data Analysis Project on a mid-sized online retailer.
-- File: 01_Exploratory_Analysis
-- Objectives: Gain an understanding of the datasets and determine some initial insight.
-- 			   Demonstate basic SQL query skills - (SELECT, COUNT, ROUND, SUM, DISTINCT)
----------------------------------------------------------------------------------------
-- Question 1: What is the total number of distinct customers?

SELECT
	COUNT(DISTINCT(customer_id)) AS Distinct_Customers
FROM customers;

-- There are 12000 unique customers have signed up to this company

-- Question 2: What was the first signup and latest signup

SELECT
	MIN(signup_date) AS Earliest_Signup,
	MAX(signup_date) AS Latest_Signup
FROM customers;

-- The earliest signup was on the 1st Jan 2023 whereas the latest signup was 31st Dec 2023

-- Question 3: What is the number of companies from each country that have signed up?

SELECT
	country,
	COUNT(*) AS country_count
FROM customers
GROUP BY country
ORDER BY country_count;

-- There are 7 countries, NL, DE, ES, FR, IT, US, and UK and the number of companies for each country is 601, 1170, 1198, 1199, 1243, 2459, 4130 respectively

-- Question 3: What is the least and most channel which the business found?

SELECT
	acquisition_channel,
	COUNT(*)
FROM customers
GROUP BY acquisition_channel
ORDER BY COUNT(*) DESC;

-- The company found oragnically 4793 times whereas found through social media only 1210 times.

-- Question 4: What is the max, min, and avg order values across all  for each country

SELECT
	MAX(order_value) AS max_value,
	MIN(order_value) AS min_value,
	ROUND(AVG(order_value), 2) AS avg_order_value
FROM orders;

-- Max order value is 556.12, min order value is 0.51, and the avg order value is 99.84

-- Question 5: Which payment method has the highest average order value?

SELECT
	payment_method,
	ROUND(AVG(order_value), 2) AS avg_order_value
FROM orders
GROUP BY payment_method
ORDER BY avg_order_value DESC;

-- Google Pay has the highest average order value of 100.77

-- Question 6: What is the top 3 product categories?

SELECT
	product_category,
	COUNT(*) AS amount_ordered_from_each_category
FROM order_items
GROUP BY product_category
ORDER BY COUNT(*) DESC
LIMIT 3;

-- Home, electronics, and accessories are the top 3 in that order.

-- Question 7: Show only the high spending orders where the company spend 300 or more

SELECT
	order_item_id,
	unit_price
FROM order_items
WHERE unit_price >= 300.00
ORDER BY unit_price DESC;