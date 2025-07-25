
# 🧪 Process Quality Analysis Using SQL on Final Product

This project demonstrates how SQL can be used to analyze manufacturing quality control data, specifically for steel product samples collected over a period of six months. The dataset contains test values related to mechanical properties, helping identify trends, anomalies, and performance across shifts and production lines.

---

## 📁 Dataset Overview

The dataset originates from a quality assurance process in a steel manufacturing environment and includes the following fields:

| Column Name         | Description |
|---------------------|-------------|
| `CAST ID`           | Unique batch identifier for the casting |
| `SEC.`              | Section or diameter of the product (e.g., 16 mm) |
| `GRADE`             | Material grade (e.g., FE550 D) |
| `SHIFT`             | Production shift (A, B, C) |
| `SAMPLE TIME`       | Timestamp of sample collection |
| `LINE`              | Production line identifier (A, B) |
| `SAMPLING CONDITION`| Condition under which the sample was taken |
| `YS`                | Yield Strength (MPa) |
| `UTS`               | Ultimate Tensile Strength (MPa) |
| `UTS/YS`            | Ratio of UTS to YS |
| `SURFACE INSPECTION`| Qualitative surface inspection result (e.g., OK, Not OK) |

---

## 🏗️ SQL Project Components

### 1. Schema Creation

We define a normalized SQL schema to store the dataset, with appropriate data types for each column. The schema supports primary key indexing and ensures structured querying.

### 2. Table and Sample Data

A SQL script (`quality_schema_and_data.sql`) is provided that:
- Creates the database and table structure.
- Inserts a few sample rows to test functionality.

For full-scale analysis, the remaining dataset can be loaded using SQL client tools via `.csv` import.

### 3. Analytical Queries

SQL queries leverage:
- **Aggregate functions** (`AVG`, `COUNT`)
- **GROUP BY** clauses to segment data by shift, grade, etc.
- **Window functions** to compute moving averages
- **Filters** to detect deviations or anomalies
- **Sorting and limiting** to find best/worst samples

---

## 🧪 Example Analysis Questions

Here are some quality control questions answered using SQL:

- Which shift has the highest average Yield Strength?
- Are any production lines producing samples with low UTS/YS ratios?
- What is the trend of UTS over time?
- How many samples failed surface inspection?
- Are there any abnormal drops in tensile strength that could indicate quality issues?

---

## 🚀 How to Run the Project

1. Install MySQL (or a compatible SQL engine like PostgreSQL, MariaDB).
2. Open your SQL editor (e.g., MySQL Workbench, DBeaver).
3. Run `quality_schema_and_data.sql` to create schema and insert sample data.
4. Execute analysis queries manually or build views for reporting.

---

## 📊 Potential Enhancements

- Load full dataset via CSV import
- Build a BI dashboard using Power BI / Tableau / Python
- Schedule periodic quality reports
- Integrate alerts for threshold breaches (e.g., UTS/YS < 1.12)

