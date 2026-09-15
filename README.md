# Xquizeet Export Pvt. Ltd. — Executive Sales & Profit Dashboard

An interactive Power BI portfolio project for FY2025–26 India sample data, designed to give management a compact view of sales, profitability, customer behavior, and product returns.

## Dashboard

The Power BI report contains four connected pages:

1. Executive Dashboard — revenue, profit, margin, orders, average order value, monthly performance, and revenue-vs-target tracking.
2. Sales Performance — regional revenue, category performance, monthly revenue, and target comparison.
3. Customer Insights — customer count, average order value, customer segments, and top customers by revenue.
4. Product & Returns — units sold, return rate, revenue by product category, return reasons, and monthly units/returns trends.

Navigation buttons and page actions are included to make the report usable as an interactive management dashboard.

## Key portfolio metrics

- Total Revenue: ₹8.97bn
- Total Profit: ₹1.29bn
- Profit Margin: 14.39%
- Total Orders: 184K
- Average Order Value: ₹48.89K
- Total Units Sold: 978K
- Total Returns: 19K

## Analytics workflow

Excel / Power Query → SQL → Python → Power BI

### Excel / Power Query
Used as a practical preparation and validation layer for data types, duplicates, null checks, standardization, reconciliation and repeatable transformations.

### SQL
Used for relational business analysis and KPI validation: revenue by region/category, monthly revenue vs target, customer segments, return reasons and top customers.

### Python
Python with Pandas is used for independent data-quality checks, KPI validation, category analysis and monthly trend exploration.

### Power BI
Power BI provides the semantic model, DAX measures, KPI cards, bar charts, trend charts, target comparisons, page navigation and report actions.

## Business questions

- How is revenue and profit performing over time?
- Which regions and categories contribute the most revenue?
- Are monthly revenues keeping pace with targets?
- Which customer segments and customers drive revenue?
- What are the major return reasons?
- How do units sold and returns move month by month?

## Tools

Power BI Desktop • Microsoft Excel / Power Query • SQL / MySQL • Python / Pandas

## Repository structure

README.md
analysis/sql/business_analysis.sql
analysis/python/eda.py
analysis/excel/excel_workflow.md
data/DataDictionary.csv
data/DimReturnReason.csv
data/README.md

dashboard/

## Publishing note

The source package contains customer, transaction, store and employee fields. Only publish raw records and the PBIX publicly if you have permission to share them. A PBIX can contain a copy of the data used by the report. For a public portfolio version, prefer anonymized/sample data and screenshots.

## Author

Anuj Yadav — Data Analyst
