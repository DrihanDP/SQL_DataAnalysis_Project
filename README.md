# **E-commerce Revenue & Customer Analytics Project**
## Overview
This project analyses revenue performance, customer behaviour, and product trends for a simulated e-commerce business using SQL and Python.

The analysis focuses on answering key business questions:
* What is the revenue trend over time?
* Which channels and products drive the most value?
* How is revenue distributed across customers?

## Context
The data is from a mid-sized e-commerce company that is operating across multiple different acquisition channels and product categories.

The business wants to focus on the following:
* Increasing revenue growth
* Improving marketing efficiency
* Understanding customer value

## Dataset Structure
The project consists of three relational tables:
* Customers - customer demographic, acquistion channels, subscription status
* Orders - order level transaction, revenue and discounts, order timestamps
* Order Items - product level detail per order, quantity and unit price, product categories

## Tool & Technologies used
* SQL (PostgreSQL) -> Data storage and extraction
* Python (Pandas, Matplotlib) -> Analysis and visualisation
* Jupyter Notebook -> End to end workflow

## Key Analysis & Insights
### Revenue Trends
* Monthly revenue fluctuates but a rolling 3 month average reveals underlying trends
### Channel Performance
* Organic drives volume but other channels contribute high value per order
### Product Performance
* Categories play different roles where some drive volume but others increase basket size
### Customer Distribution
* Revenue is skewed significantly to the right with a small group of customers contributing a large share

## **Visuals**
Revenue trend (with rolling average)
Revenue by channel
Revenue by product category
Revenue per order by category
Customer revenue distribution

## **Recommendations**
1. Focus on retaining high value customers
2. Invest in high performing acquisition channels 
3. Balance volume and basket size by optimising product mix
4. Use metrics to guide decisions for long term growth

## **Structure**
├── data/  
├── sql/  
├── notebooks/  
│ └── python_analysis.ipynb  
├── README.md  

## **Notes**
* Dataset is synthetic and for demonstration purposes
* Focus is on analytical approach and insight generation

## **Skills demonstrated**
SQL, data analysis, data visualisation, and business insight development
