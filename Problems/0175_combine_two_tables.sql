
-- Problem: 175. Combine Two Tables
-- Pattern: LEFT JOIN
--
-- Explanation:
-- We join the Person and Address tables using personId.
-- LEFT JOIN is used because the question asks us to return
-- every person, even if they don't have an address.
-- If a person has no matching address, city and state become NULL.
--
-- Time Complexity: O(n)

SELECT
    firstName,
    lastName,
    city,
    state
FROM Person
LEFT JOIN Address
ON Person.personId = Address.personId;
