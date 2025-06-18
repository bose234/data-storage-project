SELECT 
    dp.Category,
    dd.Month,
    dd.Year,
    SUM(fs.TotalRevenue) AS MonthlyRevenue
FROM 
    Fact_Sales fs
JOIN 
    Dim_Product dp ON fs.ProductID = dp.ProductID
JOIN 
    Dim_Date dd ON fs.DateID = dd.DateID
GROUP BY 
    dp.Category, dd.Month, dd.Year
ORDER BY 
    dd.Year, dd.Month, dp.Category;
