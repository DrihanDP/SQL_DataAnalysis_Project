-- Project: SQL Data Analysis Project on a mid-sized online retailer.
-- File: 03_Business_Analysis
-- Objective: Perform SQL queries on to help determine the business performance and what is going on at a high level.
----------------------------------------------------------------------------------------------------------------------
-- Total Number of customers
SELECT 
	COUNT(customer_id) as total_customers
FROM customers;
-- 12000 customers for a medium sized company. 
-- This establishes the current customer base size which can be used for further metrics

-- Total number of orders
SELECT
	COUNT(*) as total_orders
FROM orders;
-- 27729 total orders which helps quantify transaction volume and can be used alongside average order value to understand revenue drivers 

-- Total revenue generated
SELECT
	SUM(order_value) as total_revenue
FROM orders;
-- Total revenue is £2,768,581.40 
-- This provides a baseline for evaluating performance of the company
-- It can be broken down further to gain more insightful information surround customers, items, and order size

-- Average order value
SELECT
	ROUND(AVG(order_value), 2) as avg_order_value
FROM orders;
-- The average order value is £99.84
-- This indicates how much customers are spending on average per transaction
-- Increasing average order spending size, with dedicated strategies, can improve total revenue

-- All generated metrics displayed in one query.
SELECT
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(*) AS total_orders,
    SUM(order_value) AS total_revenue,
    ROUND(AVG(order_value), 2) AS avg_order_value
FROM orders;