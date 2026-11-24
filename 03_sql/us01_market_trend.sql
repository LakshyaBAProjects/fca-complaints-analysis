-- US-01: National complaint trend by half-year (opened, closed, closing-time mix, share upheld).
-- Percentages are recalculated from counts (never averaged). Source: agg_firm_type summed across firm types.
SELECT
    half_year,
    SUM(CASE WHEN variable = 'Total' THEN volume END)                                  AS opened,
    SUM(CASE WHEN variable_type = 'Complaints closed' THEN volume END)                 AS closed,
    ROUND(100.0 * SUM(CASE WHEN variable = 'Complaints closed within 3 days' THEN volume END)
          / SUM(CASE WHEN variable_type = 'Complaints closed' THEN volume END), 1)     AS pct_within_3d,
    ROUND(100.0 * SUM(CASE WHEN variable = 'Complaints closed > 8 weeks' THEN volume END)
          / SUM(CASE WHEN variable_type = 'Complaints closed' THEN volume END), 1)     AS pct_over_8w,
    ROUND(100.0 * SUM(CASE WHEN variable_type = 'Complaints upheld' THEN volume END)
          / SUM(CASE WHEN variable_type = 'Complaints closed' THEN volume END), 1)     AS pct_upheld
FROM agg_firm_type
GROUP BY half_year
ORDER BY half_year;
