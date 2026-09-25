/*
Adidas USA Sales Performance Analysis
Author: Tejasri Panchagiri

These queries assume the cleaned dataset has been imported
into a table named sales_data.
*/

-- 1. Overall sales KPIs
SELECT
    SUM([Total Sales]) AS total_sales,
    SUM([Operating Profit]) AS total_operating_profit,
    SUM([Units Sold]) AS total_units_sold,
    SUM([Operating Profit]) / NULLIF(SUM([Total Sales]), 0)
        AS operating_margin
FROM sales_data;


-- 2. Sales and profit by retailer
SELECT
    [Retailer],
    SUM([Total Sales]) AS total_sales,
    SUM([Operating Profit]) AS total_operating_profit,
    SUM([Units Sold]) AS total_units_sold
FROM sales_data
GROUP BY [Retailer]
ORDER BY total_sales DESC;


-- 3. Product performance
SELECT
    [Product],
    SUM([Total Sales]) AS total_sales,
    SUM([Operating Profit]) AS total_operating_profit,
    SUM([Units Sold]) AS total_units_sold
FROM sales_data
GROUP BY [Product]
ORDER BY total_sales DESC;


-- 4. Regional sales performance
SELECT
    [Region],
    SUM([Total Sales]) AS total_sales,
    SUM([Operating Profit]) AS total_operating_profit
FROM sales_data
GROUP BY [Region]
ORDER BY total_sales DESC;


-- 5. Monthly sales trend
SELECT
    YEAR([Invoice Date]) AS sales_year,
    MONTH([Invoice Date]) AS sales_month,
    SUM([Total Sales]) AS total_sales,
    SUM([Operating Profit]) AS total_operating_profit
FROM sales_data
GROUP BY
    YEAR([Invoice Date]),
    MONTH([Invoice Date])
ORDER BY
    sales_year,
    sales_month;


-- 6. Sales by sales method
SELECT
    [Sales Method],
    SUM([Total Sales]) AS total_sales,
    COUNT(*) AS sales_records
FROM sales_data
GROUP BY [Sales Method]
ORDER BY total_sales DESC;


-- 7. Top five states by sales
SELECT TOP 5
    [State],
    SUM([Total Sales]) AS total_sales,
    SUM([Operating Profit]) AS total_operating_profit
FROM sales_data
GROUP BY [State]
ORDER BY total_sales DESC;


-- 8. Sales validation summary
SELECT
    [Sales Validation Status],
    COUNT(*) AS record_count,
    SUM([Total Sales]) AS total_sales
FROM sales_data
GROUP BY [Sales Validation Status]
ORDER BY record_count DESC;