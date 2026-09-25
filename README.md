# Adidas USA Sales Performance Analysis

## Project Status

In progress

## Project Overview

This portfolio project uses a publicly available Adidas USA sales sample dataset to analyze sales, operating profit, product performance, retailer performance, regional trends, and sales channels during 2020 and 2021.

The project demonstrates data cleaning, data-quality validation, SQL analysis, dimensional modeling, Power BI dashboard development, DAX measures, and business recommendations.


## Business Objectives

- Evaluate total sales, units sold, operating profit, and operating margin.
- Identify high-performing and underperforming products.
- Compare retailer performance.
- Analyze sales and profitability across regions, states, and cities.
- Compare in-store, online, and outlet sales methods.
- Identify monthly and yearly performance trends.
- Detect data-quality issues and reconcile financial calculations.
- Recommend actions to improve sales and operating performance.

## Tools

- Excel
- SQL
- Power BI
- DAX
- Power Query
- Git and GitHub

## Planned Data Model

- `fact_sales`
- `dim_date`
- `dim_product`
- `dim_retailer`
- `dim_location`

## Project Structure

```text
data/
  raw/
  processed/
sql/
powerbi/
docs/
images/

## Dashboard Preview

### Executive Overview

![Executive Overview](images/executive_overview.png)

### Retailer Analysis

![Retailer Analysis](images/retailer_analysis.png)

## Project Documentation

- [Data Cleaning and Transformation](docs/data_cleaning.md)
- [DAX Measures and Date Table](docs/dax_measures.md)
- [SQL Analysis Queries](sql/analysis_queries.sql)

## Key Insights

- Total sales reached **$899.90M**, generating **$332.13M** in operating profit.
- The overall operating margin was **36.91%**, with **2.48M units sold**.
- **West Gear** was the highest-performing retailer, contributing approximately **$243M** in sales.
- The **West** was the strongest region, generating approximately **$270M** in sales.
- **Men's Street Footwear** was the leading product category, with approximately **$209M** in sales.
- **In-store sales** represented the largest sales method at **39.63%**, followed by Outlet at **32.85%** and Online at **27.52%**.
- Sales performance increased significantly during **2021** compared with 2020.