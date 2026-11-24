-- US-03: Product groups compared on volume, share upheld and closing mix, latest half-year (2026 H1).
-- Source: agg_product_group. Percentages recalculated from counts.
SELECT
    product_group,
    SUM(CASE WHEN variable_type = 'Complaints opened' THEN volume END)                 AS opened,
    SUM(CASE WHEN variable_type = 'Complaints closed' THEN volume END)                 AS closed,
    ROUND(100.0 * SUM(CASE WHEN variable_type = 'Complaints upheld' THEN volume END)
          / SUM(CASE WHEN variable_type = 'Complaints closed' THEN volume END), 1)     AS pct_upheld,
    ROUND(100.0 * SUM(CASE WHEN variable = 'Complaints closed within 3 days' THEN volume END)
          / SUM(CASE WHEN variable_type = 'Complaints closed' THEN volume END), 1)     AS pct_within_3d,
    ROUND(100.0 * SUM(CASE WHEN variable = 'Complaints closed > 8 weeks' THEN volume END)
          / SUM(CASE WHEN variable_type = 'Complaints closed' THEN volume END), 1)     AS pct_over_8w
FROM agg_product_group
WHERE half_year = '2026 H1'
GROUP BY product_group
ORDER BY closed DESC;
