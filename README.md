# 📊 SQL Exploratory Data Analysis (EDA) Project

A comprehensive data warehousing and SQL analytics project simulating a real-world retail scenario. This project demonstrates how to **design a schema**, **ingest structured data**, and **extract business insights** using only SQL — no BI tools or external languages.

---

## 🚀 Project Objectives

- 🏗️ Design and deploy a star-schema-style data warehouse using SQL
- 📥 Load structured `.csv` data into `fact` and `dimension` tables
- 🔍 Perform advanced exploratory data analysis (EDA)
- 📊 Generate actionable insights through queries
- 💡 Practice business intelligence thinking using raw SQL

---

## 🗃️ Database Architecture

**Database Name:** `DataWarehouseAnalytics`  
**Structure:** Star Schema with one fact table and two dimension tables

### 🔹 `gold_dim_customers`
| Column          | Description               |
|-----------------|---------------------------|
| `customer_id`   | Unique ID per customer    |
| `country`       | Country of residence      |
| `birthdate`     | DOB used to compute age   |
| `gender`        | Gender                    |

### 🔹 `gold_dim_products`
| Column         | Description              |
|----------------|--------------------------|
| `product_name` | Product name             |
| `category`     | Category of product      |
| `cost`         | Unit cost of the product |

### 🔹 `gold_fact_sales`
| Column         | Description                |
|----------------|----------------------------|
| `order_date`   | Date of the order          |
| `sales_amount` | Revenue for the transaction |
| `quantity`     | Units sold                 |
| `customer_key` | FK to customer dimension   |
| `product_key`  | FK to product dimension    |

---

## 🧱 Project Workflow

### 1️⃣ Database & Table Creation
The SQL script automatically:
- Drops and recreates `DataWarehouseAnalytics` DB
- Defines three core tables
- Enables local file import

### 2️⃣ Data Ingestion
CSV files loaded using `LOAD DATA LOCAL INFILE`, including:
- `gold.dim_customers.csv`
- `gold.dim_products.csv`
- `gold.fact_sales.csv`

> ⚠️ Note: Ensure `local_infile=1` is enabled in MySQL.

---

## 📊 Analysis Modules

All exploration is done using **pure SQL** — no Python, Excel, or dashboards involved.

### 🔎 1. Metadata Exploration
- Discover all tables and columns using `INFORMATION_SCHEMA`

### 🧭 2. Dimension Exploration
- List all unique countries and product categories
- Drill into category-subcategory-product hierarchies

### 📅 3. Date Exploration
- Identify the range of sales data available
- Analyze customer age demographics

### 📐 4. Measure Exploration
- Total revenue, quantity sold, average price
- Unique customers, products, and order counts

### 📦 5. Magnitude Exploration
- Customers by country and gender
- Products by category
- Revenue per category and per customer
- Distribution of sold items across regions

### 🏆 6. Ranking Analysis
- Top 5 products by revenue
- Worst-performing product lines
- Top 10 revenue-generating customers
- Customers with the fewest orders

---

## 🔧 Setup Instructions

### Prerequisites
- MySQL Server (v5.7+)
- SQL Client (MySQL Workbench, DBeaver, etc.)

### Steps
```bash
git clone https://github.com/Rahul-404/sql-exploratory-data-analysis-project.git
cd sql-exploratory-data-analysis-project
````

Then from your SQL client:

```sql
SOURCE 00_init_database.sql;
```

---

## 🧠 Skills Practiced

* SQL Data Modeling (Star Schema)
* Data Cleaning & Ingestion
* Joins, Aggregations, Filtering
* Window Functions & Subqueries
* Business-Oriented SQL Thinking

---

## 📚 Business Questions Answered

* Who are the top 10 customers by revenue?
* Which product categories are the most profitable?
* What regions generate the most sales volume?
* What are the slowest-moving product subcategories?
* What is the age distribution of high-spending customers?

---

## 📁 Folder Structure

```
sql-exploratory-data-analysis-project/
│
├── data/
│   ├── gold.dim_customers.csv
│   ├── gold.dim_products.csv
│   └── gold.fact_sales.csv
├── docs/
│   ├── Exploratory_Data_Analysis.ipynb
│   ├── parts-of-project.jpg
│   └── sql-eda.draw.io
├── scripts/
│   ├── 00_init_database.sql
│   ├── 01_data_exploration.sql
│   ├── 02_dimensions_exploration.sql
│   ├── 03_date_exploration.sql
│   ├── 04_measure_exploration.sql
│   ├── 05_magnitude_exploration.sql
│   └── 06_ranking_analysis.sql
└── README.md
```

---

## 🤝 Contribution

Pull requests and suggestions are welcome!
Please create an issue or submit a PR.

---

## 📄 License

This project is licensed under the **MIT License**.

---

## 🙋 About Me

**Author:** Rahul Shelke
🔗 [GitHub: @Rahul-404](https://github.com/Rahul-404)

