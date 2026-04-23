-- Project: SQL Data Analysis Project on a mid-sized online retailer.
-- File: 08_Trend_Analysis
-- Objective: Perform SQL queries on to help determine what customers are buying
----------------------------------------------------------------------------------------------------------------------
-- Monthly revenue trend
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(order_value) AS total_revenue
FROM orders
GROUP BY month
ORDER BY month;
-- Monthly revenue increases strongly in the first 13 months where revenue reached a peak on the 13th month
-- Monthly revenue has constantly been decreasing from that point showing a downwards trend in customer spending

-- Customer first vs latest order (MIN/MAX/LAG)
SELECT
	customer_id,
	MIN(order_date),
	MAX(order_date)
FROM orders
GROUP BY customer_id;
-- This identifies customer lifespan between purchases
-- This helps determine where the repeat business is coming from

-- Rolling 3 month revenue
WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', order_date) AS months,
        SUM(order_value) AS revenue
    FROM orders
    GROUP BY months
)

SELECT
    months,
    revenue,
    SUM(revenue) OVER (
        ORDER BY months
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS rolling_3m_revenue
FROM monthly_revenue;
-- The rolling average shows the smoothed trend 
-- This shows the same trend as the monthly revenue
-- If monthly revenue begins to consistently fall below the rolling average, it may indicate a sustained decline.