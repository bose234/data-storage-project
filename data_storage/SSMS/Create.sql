-- Create Dimension Table: Dim_Product
CREATE TABLE Dim_Product (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(255),
    Category NVARCHAR(100),
    Version NVARCHAR(50),
    ItemCode NVARCHAR(50)
);

-- Create Dimension Table: Dim_Customer
CREATE TABLE Dim_Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    BuyerID NVARCHAR(50)
);

-- Create Dimension Table: Dim_Date
CREATE TABLE Dim_Date (
    DateID INT PRIMARY KEY IDENTITY(1,1),
    TransactionDate DATE,
    Day INT,
    Month INT,
    Year INT,
    Quarter INT
);

-- Create Fact Table: Fact_Sales
CREATE TABLE Fact_Sales (
    FactID INT IDENTITY(1,1) PRIMARY KEY, -- New Surrogate Key
    ProductID INT NOT NULL,
    CustomerID INT NOT NULL,
    DateID INT NOT NULL,
    QuantitySold INT,
    TotalRevenue DECIMAL(18, 2),
    PriceReduction DECIMAL(18, 2),
    Refunds DECIMAL(18, 2),
    FinalRevenue DECIMAL(18, 2),
    SalesTax DECIMAL(18, 2),
    OverallRevenue DECIMAL(18, 2),
    RefundedItemCount INT,
    PurchasedItemCount INT,
    FOREIGN KEY (ProductID) REFERENCES Dim_Product(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Dim_Customer(CustomerID),
    FOREIGN KEY (DateID) REFERENCES Dim_Date(DateID)
);
