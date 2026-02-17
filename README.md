# Zepto E-commerce SQL Data Analyst Portfolio Project 
This project focuses on analyzing retail product data using SQL to extract
meaningful business insights related to pricing, discounts, inventory,
categories, and revenue.

The dataset represents product-level information from a quick-commerce
platform similar to Zepto.

# Data Source

The original dataset was obtained from Kaggle and is available in Excel format (`zepto_v1.xlsx`).

The dataset includes product name, category, pricing, discounts,
stock status, quantity, and weight details.

# Data Loading Method

Data was imported directly from Excel into the database using a
bulk-loading/import method.

⚠️ No manual INSERT (DML) statements were used in this project.

This approach reflects real-world ETL workflows commonly used in
industry projects.

Details are documented in:  data_insert.md


# Database Schema

The database structure is defined using SQL DDL statements.

File:

database_schema.sql

The schema includes fields such as:

- **name:** Product name as it appears on the app

- **category:** Product category like Fruits, Snacks, Beverages, etc.

- **mrp:** Maximum Retail Price (originally in paise, converted to ₹)

- **discountPercent:** Discount applied on MRP

- **discountedSellingPrice:** Final price after discount (also converted to ₹)

- **availableQuantity:** Units available in inventory

- **weightInGms:** Product weight in grams

- **outOfStock:** Boolean flag indicating stock availability

- **quantity:** Number of units per package (mixed with grams for loose produce)



# SQL Analysis

All business analysis queries are written in:

queries.sql

Key areas covered:

Pricing and discount analysis

Inventory and out-of-stock analysis

Revenue estimation

Category-level insights

Value-based comparisons (price per gram)

Product categorization using CASE statements


# Sample Business Insights

Identified top discounted products

Found high-MRP products that are out of stock

Estimated revenue contribution by category

Analyzed discount efficiency

Detected products belonging to multiple categories due to
platform-level classification


# Data Assumptions & Notes

quantity represents historical demand, not current inventory

outofstock reflects current availability status

Categories represent platform-level or commercial classification

A single product may belong to multiple categories

Some category assignments may not strictly reflect product taxonomy


# How to Use This Project

Create a database in your SQL environment

Run database_schema.sql to create the table

Import zepto_v1.xlsx using a bulk import tool

Execute queries from queries.sql to generate insights


<!-- Author -->

Mukthapuram Kesava Reddy