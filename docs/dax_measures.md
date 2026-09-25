# DAX Measures and Date Table

This document contains the primary DAX calculations used in the Adidas USA Sales Performance dashboard.

## Date Table

```DAX
DateTable =
ADDCOLUMNS(
    CALENDAR(
        MIN(sales_data[Invoice Date]),
        MAX(sales_data[Invoice Date])
    ),
    "Year", YEAR([Date]),
    "Month Number", MONTH([Date]),
    "Month", FORMAT([Date], "MMMM"),
    "Month Short", FORMAT([Date], "MMM"),
    "Year Month", FORMAT([Date], "YYYY-MM"),
    "Quarter", "Q" & FORMAT([Date], "Q")
)
```

The date table provides a continuous calendar between the minimum and maximum invoice dates. It supports year, month, quarter and monthly-trend analysis.

The Date column was marked as the table’s date field and connected to `sales_data[Invoice Date]` through an active one-to-many relationship.

## Total Sales Amount

```DAX
Total Sales Amount =
SUM(sales_data[Total Sales])
```

Calculates total reported sales within the current filter context.

## Total Units Sold

```DAX
Total Units Sold =
SUM(sales_data[Units Sold])
```

Calculates the total number of units sold within the current filter context.

## Total Operating Profit

```DAX
Total Operating Profit =
SUM(sales_data[Operating Profit])
```

Calculates the total operating profit within the current filter context.

## Operating Margin Percentage

```DAX
Operating Margin % =
DIVIDE(
    [Total Operating Profit],
    [Total Sales Amount],
    0
)
```

Calculates the weighted operating margin by dividing total operating profit by total sales. The `DIVIDE` function safely returns zero when total sales equal zero.

## Sales Records

```DAX
Sales Records =
COUNTROWS(sales_data)
```

Counts the number of sales records within the current filter context.

## Measure Formatting

* Total Sales Amount: Currency with two decimal places
* Total Operating Profit: Currency with two decimal places
* Total Units Sold: Whole number
* Operating Margin Percentage: Percentage with two decimal places
* Sales Records: Whole number

## Dashboard Totals

When no filters are applied, the dashboard reports:

* Total Sales Amount: $899.90M
* Total Operating Profit: $332.13M
* Total Units Sold: 2.48M
* Operating Margin: 36.91%
* Sales Records: 9,648
