-- This is a one-linner comment
USE bank;

USE sakila;

/*
This is a multi-line
comment
*/

-- Let's use bank as the default database;
USE bank;

-- Get all the rows and columns from the table "client" of database "bank"
SELECT * FROM client;
SELECT * FROM bank.client;

/*
This query will not work because my current active db is "bank", and therefore
SQL will look for the selected table in the current active db, which is not Sakila
*/
SELECT * FROM category;

SELECT * FROM sakila.category;

-- Using alias in columns
SELECT A2 FROM district;
SELECT A2 as district FROM district;
SELECT A2 as District, A3 as Region FROM district;

-- Limit the number of rows to 5
SELECT A2 as District, A3 as Region FROM district
LIMIT 5;

-- Get unique values of a column
SELECT distinct(A2) as Unique_districts FROM district;

SELECT count(distinct(A2)) as Number_of_Unique_districts FROM district;

-- Filters
SELECT * FROM district
WHERE A2 = "Melnik";

SELECT * FROM bank.order
WHERE k_symbol = "SIPO";

-- Count orders with k_symbol=SIPO
SELECT count(*) FROM bank.order
WHERE k_symbol = "SIPO";

-- Count total orders
SELECT count(*) FROM bank.order;

-- Count total orders using alias
SELECT count(*) as Total_orders FROM bank.order;

-- Min, Max, Average...
SELECT 
   min(amount) as Minimum_amount, 
   max(amount) as Maximum_amount, 
   avg(amount) as Average 
FROM bank.order;

-- Rounding the output of one column.
SELECT 
   min(amount) as Minimum_amount, 
   max(amount) as Maximum_amount, 
   round(avg(amount),2) as Average 
FROM bank.order;