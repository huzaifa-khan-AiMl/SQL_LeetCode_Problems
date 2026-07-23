-- Problem: 176. Second Highest Salary
-- Pattern: Nested Subquery
--
-- Explanation:
-- Inner subquery finds the overall max salary.
-- Outer subquery excludes that max and finds the next highest.
-- IFNULL handles the case where no second highest exists (returns NULL).
--
-- Query Behavior:
-- Two nested subqueries — each returns a single value.
-- IFNULL is required — LeetCode expects NULL not an empty result
-- when there is no second highest salary.

SELECT
    IFNULL(
        (SELECT MAX(salary)
        FROM Employee
        WHERE salary != (SELECT MAX(salary) FROM Employee)),
    NULL) AS SecondHighestSalary;
