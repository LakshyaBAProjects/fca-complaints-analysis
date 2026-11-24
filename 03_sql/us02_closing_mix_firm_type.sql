-- US-02: Closing-time mix by firm type, latest half-year (2026 H1).
-- Shares recalculated from counts. Compare slow sectors with banking.
SELECT
    firm_type,
    SUM(CASE WHEN variable_type = 'Complaints closed' THEN volume END)                 AS closed,
    ROUND(100.0 * SUM(CASE WHEN variable = 'Complaints closed within 3 days' THEN volume END)
          / SUM(CASE WHEN variable_type = 'Complaints closed' THEN volume END), 1)     AS pct_within_3d,
    ROUND(100.0 * SUM(CASE WHEN variable = 'Complaints closed > 3 days but within 8 weeks' THEN volume END)
          / SUM(CASE WHEN variable_type = 'Complaints closed' THEN volume END), 1)     AS pct_3d_to_8w,
    ROUND(100.0 * SUM(CASE WHEN variable = 'Complaints closed > 8 weeks' THEN volume END)
          / SUM(CASE WHEN variable_type = 'Complaints closed' THEN volume END), 1)     AS pct_over_8w
FROM agg_firm_type
WHERE half_year = '2026 H1'
GROUP BY firm_type
ORDER BY closed DESC;
