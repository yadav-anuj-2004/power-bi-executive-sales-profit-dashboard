-- Xquizeet FY2025-26 companion SQL analysis
-- Assumes the CSV tables have been loaded into a MySQL-compatible database.

-- 1. Revenue and profit by region
SELECT c.Region, ROUND(SUM(s.SalesAmount), 2) AS revenue, ROUND(SUM(s.ProfitAmount), 2) AS profit, ROUND(100 * SUM(s.ProfitAmount) / NULLIF(SUM(s.SalesAmount), 0), 2) AS profit_margin_pct
FROM FactSales s JOIN DimCustomer c ON c.CustomerKey = s.CustomerKey
GROUP BY c.Region ORDER BY revenue DESC;

-- 2. Revenue by product category
SELECT p.Category, ROUND(SUM(s.SalesAmount), 2) AS revenue, ROUND(SUM(s.ProfitAmount), 2) AS profit
FROM FactSales s JOIN DimProduct p ON p.ProductKey = s.ProductKey
GROUP BY p.Category ORDER BY revenue DESC;

-- 3. Monthly revenue vs revenue target
SELECT DATE_FORMAT(s.OrderDate, '%Y-%m') AS month, ROUND(SUM(s.SalesAmount), 2) AS actual_revenue, ROUND(SUM(t.RevenueTarget), 2) AS revenue_target, ROUND(SUM(s.SalesAmount) - SUM(t.RevenueTarget), 2) AS variance
FROM FactSales s JOIN DimProduct p ON p.ProductKey = s.ProductKey
JOIN FactTargets t ON t.TargetMonth = DATE_FORMAT(s.OrderDate, '%Y-%m-01') AND t.Category = p.Category AND t.StoreKey = s.StoreKey
GROUP BY DATE_FORMAT(s.OrderDate, '%Y-%m') ORDER BY month;

-- 4. Customer-segment revenue and customer count
SELECT CustomerSegment, COUNT(DISTINCT CustomerKey) AS customers, ROUND(SUM(SalesAmount), 2) AS revenue, ROUND(SUM(ProfitAmount), 2) AS profit
FROM FactSales s JOIN DimCustomer c ON c.CustomerKey = s.CustomerKey
GROUP BY CustomerSegment ORDER BY revenue DESC;

-- 5. Return reasons
SELECT r.ReturnReason, COUNT(*) AS return_lines, SUM(fr.QuantityReturned) AS units_returned, ROUND(SUM(fr.RefundAmount), 2) AS refund_amount
FROM FactReturns fr JOIN DimReturnReason r ON r.ReturnReasonKey = fr.ReturnReasonKey
GROUP BY r.ReturnReason ORDER BY units_returned DESC;

-- 6. Top 10 customers by revenue
SELECT c.CustomerID, c.CustomerName, ROUND(SUM(s.SalesAmount), 2) AS revenue
FROM FactSales s JOIN DimCustomer c ON c.CustomerKey = s.CustomerKey
GROUP BY c.CustomerID, c.CustomerName ORDER BY revenue DESC LIMIT 10;
