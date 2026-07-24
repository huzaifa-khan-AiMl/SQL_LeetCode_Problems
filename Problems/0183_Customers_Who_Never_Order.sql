-- Problem: 184. Customers Who Never Order
-- Pattern: LEFT JOIN + NULL check
--
-- Explanation:
-- LEFT JOIN returns all customers even if no matching order exists.
-- Customers with no orders will have NULL for customerId in Orders.
-- WHERE customerId IS NULL filters to only those customers.
--
-- Query Behavior:
-- LEFT JOIN preserves all rows from the left table (Customers).
-- Unmatched rows from Orders return NULL for all Orders columns.
-- IS NULL is required — NULL cannot be compared with = operator.

SELECT
    name AS Customers
FROM Customers
LEFT JOIN Orders
ON Customers.id = Orders.customerId
WHERE customerId IS NULL;
