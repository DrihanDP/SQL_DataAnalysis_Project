-- Project: SQL Data Analysis Project on a mid-sized online retailer.
-- File: 07_Product_Insight
-- Objective: Perform SQL queries on to help determine what customers are buying
----------------------------------------------------------------------------------------------------------------------
-- Revenue by product category
SELECT
	product_category,
	SUM(quantity * unit_price) as total_revenue
FROM order_items
GROUP BY product_category
ORDER BY total_revenue DESC;
-- Revenue is evenly distributed across categories which shows the bussiness isn't reliant on a single product
-- Home has the total highest revenue while Beauty has the lowest

-- Average order value by product category
SELECT
    product_category,
    ROUND(SUM(quantity * unit_price) / COUNT(DISTINCT order_id), 2) AS revenue_per_order
FROM order_items
GROUP BY product_category
ORDER BY revenue_per_order DESC;
-- This query outputs the revenue per order contribution
-- Currently clothing and beauty are in the top 2 where as accessories is the lowest
-- Although clothing may not be the highest total revenue, it is an important category that contributes value per order