-- US-08: Data coverage and limits, 2026 H1.
-- (a) share of national complaints covered by firm-level file; (b) reporting-period mix; (c) joint reporters and groups.
SELECT 'firm-level closed / national closed (%)' AS check_name,
       ROUND(100.0 * (SELECT SUM(closed) FROM firm_total)
             / (SELECT SUM(volume) FROM agg_product_group WHERE half_year = '2026 H1' AND variable_type = 'Complaints closed'), 1) AS value
UNION ALL
SELECT 'firm-level opened / national opened (%)',
       ROUND(100.0 * (SELECT SUM(opened) FROM firm_total)
             / (SELECT SUM(volume) FROM agg_product_group WHERE half_year = '2026 H1' AND variable_type = 'Complaints opened'), 1)
UNION ALL SELECT 'firms', COUNT(*) FROM firm_total
UNION ALL SELECT 'groups', COUNT(DISTINCT firm_group) FROM firm_total
UNION ALL SELECT 'joint-reporting rows', SUM(joint_reporting = 'yes') FROM firm_total
UNION ALL SELECT 'firms reporting Jan-Jun 2026', COUNT(*) FROM firm_total WHERE reporting_period = '2026-01-01 to 2026-06-30'
UNION ALL SELECT 'firms with other reporting window', COUNT(*) FROM firm_total WHERE reporting_period <> '2026-01-01 to 2026-06-30';
