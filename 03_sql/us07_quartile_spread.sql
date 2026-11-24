-- US-07: Spread between best and worst quartile of firms on within-3-days closure, Banking and credit cards, 2026 H1.
-- Like-for-like: one product group only. Firms with 100+ closed complaints. Quartile 1 = fastest.
-- Quartile figures are weighted by complaints closed (not simple averages).
WITH f AS (
    SELECT closed, closed_within_3d, upheld_count,
           NTILE(4) OVER (ORDER BY pct_within_3d DESC) AS quartile
    FROM firm_product
    WHERE product_group = 'Banking and credit cards'
      AND closed >= 100 AND pct_within_3d IS NOT NULL AND pct_upheld IS NOT NULL
)
SELECT
    quartile,
    COUNT(*)                                             AS firms,
    ROUND(SUM(closed))                                   AS closed,
    ROUND(100.0 * SUM(closed_within_3d) / SUM(closed), 1) AS pct_within_3d_weighted,
    ROUND(100.0 * SUM(upheld_count) / SUM(closed), 1)     AS pct_upheld_weighted
FROM f
GROUP BY quartile
ORDER BY quartile;
