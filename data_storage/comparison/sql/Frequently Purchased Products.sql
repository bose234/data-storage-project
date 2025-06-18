SELECT TOP 10
    dp.ProductName,
    SUM(fs.QuantitySold) AS TotalQuantity
FROM 
    Fact_Sales fs
JOIN 
    Dim_Product dp ON fs.ProductID = dp.ProductID
GROUP BY 
    dp.ProductName
ORDER BY 
    TotalQuantity DESC;
