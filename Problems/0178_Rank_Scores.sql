-- Problem: 178. Rank Scores
-- Pattern: DENSE_RANK() Window Function
--
-- Explanation:
-- DENSE_RANK() assigns ranks to scores in descending order.
-- No PARTITION BY needed — ranking is global across all scores.
-- DENSE_RANK ensures no gaps in ranking when scores are tied.
--
-- Query Behavior:
-- DENSE_RANK vs RANK: RANK skips numbers after ties (1,1,3),
-- DENSE_RANK does not (1,1,2) — problem requires no gaps so DENSE_RANK.
-- PARTITION BY omitted intentionally — entire table is one window.

SELECT
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS rank
FROM Scores;
