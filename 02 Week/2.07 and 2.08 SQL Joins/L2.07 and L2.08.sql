USE bank;

-- Lesson 2.07
-- JOINS

/*
Assume that we're asked to provide which accounts have a loan.
We need to proceed step by step.

-In which tables is the information required?

accounts
loan

-Do they have a common column to make any kind of join?
-Yes, "account_id". Then, we can do a join.alte

-Which type of join we need to do?
-"acounts" table will contain all the accounts, but not all the accounts will 
have an associated loan
- Therefore, we want all the accounts from the "loan" table. 
- If we use "accounts" as the LEFT table and "loan" as the right table we can do ir
with: inner join or right join (all the accounts from table "loan")
*/

select * from bank.account as a
join bank.loan as l 
on a.account_id = l.account_id;

select * from bank.account as a
right join bank.loan as l 
on a.account_id = l.account_id;

-- If we use "loan" as the LEFT table we can do it with an "inner" or "left" join.
select * from bank.loan as l
join bank.account as a 
on l.account_id = a.account_id;

select * from bank.account as a
right join bank.loan as l
on l.account_id = a.account_id;

/*
-- Assume that we want to get the number of accounts that have SIPO (k_symbol) orders per district
-- sorted district_id in descending order.
-- The information we need is on tables: "account" and "orders"
-- Do they have a common column? Yes, "account_id". We can do a join.
*/

SELECT *
FROM bank.account;

SELECT *
FROM bank.order;


SELECT * FROM bank.account as a
JOIN bank.order as o
ON a.account_id = o.account_id
limit 10;

-- Now let's count
SELECT a.district_id , COUNT(a.account_id) as "Accounts"
FROM bank.account a
JOIN bank.order o
ON a.account_id = o.account_id
WHERE o.k_symbol = 'SIPO'
GROUP BY a.district_id
ORDER BY a.district_id ASC;

-- Apparently we're done, right? Not so fast

-- Let's count how many "accounts" are in both tables.
SELECT COUNT(*)
FROM bank.account a
JOIN bank.order o
ON a.account_id = o.account_id; -- 6471

-- Let's count how many "account" exists in "account".
SELECT COUNT(account_id)
FROM bank.account; -- 4500 How this can be???!!!!


SELECT COUNT(a.account_id)
FROM bank.account a
JOIN bank.order o
ON a.account_id = o.account_id;-- 6471.


SELECT COUNT(DISTINCT a.account_id)
FROM bank.account a
JOIN bank.order o
ON a.account_id = o.account_id; 
-- 3758. Not all the accounts makes orders, and some accounts might have more than one order.

-- what is going on?
-- The key point is on "DISTINCT"
SELECT a.district_id , COUNT(DISTINCT a.account_id)
FROM bank.account a
JOIN bank.order o
ON a.account_id = o.account_id
WHERE o.k_symbol = 'SIPO'
GROUP BY a.district_id
ORDER BY a.district_id ASC;


-- activity 2.8.3 - for the first 2 ask for name of district/region, for 3 just ID
/*
1. Get a rank of districts ordered by the number of clients.
*/
 

/*
2. Get a ranking of regions ordered by the number of clients.
*/




-- -------------------------------------------
-- what if I want to ask "in a certain region, what % of accounts have orders"?
-- We need the info from the tables: accounts, orders, and district.
-- Each account will be in one district, (inner join)
-- But not all the accounts will make orders (left join)


-- account, orders, district
select * from bank.district;
select distinct(k_symbol) from bank.order;

select a.account_id as account_id, a.district_id as district, d.A3 as region, o.k_symbol as symbol from bank.account as a
join bank.district as d
on a.district_id = d.A1
left join bank.order as o
on a.account_id = o.account_id;

--
SELECT * FROM bank.account as a
LEFT JOIN bank.order as o
ON a.account_id = o.account_id;

SELECT a.district_id, COUNT(DISTINCT a.account_id)
FROM bank.account a
LEFT JOIN bank.order o
ON a.account_id = o.account_id
GROUP BY a.district_id;

SELECT a.district_id, COUNT(DISTINCT a.account_id)
FROM bank.account a
LEFT JOIN bank.order o
ON a.account_id = o.account_id
WHERE o.order_id IS NOT NULL
GROUP BY a.district_id;

-- notice the differences in size. Why?

SELECT COUNT(*) FROM bank.account as a
LEFT JOIN bank.order as o
ON a.account_id = o.account_id;

SELECT COUNT(*) FROM bank.account as a
RIGHT JOIN bank.order as o
ON a.account_id = o.account_id;

-- so, what can cause these weird counts?
-- rows in one of the tables not having a match on the other and vice versa (reduces size)
-- rows in one table matching more than one row in the other (creates duplicates)



-- Lesson 2.08
-- MULTIPLE JOINS

/*
Suppose that we're asked to get the birtdate of all the OWNERS of classic cards:
Let's see where is the data that we need:

birthdate is on table "client"
card info is on table "card"
Ownership is on table "disp"

We could think of start creating a join between tables "client" and "card".
However, the tables "client" and "card" doesn't have a common column! We can't do a join with them.
We need another table to stablish the "connection". We need a table to link the "client_id"
with the "acount_id" -> table "disp".

*/

SELECT * FROM bank.disp as d
JOIN bank.client as c
ON d.client_id = c.client_id;

SELECT * FROM bank.disp as d
JOIN bank.card as c
ON d.disp_id = c.disp_id;

SELECT * FROM bank.disp as d
JOIN bank.client as c
ON d.client_id = c.client_id
JOIN bank.card as ca
ON d.disp_id = ca.disp_id;

-- ACTIVITY 3.2.1
-- I want an overview of all clients (and their accounts,
-- together with district name) for the clients that are the OWNER of the account.



