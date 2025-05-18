# 📚 Online Bookstore – SQL Project (MySQL Version)

This project demonstrates a beginner-to-intermediate level SQL project using **MySQL Workbench**, simulating an **Online Bookstore**. It includes database schema creation, CSV data import, and both basic and advanced SQL practice queries.

# **Database and Tools**
MySQL Workbench

## 📁 Files Included

- `Books.csv` – Book details.
- `Customers.csv` – Customer data.
- `Orders.csv` – Orders placed.
- `SQL Project Questions Day 30.pdf` – PDF with all query exercises.

## 🗃️ Database Schema

### 📘 Books
| Column         | Data Type        |
|----------------|------------------|
| Book_ID        | INT AUTO_INCREMENT PRIMARY KEY |
| Title          | VARCHAR(100)     |
| Author         | VARCHAR(100)     |
| Genre          | VARCHAR(50)      |
| Published_Year | INT              |
| Price          | DECIMAL(10,2)    |
| Stock          | INT              |

### 👤 Customers
| Column      | Data Type         |
|-------------|-------------------|
| Customer_ID | INT AUTO_INCREMENT PRIMARY KEY |
| Name        | VARCHAR(100)      |
| Email       | VARCHAR(100)      |
| Phone       | VARCHAR(15)       |
| City        | VARCHAR(50)       |
| Country     | VARCHAR(150)      |

### 🧾 Orders
| Column       | Data Type        |
|--------------|------------------|
| Order_ID     | INT AUTO_INCREMENT PRIMARY KEY |
| Customer_ID  | INT              |
| Book_ID      | INT              |
| Order_Date   | DATE             |
| Quantity     | INT              |
| Total_Amount | DECIMAL(10,2)    |
> **Foreign Keys:**  
> `Customer_ID` → Customers(Customer_ID)  
> `Book_ID` → Books(Book_ID)

## ⚙️ Setup in MySQL Workbench

1. **Create the Database**
   ```sql
   CREATE DATABASE OnlineBookstore;
   USE OnlineBookstore;
