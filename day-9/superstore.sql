create database superstore;
show tables;
select * from sales;
describe sales;
-- 1. Basic SELECT Queries
-- Display all records from the Superstore table.
select * from sales;
-- Display only Customer Name, Product Name, and Sales.
select Customer_Name,Product_Name,Sales from sales;
-- Display unique categories available in the dataset.
select DISTINCT Sub_Category from sales;
-- Display all unique regions.
select DISTINCT Region from sales;

-- 2. WHERE Clause
-- Find all orders where Sales are greater than 1000.
select * from sales 
where Sales >1000;
-- Find customers belonging to the Consumer segment.
select Customer_ID,Customer_Name,Segment from sales
where Segment = "Consumer";
-- Display orders from the West region.
select Order_ID,Order_Date,Region from sales
where Region = "west";
-- Find products belonging to the Furniture category.
select Product_ID,Product_Name,category,Sub_Category from sales
where Category = "Furniture";

-- 3. ORDER BY
-- Display products ordered by Sales in descending order.
select Product_ID,Product_Name,Sales from sales
ORDER BY Sales DESC;
-- Display customers alphabetically.
select Customer_ID,Customer_Name from sales
ORDER BY Customer_Name;
-- Display ship Date order wise
select Ship_Date from sales
ORDER BY Ship_Date; 

-- 4. Aggregate Functions
-- Find total sales.
select sum(Sales) as Total_Sales from sales;
-- Find average sales.
select avg(Sales) as Average_Sales from sales;
-- Find maximum sales value.
select max(Sales) as Max_Sales from sales;
-- Find minimum sales value.
select min(Sales) as Min_Sales from sales;
-- Count total number of orders.
select count(Order_ID) as total_orders from sales;

-- 5. GROUP BY
-- Calculate total sales by Region.
select sum(Sales) as Total_Sales,Region from sales
GROUP BY Region;
-- Calculate total sales by Category.
select sum(Sales) as Total_Sales,Category from sales
GROUP BY Category;
-- Count customers in each Segment.
select Segment,count(Customer_ID) as Total_Customers from sales
GROUP BY Segment;
-- Calculate total sales by State.
select sum(Sales),State from sales
GROUP BY State
ORDER BY STATE;

-- 6. HAVING Clause
-- Show regions having total sales greater than 1000.
select Region,sum(Sales) as Total_Sales from sales
GROUP BY Region
HAVING sum(Sales) > 1000;

-- Show categories with average sales greater than 100.
select Category,avg(Sales) as Avg_Sales from sales
GROUP BY Category
HAVING avg(Sales) > 100;

-- 7. LIKE Operator
-- Find customers whose names start with 'A'.
select Customer_Name from sales
where Customer_Name like "A%";
-- Find products containing the word "Chair".
select Product_Name from sales where Product_Name like "%Chair%";
-- Find Region Ends with letter t
select Region from sales
where Region like "%t";

-- 8. BETWEEN Operator
-- Find products with sales between 100 and 500.
select Product_Name,Sales from sales
where sales between 100 and 500;
-- Find orders between two order dates.
select Order_ID, Order_Datefrom sales
where STR_TO_DATE(Order_Date, '%d-%m-%Y')
BETWEEN '2016-09-21' AND '2017-11-11';

-- 9. IN Operator
-- Find records from East and West regions.
select * from sales 
where Region in ("East","West");
-- Find orders belonging to Furniture and Technology categories.
select *from sales
where Category in("Furniture","technology");

-- 10. Subqueries
-- Find customers whose sales are above average.
select Customer_Name,Sales from sales where Sales > (select avg(Sales) from sales);


-- 11. DDL Commands and  DML Commands
-- Create SuperMarket table.
CREATE TABLE SuperMarket1 (
    Order_ID VARCHAR(20) PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Category VARCHAR(50),
    Product_Name VARCHAR(150),
    Region VARCHAR(50),
    Sales INT
);
-- Add a Discount column.
ALTER table SuperMarket1
ADD COLUMN Discount INT;
describe SuperMarket1;
-- Modify column datatype.
ALTER table SuperMarket1
MODIFY COLUMN Discount Decimal(10,2);
-- Rename a column.
ALTER table SuperMarket1
RENAME column Customer_Name TO CustomerName;
-- Insert a new record.
insert into SuperMarket1 values
('ORD008', 'Priya Sharma', 'Furniture', 'Office Chair', 'West', 4500.00,15.00),
('ORD009', 'Arjun Patel', 'Technology', 'Laptop', 'North', 55000.00,10.00),
('ORD010', 'Sneha Reddy', 'Office Supplies', 'Notebook', 'East', 250.00,15.00);

select * from SuperMarket1;

truncate table SuperMarket1;

-- Delete a record based on Row_ID.
delete  from SuperMarket1
where Order_ID = "ORD010";

drop table SuperMarket1;