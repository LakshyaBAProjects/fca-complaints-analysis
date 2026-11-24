-- US-06: Anonymised firm benchmark, 2026 H1: closing speed vs share upheld.
-- Firm names are replaced by labels (Firm 01 = largest by complaints closed). Firms with 100+ closed complaints.
-- Joint reporters are flagged because their return covers other firms too.
SELECT
    'Firm ' || printf('%02d', ROW_NUMBER() OVER (ORDER BY closed DESC)) AS firm_label,
    CASE WHEN closed >= 10000 THEN 'Large (10k+)'
         WHEN closed >= 1000  THEN 'Medium (1k-10k)'
         ELSE 'Small (100-1k)' END                                       AS size_band,
    joint_reporting,
    ROUND(closed)                                                         AS closed,
    ROUND(100.0 * pct_within_3d, 1)                                       AS pct_within_3d,
    ROUND(100.0 * pct_over_8w, 1)                                         AS pct_over_8w,
    ROUND(100.0 * pct_upheld, 1)                                          AS pct_upheld
FROM firm_total
WHERE closed >= 100 AND pct_within_3d IS NOT NULL AND pct_upheld IS NOT NULL
ORDER BY closed DESC;
