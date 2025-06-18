SELECT 
    dp.Category,
    SUM(fs.RefundedItemCount) AS TotalRefundedItems,
    SUM(fs.Refunds) AS TotalRefunds
FROM Fact_Sales fs
JOIN Dim_Product dp ON fs.ProductID = dp.ProductID
GROUP BY dp.Category
ORDER BY TotalRefunds DESC;
