-- Problem: 182. Duplicate Emails
-- Pattern: GROUP BY + HAVING
--
-- Explanation:
-- Group all rows by email to aggregate duplicates.
-- HAVING filters groups where the email count exceeds 1.
-- WHERE cannot be used here as it filters before grouping.
--
-- Query Behavior:
-- GROUP BY collapses all rows with the same email into one group.
-- COUNT(email) counts occurrences within each group.
-- HAVING applies the filter after grouping, WHERE applies before.

SELECT
    email AS Email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;
