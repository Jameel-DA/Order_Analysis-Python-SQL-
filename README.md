# Retail Orders Analysis Project

## Overview
This project analyzes retail order data to derive insights into sales performance, regional trends, and growth metrics. The workflow includes data extraction, cleaning, database integration, and SQL-based analysis.

## Features
- **Data Processing**: Clean and transform raw data using Pandas.
- **Database Integration**: Store data in MySQL for efficient querying.
- **Analytical Queries**: SQL scripts to uncover top products, regional sales, monthly growth, and more.

## Setup
1. **Prerequisites**:
   - Python 3.x, Jupyter Notebook, MySQL
   - Libraries: `pandas`, `sqlalchemy`, `pymysql`, `kaggle`
2. **Install Dependencies**:
   ```bash
   pip install pandas sqlalchemy pymysql kaggle
3. Kaggle Setup:

Upload your Kaggle API token to ~/.kaggle/kaggle.json.

Database Configuration:

4. Create a MySQL database named Order_Analysis.

Update the connection string in Analysis.ipynb with your credentials:

5. python
Copy
engine = sal.create_engine("mysql+pymysql://<USER>:<PASSWORD>@localhost/Order_Analysis")
Run the Jupyter Notebook:

Execute Analysis.ipynb to download data, clean it, and load it into MySQL.

6. Execute SQL Queries:

Run queries from sql_code.sql to generate insights.
