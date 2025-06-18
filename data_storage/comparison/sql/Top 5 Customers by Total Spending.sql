SELECT TOP 5
    dc.BuyerID AS CustomerID,
    SUM(fs.TotalRevenue) AS TotalSpent
FROM 
    Fact_Sales fs
JOIN 
    Dim_Customer dc ON fs.CustomerID = dc.CustomerID
GROUP BY 
    dc.BuyerID
ORDER BY 
    TotalSpent DESC;
