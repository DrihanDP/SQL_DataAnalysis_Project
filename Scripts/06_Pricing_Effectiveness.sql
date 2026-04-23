-- Project: SQL Data Analysis Project on a mid-sized online retailer.
-- File: 06_Pricing_Effectiveness
-- Objective: Perform SQL queries on to help determine how efficiently revenue is being generated
----------------------------------------------------------------------------------------------------------------------
-- List all orders above £100
SELECT
	customer_id,
	order_id,
	order_value
FROM orders
WHERE order_value > 100
ORDER BY order_value DESC;
-- This shows the customers that have had the highest single order values
-- This will give insight to high transaction customers and rentention to allow for further large purchases

-- Total discount per month
SELECT
	DATE_TRUNC('month', order_date) AS months,
	SUM(discount_applied) AS total_discount
FROM orders
GROUP BY months
ORDER BY months;
-- This displays the total monthly discounts given across all customers
-- There is a high variance on discounts month to month
-- However, 
-- This gives us a cost of promotions and can later be compared to customer retention rate
-- However, there is a significant drop during the Christmas period

-- Average order value by subscription status
SELECT
	is_subscribed,
	ROUND(AVG(order_value), 2) as avg_order_value
FROM customers INNER JOIN orders
	ON customers.customer_id = orders.customer_id
GROUP BY is_subscribed;
-- There is very little difference between the two. Not subscribed has a slightly higher average order value.
-- This suggests that the subscription program may not be increasing per-order spend

--Subscription vs non-subscription revenue comparison
SELECT
	is_subscribed,
	ROUND(SUM(order_value), 2) AS total_revenue,
FROM customers INNER JOIN orders
	ON customers.customer_id = orders.customer_id
GROUP BY is_subscribed
ORDER BY total_revenue DESC;
-- This shows that non-subscribers generate more total revenue, however, this is likely driven by their larger population