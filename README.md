# 📦 Data Storage & Analytics Project – Sales and Returns Analysis

This project is a comprehensive **proof-of-concept (PoC)** for designing and implementing a data warehouse using a real-world **Product Sales and Returns dataset**. 
It demonstrates dimensional modeling, SQL-based ETL, data normalization, Tableau visualization, and a performance comparison between relational databases (SQL) and graph databases (Neo4j).

---

## 📁 Project Structure
## 🔍 Objective

To build a scalable data warehouse that supports:
- Business Intelligence (BI)
- Revenue optimization
- Refund analysis
- Customer behavior insights

---

## 🛠️ Tools & Technologies

- **SQL** – Schema design, ETL processes, reporting
- **Tableau** – Visual dashboards for business insights
- **Neo4j** – Performance comparison with SQL for relationship-heavy queries
- **Power BI / SSRS** – Alternative reporting frameworks
- **Python / Google Colab** – Optional notebooks for supporting analysis

---

## 🧱 Data Warehouse Design

- **Fact Table**: `Fact_Sales` stores transactional measures like revenue, refunds, tax
- **Dimension Tables**:
  - `Dim_Product`
  - `Dim_Customer`
  - `Dim_Date`
  - `Dim_Transaction`
- **Schema**: Star Schema (normalized to 3NF)
- **ETL Process**: Developed and executed in SQL (SSMS/SSIS)

---

## 📊 Reports & Dashboards

### SQL-Based Reports:
- Sales Summary by Category
- Customer Purchase Behavior
- Monthly Performance Reports
- Refund Analysis Report

### Tableau Visualizations:
- Top Products by Final Revenue
- Sales vs. Returns by Category
- Revenue Trends Over Time
- Customer Segmentation Dashboard

> Includes **Level of Detail (LOD)** expressions for deep insights.

---

## 🔄 Graph vs. Relational DB Comparison (Neo4j vs. SQL)

- Ran equivalent queries on both platforms
- Measured query performance for relationship-intensive tasks (e.g., fraud detection, high-value customer flows)
- Found that **Neo4j consistently outperformed** SQL for deep joins and connection tracing

---

## 📈 Business Value Delivered

- **Stakeholders**: Sales, Marketing, Finance, Executives, Customer Support
- **Outcomes**:
  - Improved refund trend visibility
  - Regional revenue breakdowns
  - High-value customer identification
  - Strategic decision-making enablement

---

## 👨‍💻 Contributors

- **Sourav Basu** (20031652)  
- Kapil Sharma (20030912)  


---

## 🧠 Key Learning

This project showcases the integration of traditional data warehousing with modern analytical tools, emphasizing the role of database normalization, dimensional modeling, and intuitive visualization in delivering actionable business insights.

---

## 📎 References

- Kaggle: Product Sales & Returns Dataset  
- The Data Warehouse Toolkit – Kimball & Ross  
- Tableau, Neo4j, Microsoft SSRS Documentation
