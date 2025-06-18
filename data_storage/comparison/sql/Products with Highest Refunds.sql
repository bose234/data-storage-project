SELECT TOP 10
    dp.ProductName,
    SUM(fs.Refunds) AS TotalRefunds
FROM 
    Fact_Sales fs
JOIN 
    Dim_Product dp ON fs.ProductID = dp.ProductID
GROUP BY 
    dp.ProductName
ORDER BY 
    TotalRefunds DESC;
