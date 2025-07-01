-- Explore All Countries our customers come from.

SELECT DISTINCT country FROM gold_dim_customers

-- Explore All Categories "The major Divisions"

SELECT DISTINCT category, subcategory, product_name FROM gold_dim_products
ORDER BY 1, 2, 3
