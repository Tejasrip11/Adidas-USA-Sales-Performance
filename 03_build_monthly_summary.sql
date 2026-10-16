-- STEP 3 (ETL): Aggregate table for fast monthly trend reporting
-- Uses a CTE and a window function for month-over-month growth
CREATE OR REPLACE TABLE `adidas-looker.adidas.monthly_summary` AS
WITH monthly AS (
  SELECT
    DATE_TRUNC(invoice_date, MONTH) AS sales_month,
    retailer,
    SUM(total_sales)      AS total_sales,
    SUM(operating_profit) AS operating_profit,
    SUM(units_sold)       AS units_sold
  FROM `adidas-looker.adidas.sales_fact`
  GROUP BY 1, 2
)
SELECT
  *,
  SAFE_DIVIDE(operating_profit, total_sales) AS operating_margin,
  SAFE_DIVIDE(
    total_sales - LAG(total_sales) OVER (PARTITION BY retailer ORDER BY sales_month),
    LAG(total_sales) OVER (PARTITION BY retailer ORDER BY sales_month)
  ) AS mom_growth
FROM monthly;
