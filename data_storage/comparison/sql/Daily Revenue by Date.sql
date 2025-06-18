SELECT 
    dd.TransactionDate,
    SUM(fs.TotalRevenue) AS DailyRevenue
FROM 
    Fact_Sales fs
JOIN 
    Dim_Date dd ON fs.DateID = dd.DateID
WHERE 
    dd.TransactionDate BETWEEN '2002-01-01' AND '2024-12-31'
GROUP BY 
    dd.TransactionDate
ORDER BY 
    dd.TransactionDate;
