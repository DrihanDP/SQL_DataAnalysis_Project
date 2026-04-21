-- Project: SQL Data Analysis Project on a mid-sized online retailer.
-- File: 01_table_creation

-- Table 1
-- Customer data
-- Primary Key: customer_id
CREATE TABLE customers (
	customer_id INT PRIMARY KEY NOT NULL,
	signup_date DATE,
	country VARCHAR(2),
	acquisition_channel VARCHAR (20),
	is_subscribed INT
);

-- Table 2
-- Orders
-- Primary Key: order_id
-- Foreign Key: customer_id
CREATE TABLE orders (
	order_id INT PRIMARY KEY NOT NULL,
	customer_id INT,
	order_date DATE,
	order_value DECIMAL(6,2),
	discount_applied DECIMAL (6,2),
	payment_method VARCHAR(20),
	FOREIGN KEY("customer_id") REFERENCES customers("customer_id")
);

-- Table 3
-- Order Items
-- Primary Key: order_item_id
-- Foreign Key: order_id
CREATE TABLE order_items (
	order_item_id INT PRIMARY KEY NOT NULL,
	order_id INT,
	product_category VARCHAR(30),
	quantity INT,
	unit_price DECIMAL(6,2),
	FOREIGN KEY("order_id") REFERENCES orders ("order_id")
);

