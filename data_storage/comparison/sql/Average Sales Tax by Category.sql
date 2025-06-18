SELECT 
    dp.Category,
    AVG(fs.SalesTax) AS AvgSalesTax
FROM 
    Fact_Sales fs
JOIN 
    Dim_Product dp ON fs.ProductID = dp.ProductID
GROUP BY 
    dp.Category
ORDER BY 
    AvgSalesTax DESC;
