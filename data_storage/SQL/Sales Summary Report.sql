SELECT 
    dp.Category,
    SUM(fs.QuantitySold) AS TotalQuantitySold,
    SUM(fs.TotalRevenue) AS TotalRevenue,
    COUNT(DISTINCT fs.FactID) AS TransactionCount
FROM Fact_Sales fs
JOIN Dim_Product dp ON fs.ProductID = dp.ProductID
GROUP BY dp.Category;
