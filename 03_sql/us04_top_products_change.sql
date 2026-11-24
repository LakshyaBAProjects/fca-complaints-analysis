-- US-04: Most-complained products, 2026 H1, with change vs 2025 H2 and complaints per 1,000 products.
-- Product level has only complaints opened and provision (number of products at period end).
WITH p AS (
    SELECT half_year, product_group, product,
           SUM(CASE WHEN variable_type = 'Complaints opened' THEN volume END) AS opened,
           SUM(CASE WHEN variable_type = 'Provision' THEN volume END)         AS provision
    FROM agg_product
    WHERE half_year IN ('2026 H1', '2025 H2')
    GROUP BY half_year, product_group, product
)
SELECT
    cur.product_group, cur.product,
    cur.opened                                                        AS opened_2026h1,
    prev.opened                                                       AS opened_2025h2,
    ROUND(100.0 * (cur.opened - prev.opened) / prev.opened, 1)        AS pct_change,
    ROUND(1000.0 * cur.opened / cur.provision, 2)                     AS per_1000_products
FROM p cur
LEFT JOIN p prev ON prev.product = cur.product AND prev.product_group = cur.product_group AND prev.half_year = '2025 H2'
WHERE cur.half_year = '2026 H1'
ORDER BY cur.opened DESC
LIMIT 15;
