# Notes for Claude Code

- Owner is a business analyst, beginner at coding. Explain what each script does in plain English before running it.
- Use Python 3.13 (`py -3.13`). Windows machine, PowerShell.
- Prefer pandas + sqlite3 (standard library). Keep scripts short and commented.
- Never edit files in `02_data/raw/`. Write cleaned outputs to `02_data/clean/`.
- SQLite database lives at `02_data/clean/complaints.db`.
- Each `.sql` file in `03_sql/` starts with a comment naming the user story it answers (e.g. `-- US-03`).

## Project
UK financial services complaints (FCA complaints data, H1 2026 release). A business analysis of where complaint handling breaks down, with an as-is and to-be process map and a business case. Simulated sponsor: Head of Complaints at a fictional UK retail bank.

## Data traps (follow these every time)
- **Never average percentages.** Recalculate from counts. For firm-level data, weight percentages by complaints closed. (Example: banking and credit cards, simple average upheld rate 48.8% vs closed-weighted 53.0%.)
- **Aggregate file is long format.** Closing time, upheld and redress exist only at firm-type and product-group level. Product level has only complaints opened and product counts (provision).
- **Firm-level file is wide format**, percentages stored as fractions (0.9493 = 94.93%). There is no "over 8 weeks" column: derive it as 1 minus the within-3-days share minus the 3-days-to-8-weeks share.
- **Reporting periods differ by firm.** Most use Jan to Jun 2026, about 34 of 226 use other windows. Firm comparisons are approximate.
- **Joint reporters (19 rows)** report on behalf of other firms. Do not add their figures to other firms' figures.
- **Firm vs group.** 226 firms belong to 137 parent groups. Decide the level before aggregating.
- **Firm-level data covers about 94.9% of national complaints opened (95.1% of closed)** (firms above the reporting threshold). The rest is in aggregate figures only.
- Aggregate figures exclude firms authorised only for consumer credit.
- Data is revised when firms resubmit. Always use the latest files.
- FCA data and Financial Ombudsman Service data measure different things. Never compare them directly.
- Our upheld % may differ from the FCA's headline by 0.1 point (rounding): quote the FCA's published figure when citing it.

## Wording and ethics
- Say "share of complaints upheld" (the firm agreed wholly or partly with the customer). Never say "justified" or "valid".
- Public outputs (README, dashboard, memo, LinkedIn) show firm-level results **anonymised** ("Firm A", "Firm B", or by size band). Never name individual firms as failing.
- This is an independent portfolio analysis of published statistics. It is not an official FCA publication and not a statement of any firm's compliance.
- Say "closed within 3 days" for the FCA's "within 3 days" measure.
