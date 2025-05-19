-- SQL Practice File: Expense Tracker Learning Objectives

-- 1. SELECT statement: Retrieve all data from Expenses table
SELECT * FROM Expenses;

-- Retrieve specific columns: amount and category
SELECT amount, category FROM Expenses;

-- 2. Use of wildcards (%) and comparison operators
-- Find expenses with descriptions containing 'transport'
SELECT * FROM Expenses
WHERE description LIKE '%transport%';

-- Find expenses greater than 500
SELECT * FROM Expenses
WHERE amount > 500;

-- 3. WHERE clause with logical operators
-- Find expenses in 'Food' category and amount less than 100
SELECT * FROM Expenses
WHERE category = 'Food' AND amount < 100;

-- Find expenses in either 'Transport' or 'Fuel' categories
SELECT * FROM Expenses
WHERE category = 'Transport' OR category = 'Fuel';

-- Find expenses not in 'Entertainment' category
SELECT * FROM Expenses
WHERE NOT category = 'Entertainment';

-- 4. ORDER BY clause
-- Sort all expenses by date in ascending order
SELECT * FROM Expenses
ORDER BY date;

-- Sort all expenses by amount in descending order
SELECT * FROM Expenses
ORDER BY amount DESC;
