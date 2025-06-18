SELECT 
    dd.Month,
    SUM(fs.TotalRevenue) AS TotalRevenue,
    SUM(fs.Refunds) AS TotalRefunds,
    SUM(fs.SalesTax) AS TotalTaxCollected
FROM Fact_Sales fs
JOIN Dim_Date dd ON fs.DateID = dd.DateID
GROUP BY dd.Month
ORDER BY dd.Month;
