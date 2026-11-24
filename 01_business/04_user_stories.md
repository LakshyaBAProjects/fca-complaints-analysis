# User Stories

> DRAFT – prepared with Claude, pending review by Kumar. Each SQL file in 03_sql starts `-- US-xx: ...`.

| ID | As a... | I want... | So that... | Linked BR | Deliverable |
|---|---|---|---|---|---|
| US-01 | Head of Customer Operations | the market complaint trend by half-year | I see whether volumes and outcomes are moving | BR-01 | us01_market_trend.sql |
| US-02 | Head of Customer Operations | closing-time mix by firm type | I see where slow closure sits | BR-02 | us02_closing_mix_firm_type.sql |
| US-03 | Complaints team leader | product groups compared on volume, share upheld, closing mix | I prioritise product areas | BR-03 | us03_product_group_comparison.sql |
| US-04 | Product owner | most-complained products and change vs previous half-year | I target root causes | BR-04 | us04_top_products_change.sql |
| US-05 | Head of Customer Operations | redress and average redress per upheld complaint over time | I see cost of getting it wrong | BR-05 | us05_redress_trend.sql |
| US-06 | Head of Customer Operations | an anonymised firm benchmark of within-3-days vs share upheld (weighted) | I see the speed/outcome relationship | BR-06 | us06_firm_benchmark.sql |
| US-07 | Head of Customer Operations | the gap between best and worst quartile in within-3-days closure | I size the improvement opportunity | BR-07 | us07_quartile_spread.sql |
| US-08 | Analyst/reviewer | data coverage and limits documented | I trust and caveat the findings | BR-08 | us08_data_coverage.sql |
| US-09 | Head of Customer Operations | an illustrative business case from my own cost assumptions | I judge whether the redesign pays back | BR-09 | us09_business_case.md |
| US-10 | Complaints team leader | as-is and to-be process maps | I see where to remove delay | BR-10 | 06_process/ |
