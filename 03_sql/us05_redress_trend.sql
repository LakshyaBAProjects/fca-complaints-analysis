-- US-05: Redress paid and average redress per upheld complaint, by half-year (national).
-- "Redress for complaints not upheld" is paid even though the firm did not uphold the complaint.
SELECT
    half_year,
    SUM(CASE WHEN variable = 'Total redress paid for upheld complaints'  THEN volume END) AS redress_upheld_gbp,
    SUM(CASE WHEN variable = 'Total redress paid for complaints not upheld' THEN volume END) AS redress_not_upheld_gbp,
    SUM(CASE WHEN variable_type = 'Complaints upheld' THEN volume END)                    AS upheld,
    ROUND(1.0 * SUM(CASE WHEN variable = 'Total redress paid for upheld complaints' THEN volume END)
          / SUM(CASE WHEN variable_type = 'Complaints upheld' THEN volume END), 0)        AS avg_redress_per_upheld_gbp
FROM agg_firm_type
GROUP BY half_year
ORDER BY half_year;
