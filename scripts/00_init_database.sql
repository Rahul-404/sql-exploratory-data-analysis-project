/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouseAnalytics' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, this script creates a schema called gold
	
WARNING:
    Running this script will drop the entire 'DataWarehouseAnalytics' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

-- Drop the 'DataWarehouseAnalytics' database if it exists
DROP DATABASE IF EXISTS DataWarehouseAnalytics;

-- (Optional) Recreate the database
CREATE DATABASE DataWarehouseAnalytics;


USE DataWarehouseAnalytics;

-- Create Schemas

CREATE TABLE gold_dim_customers(
	customer_key int,
	customer_id int,
	customer_number nvarchar(50),
	first_name nvarchar(50),
	last_name nvarchar(50),
	country nvarchar(50),
	marital_status nvarchar(50),
	gender nvarchar(50),
	birthdate date,
	create_date date
);

CREATE TABLE gold_dim_products(
	product_key int ,
	product_id int ,
	product_number nvarchar(50) ,
	product_name nvarchar(50) ,
	category_id nvarchar(50) ,
	category nvarchar(50) ,
	subcategory nvarchar(50) ,
	maintenance nvarchar(50) ,
	cost int,
	product_line nvarchar(50),
	start_date date 
);

CREATE TABLE gold_fact_sales(
	order_number nvarchar(50),
	product_key int,
	customer_key int,
	order_date date,
	shipping_date date,
	due_date date,
	sales_amount int,
	quantity tinyint,
	price int 
);

SET GLOBAL local_infile = 1;

SHOW VARIABLES LIKE 'local_infile';

-- Truncate tables
TRUNCATE TABLE gold_dim_customers;
TRUNCATE TABLE gold_dim_products;
TRUNCATE TABLE gold_fact_sales;

-- Load data into gold_dim_customers
LOAD DATA LOCAL INFILE 'gold.dim_customers.csv'
INTO TABLE gold_dim_customers
FIELDS TERMINATED BY ','
IGNORE 1 LINES;
-- IGNORE 1 ROWS;

Load data into gold_dim_products
LOAD DATA LOCAL INFILE 'gold.dim_products.csv'
INTO TABLE gold_dim_products
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

-- Load data into gold_fact_sales
LOAD DATA LOCAL INFILE 'gold.fact_sales.csv'
INTO TABLE gold_fact_sales
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

