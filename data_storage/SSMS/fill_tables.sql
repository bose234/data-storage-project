-- Insert data into Dim_Product
INSERT INTO Dim_Product (ProductName, Category, Version, ItemCode)
SELECT DISTINCT
    [Item_Name] AS ProductName,
    [Category],
    [Version],
    [Item_Code] AS ItemCode
FROM [warehouse].[dbo].[order_dataset];

-- Insert data into Dim_Customer
INSERT INTO Dim_Customer (BuyerID)
SELECT DISTINCT [Buyer_ID] AS BuyerID
FROM [warehouse].[dbo].[order_dataset];

-- Insert data into Dim_Date
INSERT INTO Dim_Date (TransactionDate, Day, Month, Year, Quarter)
SELECT DISTINCT
    [Date] AS TransactionDate,
    DAY([Date]) AS Day,
    MONTH([Date]) AS Month,
    YEAR([Date]) AS Year,
    DATEPART(QUARTER, [Date]) AS Quarter
FROM [warehouse].[dbo].[order_dataset];

-- Deduplicate Source Data Based on Business Logic
WITH CTE_Deduplicated AS (
    SELECT 
        dp.ProductID,
        dc.CustomerID,
        dd.DateID,
        od.[Final_Quantity] AS QuantitySold,
        od.[Total_Revenue] AS TotalRevenue,
        od.[Price_Reductions] AS PriceReduction,
        od.[Refunds],
        od.[Final_Revenue] AS FinalRevenue,
        od.[Sales_Tax] AS SalesTax,
        od.[Overall_Revenue] AS OverallRevenue,
        od.[Refunded_Item_Count] AS RefundedItemCount,
        od.[Purchased_Item_Count] AS PurchasedItemCount,
        ROW_NUMBER() OVER (PARTITION BY dp.ProductID, dc.CustomerID, dd.DateID ORDER BY od.[Date] DESC) AS RowNum
    FROM 
        [warehouse].[dbo].[order_dataset] od
    JOIN 
        Dim_Product dp ON od.[Item_Name] = dp.ProductName
    JOIN 
        Dim_Customer dc ON od.[Buyer_ID] = dc.BuyerID
    JOIN 
        Dim_Date dd ON od.[Date] = dd.TransactionDate
)
-- Insert Non-Duplicate Rows into Fact_Sales
INSERT INTO Fact_Sales (
    ProductID,
    CustomerID,
    DateID,
    QuantitySold,
    TotalRevenue,
    PriceReduction,
    Refunds,
    FinalRevenue,
    SalesTax,
    OverallRevenue,
    RefundedItemCount,
    PurchasedItemCount
)
SELECT 
    ProductID,
    CustomerID,
    DateID,
    QuantitySold,
    TotalRevenue,
    PriceReduction,
    Refunds,
    FinalRevenue,
    SalesTax,
    OverallRevenue,
    RefundedItemCount,
    PurchasedItemCount
FROM 
    CTE_Deduplicated
WHERE 
    RowNum = 1;
