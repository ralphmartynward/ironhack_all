USE bank;

-- NULL

SELECT 2000;
SELECT 10+5;
SELECT 10>5;
SELECT NULL;
SELECT NULL+10;
SELECT NULL>0;

SELECT 100;
SELECT COUNT(100);
SELECT COUNT(NULL);

SELECT * FROM bank.order;

SELECT *
FROM bank.order
WHERE k_symbol IS NULL;

SELECT SUM(ISNULL(k_symbol)) FROM bank.order;

SELECT *
FROM bank.order
WHERE (k_symbol IS NOT NULL) AND (k_symbol = '  ');


-- More WHERE

SELECT * FROM bank.account;

SELECT *
FROM bank.account
WHERE frequency IN ('POPLATEK MESICNE','POPLATEK TYDNE');

SELECT *
FROM bank.account
WHERE district_id BETWEEN 1 AND 50
ORDER BY district_id ASC;

SELECT DISTINCT A3
FROM bank.district;

SELECT *
FROM bank.district
WHERE A3 LIKE 'north%';

-- Activity 2.6.1
/*
1. Get different card types.
*/


/*
2. Get transactions in the first 15 days of 1993.
*/


/*
3. Get all running loans.
*/


/*
4. Find the different values from the field A2 that start with the letter 'K'.
*/


/*
5. Find the different values from the field A2 that end with the letter 'K'.
*/


/*
6. Discuss the possible use cases of using regular expressions in your query.
*/

-- GROUP BY

SELECT * FROM bank.loan;

SELECT AVG(amount) FROM bank.loan;

SELECT AVG(amount) FROM bank.loan
WHERE status = 'A';

SELECT status, AVG(amount) AS average FROM bank.loan
WHERE amount > 1000
GROUP BY status
ORDER BY average ASC

SELECT * FROM bank.order

SELECT k_symbol, SUM(amount) AS sum
FROM bank.trans
WHERE k_symbol <> ' '
GROUP BY k_symbol
ORDER BY sum ASC

SELECT k_symbol, SUM(amount) AS sum
FROM bank.order
WHERE k_symbol <> ' '
GROUP BY k_symbol
ORDER BY sum ASC

SELECT k_symbol, bank_to, SUM(amount) AS sum
FROM bank.order
WHERE k_symbol <> ' '
GROUP BY k_symbol, bank_to
ORDER BY k_symbol, bank_to ASC

SELECT * FROM bank.order LIMIT 10

-- HAVING vs WHERE

SELECT AVG(amount) as average, k_symbol
FROM bank.order
GROUP BY k_symbol;

SELECT AVG(amount) as average, k_symbol
FROM bank.order
GROUP BY k_symbol
HAVING average>3000;


SELECT AVG(amount) as average, k_symbol
FROM bank.order
WHERE amount > 1000
GROUP BY k_symbol
HAVING average>3000;

SELECT * FROM bank.loan;

SELECT duration, AVG(amount-payments) AS balance
FROM bank.loan
GROUP BY duration;

SELECT *, amount-payments AS balance, AVG(amount-payments) OVER (PARTITION BY status)
FROM bank.loan;
