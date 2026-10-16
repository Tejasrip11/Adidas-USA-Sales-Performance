-- STEP 1: Validate the raw table before transforming it (data quality checks)
-- Expected: 9,648 rows, 0 duplicate sale_ids, 0 null keys, total sales = 899,902,125
SELECT
  COUNT(*)                                        AS row_count,
  COUNT(*) - COUNT(DISTINCT sale_id)              AS duplicate_ids,
  COUNTIF(retailer IS NULL OR invoice_date IS NULL) AS null_keys,
  COUNTIF(total_sales = 0)                        AS zero_sales_rows,
  COUNTIF(ABS(total_sales - price_per_unit * units_sold) > 1) AS sales_mismatch_rows,
  ROUND(SUM(total_sales), 2)                      AS total_sales,
  MIN(invoice_date)                               AS first_date,
  MAX(invoice_date)                               AS last_date
FROM `adidas-looker.adidas.us_sales`;
