# Business Requirements Document (BRD)

> DRAFT v0.1 – prepared with Claude, pending review by Kumar. Sponsor is simulated.

## 1. Objective
Give the Bank a market-referenced, evidence-based view of complaint handling and a redesigned process with a quantified business case.

## 2. Background
See 01_problem_statement.md. Data: FCA aggregate and firm-level complaints data, H1 2026 (OGL).

## 3. Scope
**In:** market trend analysis (2021 H2–2026 H1), sector comparison, anonymised firm benchmark, as-is/to-be process map, illustrative business case.
**Out:** Financial Ombudsman data, named firm criticism, system build, any statement of regulatory compliance.

## 4. Business requirements
| ID | Requirement | Priority |
|---|---|---|
| BR-01 | Show national complaint trend by half-year | Must |
| BR-02 | Show closing-time mix (within 3 days, 3 days–8 weeks, over 8 weeks) by firm type and product group | Must |
| BR-03 | Compare product groups on volume, share upheld, closing mix | Must |
| BR-04 | Identify most-complained products and change vs previous half-year | Should |
| BR-05 | Show redress totals and average redress per upheld complaint over time | Should |
| BR-06 | Anonymised firm benchmark: closing speed vs share upheld, weighted by closed complaints | Must |
| BR-07 | Quantify spread between best and worst quartile for within-3-days closure | Should |
| BR-08 | Document data coverage and limitations | Must |
| BR-09 | Provide business-case scenario using user-supplied cost assumptions | Should |
| BR-10 | Produce as-is and to-be process maps | Must |

## 5. KPIs
Share closed within 3 days; share over 8 weeks; share upheld (weighted); complaints per 1,000 products where available.

## 6. Assumptions and constraints
- Percentages are recalculated from counts, never averaged; firm-level weighted by closed complaints.
- Firms report different periods (192 of 226 use Jan–Jun 2026).
- 19 joint-reporting rows; 226 firms sit in 137 groups.
- Firm-level data covers 94.9% of national complaints opened (95.1% of closed).
- Closing time, upheld and redress exist only at firm-type and product-group level in the aggregate file.
- No cost figures are invented; business-case inputs are labelled assumptions.

## 7. Risks
| Risk | Mitigation |
|---|---|
| Misreading upheld share as "justified" | Use "share of complaints upheld" wording |
| Misleading firm comparisons | Anonymise; note differing periods |
| Comparing FCA and Ombudsman data | Do not compare |
| Revisions to published data | Use latest files; note date |

## 8. Sign-off
Sponsor: ____ (simulated)  Date: ____
