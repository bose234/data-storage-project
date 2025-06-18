SELECT TOP 10 fs.CustomerID,
    COUNT(fs.FactID) AS TotalTransactions,
    SUM(fs.TotalRevenue) AS TotalRevenue
FROM Fact_Sales fs
JOIN Dim_Customer dc ON fs.CustomerID = dc.CustomerID
GROUP BY fs.CustomerID
ORDER BY TotalRevenue DESC;
