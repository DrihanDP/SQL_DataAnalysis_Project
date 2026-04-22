-- Project: SQL Data Analysis Project on a mid-sized online retailer.
-- File: 05_Customer_Behaviour
-- Objective: Perform SQL queries on to help determine what customers are doing and how they behave.
----------------------------------------------------------------------------------------------------------------------
-- Count of subscribed vs non-subscribed customers
SELECT
	is_subscribed,
	COUNT(is_subscribed) AS subscribed_count,
	ROUND((COUNT(is_subscribed) / SUM(COUNT(is_subscribed)) OVER()) * 100, 2) AS percentage_subscribed
FROM customers
GROUP BY is_subscribed;
-- There is a large quanity of customers that have not subscribed at 54.7% compared to those who have at 45.3%
-- This suggests there is room to increase subscription uptake which could drive higher customer value

-- Customers that have 2 or more orders
SELECT
	customer_id,
	COUNT(customer_id) as order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(customer_id) >= 2
ORDER BY order_count DESC;
-- This gives an insight on which customers provide the most repeat purchases
-- These customers are key to long-term revenue

-- Total revenue per customer value
SELECT
    customer_id,
    SUM(order_value) AS total_revenue
FROM orders
GROUP BY customer_id
ORDER BY total_revenue DESC;
-- This gives the total revenue for each customer and will show individual customer value
-- This will help identify whether the business relies on a small number of high-value customers or large group of customers

-- Rank customers by total spend
WITH customer_totals AS (
	SELECT
	    customer_id,
	    SUM(order_value) AS total_revenue
	FROM orders
	GROUP BY customer_id
	ORDER BY total_revenue DESC
)
SELECT
	customer_id,
	total_revenue,
	RANK() OVER(ORDER BY total_revenue DESC)
		AS customer_rank
FROM customer_totals
LIMIT 10;
-- This shows the top 10 customers with the highest total revenue ranked in order of most spent
-- This highlights VIP customers which will allow for retention strategies and personalised marketing