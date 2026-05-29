-- =============================================
-- DAY 1 — GROUP BY AND AGGREGATE FUNCTIONS
-- Date: 29 May 2025
-- Topic: GROUP BY, COUNT, SUM, AVG, MAX, MIN,
--        HAVING, ORDER BY, LIMIT
-- =============================================

-- TABLE SETUP
CREATE TABLE employees (
  id INT,
  name TEXT,
  department TEXT,
  salary INT,
  city TEXT
);

INSERT INTO employees VALUES
(1, 'Arjun',  'Engineering', 95000, 'Bangalore'),
(2, 'Priya',  'Engineering', 88000, 'Bangalore'),
(3, 'Ravi',   'Engineering', 92000, 'Chennai'),
(4, 'Sneha',  'Marketing',   75000, 'Bangalore'),
(5, 'Kiran',  'Marketing',   90000, 'Chennai'),
(6, 'Divya',  'HR',          72000, 'Bangalore'),
(7, 'Arun',   'HR',          68000, 'Chennai'),
(8, 'Meena',  'Marketing',   85000, 'Bangalore');

-- =============================================
-- LESSON QUERIES
-- =============================================

-- 1. Count employees per department
SELECT department, COUNT(*)
FROM employees
GROUP BY department;

-- 2. Average salary per department
SELECT department, ROUND(AVG(salary), 0)
FROM employees
GROUP BY department;

-- 3. Multiple aggregates in one query
SELECT department,
       COUNT(*) AS total_employees,
       ROUND(AVG(salary), 0) AS avg_salary,
       SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- 4. HAVING — show departments where avg salary > 80000
SELECT department, ROUND(AVG(salary), 0) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 80000;

-- =============================================
-- PRACTICE QUESTIONS
-- =============================================

-- Q1. City with highest number of employees
SELECT city, COUNT(*) AS total
FROM employees
GROUP BY city
ORDER BY total DESC
LIMIT 1;

-- Q2. Departments where total salary > 200000
SELECT department, SUM(salary) AS total
FROM employees
GROUP BY department
HAVING SUM(salary) > 200000;

-- Q3. Min and max salary across entire company
SELECT MIN(salary) AS min_salary,
       MAX(salary) AS max_salary
FROM employees;

-- Q4. Departments with more than 2 employees
SELECT department, COUNT(*) AS total
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;

-- Q5. Avg salary grouped by department and city
SELECT department, city,
       ROUND(AVG(salary), 0) AS avg_salary
FROM employees
GROUP BY department, city;

-- =============================================
-- KEY RULES LEARNED TODAY
-- =============================================
-- 1. WHERE filters rows BEFORE GROUP BY
-- 2. HAVING filters groups AFTER GROUP BY
-- 3. Cannot use aggregate functions in WHERE
-- 4. Semicolon only at the very end of query
-- 5. No commas in numbers — 80000 not 80,000
-- 6. ORDER BY + LIMIT 1 = find top 1 row
-- =============================================
