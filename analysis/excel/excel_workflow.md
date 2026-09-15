# Excel / Power Query workflow

This project can use Excel/Power Query as a practical preparation and validation layer before Power BI.

## Recommended sequence

1. Import the CSV tables into Power Query.
2. Set explicit data types for dates, integer keys, text attributes and numeric measures.
3. Check primary-key uniqueness in dimension tables.
4. Check for nulls in foreign-key columns and required business fields.
5. Check duplicate transaction identifiers in FactSales and FactReturns.
6. Standardize category, region, state and return-reason text values.
7. Reconcile sales amount, cost and profit calculations.
8. Load the validated tables into Power BI.

## Useful Excel validation checks

- COUNTIF / COUNTIFS for duplicate and exception checks
- XLOOKUP for key-to-attribute validation
- Pivot Tables for reconciliation by month/category/region
- Conditional Formatting for threshold breaches
- Power Query for repeatable transformations

The Excel layer is documented here as a companion portfolio workflow; no separate Excel workbook was supplied with this repository package.
