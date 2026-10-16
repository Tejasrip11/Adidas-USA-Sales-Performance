-- STEP 2 (ETL): Build a clean, analysis-ready fact table from the raw upload
-- Transform: trim text, derive gender/category, recompute margin, flag data issues, add load timestamp
CREATE OR REPLACE TABLE `adidas-looker.adidas.sales_fact` AS
SELECT
  sale_id,
  TRIM(retailer)                                   AS retailer,
  retailer_id,
  invoice_date,
  TRIM(region)                                     AS region,
  TRIM(state)                                      AS state,
  TRIM(city)                                       AS city,
  TRIM(product)                                    AS product,
  IF(STARTS_WITH(product, 'Men'), 'Men', 'Women')  AS gender,
  IF(product LIKE '%Apparel%', 'Apparel', 'Footwear') AS category,
  TRIM(sales_method)                               AS sales_method,
  price_per_unit,
  units_sold,
  total_sales,
  operating_profit,
  SAFE_DIVIDE(operating_profit, NULLIF(total_sales, 0)) AS operating_margin,
  -- Data quality flag: reported sales differ from price x units
  ABS(total_sales - price_per_unit * units_sold) > 1   AS is_sales_mismatch,
  CURRENT_TIMESTAMP()                              AS loaded_at
FROM `adidas-looker.adidas.us_sales`
WHERE retailer IS NOT NULL;
