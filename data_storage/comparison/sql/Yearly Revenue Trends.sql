SELECT 
    dd.Year,
    SUM(fs.TotalRevenue) AS YearlyRevenue
FROM 
    Fact_Sales fs
JOIN 
    Dim_Date dd ON fs.DateID = dd.DateID
GROUP BY 
    dd.Year
ORDER BY 
    dd.Year;
