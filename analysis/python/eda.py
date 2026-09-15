"""Companion Python EDA / KPI validation for the Xquizeet sample dataset."""
from pathlib import Path
import pandas as pd

ROOT = Path(__file__).resolve().parents[2]
DATA = ROOT / "data"
sales = pd.read_csv(DATA / "FactSales.csv", parse_dates=["OrderDate"])
returns = pd.read_csv(DATA / "FactReturns.csv", parse_dates=["ReturnDate"])
customers = pd.read_csv(DATA / "DimCustomer.csv")
products = pd.read_csv(DATA / "DimProduct.csv")

print("FactSales rows:", len(sales))
print("Duplicate SalesLineID:", sales["SalesLineID"].duplicated().sum())
print("Missing values in FactSales:")
print(sales.isna().sum().sort_values(ascending=False).head(10))

revenue = sales["SalesAmount"].sum()
profit = sales["ProfitAmount"].sum()
orders = sales["OrderID"].nunique()
units = sales["Quantity"].sum()
margin = profit / revenue if revenue else 0
aov = revenue / orders if orders else 0

print("\nKPI validation")
print(f"Revenue: ₹{revenue:,.2f}")
print(f"Profit: ₹{profit:,.2f}")
print(f"Profit margin: {margin:.2%}")
print(f"Orders: {orders:,}")
print(f"Units: {units:,}")
print(f"Average order value: ₹{aov:,.2f}")
print(f"Returns: {len(returns):,}")

cat = (sales.merge(products[["ProductKey", "Category"]], on="ProductKey", how="left").groupby("Category", as_index=False)["SalesAmount"].sum().sort_values("SalesAmount", ascending=False))
print("\nRevenue by category")
print(cat.to_string(index=False))

monthly = sales.assign(Month=sales["OrderDate"].dt.to_period("M").astype(str)).groupby("Month", as_index=False)["SalesAmount"].sum()
print("\nMonthly revenue")
print(monthly.to_string(index=False))
