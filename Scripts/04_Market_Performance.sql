-- Project: SQL Data Analysis Project on a mid-sized online retailer.
-- File: 04_Market_Performance
-- Objective: Determine which area in the market is performing
-----------------------------------------------------------------------
-- Orders per acqusition channel
SELECT
	acquisition_channel,
	COUNT(order_id) AS number_of_orders
FROM orders INNER JOIN customers
	ON orders.customer_id = customers.customer_id
GROUP BY acquisition_channel
ORDER BY number_of_orders DESC;
-- This query drives insight into which channels drives order volume
-- The company gains customers organically the most and through socials the least. 
-- With the right social media marketing strategy, the company could increase customer acquisition

-- Revenue by country
SELECT
	country,
	SUM(order_value) AS total_revenue,
	ROUND(SUM(order_value) / COUNT(DISTINCT customers.customer_id), 2) AS revenue_per_customer_per_country
FROM orders INNER JOIN customers
	on orders.customer_id = customers.customer_id
GROUP BY country
ORDER BY total_revenue DESC;
-- The UK has the largest total revnue whereas the Netherlands have the lowest, ~9x lower than the UK
-- This indicates that the largest volume of sales are coming from the UK, which is likely driven by a larger customer base
-- There could also be growth opportunities in the Netherlands to increase sales

-- Revenue by acquisition channel
SELECT
	acquisition_channel,
	SUM(order_value) AS total_revenue
FROM orders INNER JOIN customers
	on orders.customer_id = customers.customer_id
GROUP BY acquisition_channel
ORDER BY total_revenue DESC;
-- Similar to the orders per acqusition channel query, organic had the highest revenue and social has the lowest.
-- It shows organic drives value to the company and that there are opportunities to gain more growth through social media strategies.

-- Average order value by acquisition channel
SELECT
	acquisition_channel,
	ROUND(AVG(order_value), 2) AS average_revenue
FROM orders INNER JOIN customers
	on orders.customer_id = customers.customer_id
GROUP BY acquisition_channel
ORDER BY average_revenue DESC;
-- From this query, email has the highest average order value which identifies it as a high value  manner of acquisition
-- This indicates that although organic drives the highest total revenue, email has the higher value per transaction
