-- Which 5 products generate the highest revenue ?

SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold_fact_sales f
LEFT JOIN gold_dim_products p
    ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;

-- What are the 5 worst-performing products in terms of sales ?

-- Solution without window function

SELECT
    p.subcategory,
    SUM(f.sales_amount) AS total_revenue
FROM gold_fact_sales f
LEFT JOIN gold_dim_products p
    ON p.product_key = f.product_key
GROUP BY p.subcategory
ORDER BY total_revenue DESC
LIMIT 5;

-- Solution with window function

SELECT *
FROM (
    SELECT
        p.product_name,
        SUM(f.sales_amount) AS total_revenue,
        ROW_NUMBER() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank_products
    FROM gold_fact_sales f
    LEFT JOIN gold_dim_products p
        ON p.product_key = f.product_key
    GROUP BY p.product_name
) t
WHERE rank_products <= 5
ORDER BY total_revenue DESC;

-- Find the top 10 customers who have generated the highest revenue

SELECT
    c.customer_key,
    c.first_name,
    c.last_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold_fact_sales f
LEFT JOIN gold_dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_revenue DESC
LIMIT 10;

-- The 3 customers with the fewest orders placed

SELECT
    c.customer_key,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT order_number) AS total_orders
FROM gold_fact_sales f
LEFT JOIN gold_dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_orders DESC
LIMIT 3;
