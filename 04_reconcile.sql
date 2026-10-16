-- STEP 4: Reconcile — fact table must match the raw source exactly
SELECT
  (SELECT COUNT(*) FROM `adidas-looker.adidas.us_sales`)   AS raw_rows,
  (SELECT COUNT(*) FROM `adidas-looker.adidas.sales_fact`) AS fact_rows,
  (SELECT ROUND(SUM(total_sales),2) FROM `adidas-looker.adidas.us_sales`)        AS raw_sales,
  (SELECT ROUND(SUM(total_sales),2) FROM `adidas-looker.adidas.sales_fact`)      AS fact_sales,
  (SELECT ROUND(SUM(total_sales),2) FROM `adidas-looker.adidas.monthly_summary`) AS summary_sales;
