-- Find the Total Sales
SELECT SUM(sales_amount) AS total_sales
FROM gold_fact_sales;

-- Find how many items are sold
SELECT SUM(quantity) AS total_quantity
FROM gold_fact_sales;

-- Find the average selling price
SELECT AVG(price) AS avg_price
FROM gold_fact_sales;

-- Find the Total number of orders
SELECT COUNT(order_number) AS total_orders       -- all orders (including duplicates)
FROM gold_fact_sales;

SELECT COUNT(DISTINCT order_number) AS total_unique_orders  -- unique orders
FROM gold_fact_sales;

-- Find the total number of products
SELECT COUNT(product_name) AS total_products     -- all product records
FROM gold_dim_products;

SELECT COUNT(DISTINCT product_name) AS unique_products      -- distinct product names
FROM gold_dim_products;

-- Find the total number of customers
SELECT COUNT(customer_key) AS total_customers
FROM gold_dim_customers;

-- Find the total number of customers that have placed an order
SELECT COUNT(DISTINCT customer_key) AS active_customers
FROM gold_fact_sales;
