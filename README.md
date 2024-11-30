# SQL Challenge Repository

## Overview
Welcome to the **SQL Challenge** repository! This project demonstrates the implementation of a SQL database for analyzing employee data. It includes the database schema, data files, Entity-Relationship Diagram (ERD), and SQL queries for performing data analysis.

---

## Repository Structure

## Folder Details

### **EmployeeSQL/**
- **`updated_table_schemata.sql`**:  
  Contains the SQL script to create the database schema, including table definitions, primary keys, and foreign key relationships.
- **`Data Analysis.sql`**:  
  Includes SQL queries for analyzing the employee data (e.g., salary trends, departmental structures).

### **data/**
This folder contains the CSV files used to populate the database tables:
- `departments.csv`
- `dept_emp.csv`
- `dept_manager.csv`
- `employees.csv`
- `salaries.csv`
- `titles.csv`

### **ERD diagram.png**
The Entity-Relationship Diagram visualizes the relationships between the tables in the database.

## Getting Started
To get started with this project, follow these steps:

### 1. Clone the Repository
```bash
git clone https://github.com/CarlosSanchez1999/sql-challenge.git

### 2. Set Up the Database
- Navigate to the `EmployeeSQL/` folder in your repository.
- Open the `updated_table_schemata.sql` file.
- Execute the SQL script in your preferred SQL environment (e.g., pgAdmin, psql) to create the database schema. 
- This script includes instructions for setting up the tables and manually importing the data.

### 3. Run the Queries
- Open the `Data Analysis.sql` file in the `EmployeeSQL/` folder.
- Execute the queries to explore various insights from the employee data.
- These queries include analyses of:
  - Employee salaries.
  - Department assignments.
  - Management hierarchies.

