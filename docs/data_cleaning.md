# Data Cleaning and Transformation

The Adidas USA sales dataset was prepared using Power Query.

## Steps Performed

1. Removed four decorative rows from the Excel source.
2. Promoted the correct headers.
3. Assigned text, date, whole-number and decimal data types.
4. Trimmed and cleaned text columns.
5. Checked the complete dataset for nulls and errors.
6. Removed exact duplicate records.
7. Created Calculated Sales:
   Price per Unit × Units Sold
8. Added Sales Validation Status to identify:
   - Zero-sale records
   - Records matching calculated sales
   - Reported sales using a 10x scale
   - Records requiring review
9. Retained reported Total Sales while documenting the scale inconsistency.

## Final Dataset

- 9,648 records
- No null values
- No transformation errors
- Date range: January 2020–December 2021