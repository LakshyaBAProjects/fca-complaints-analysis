# Problem Statement

> DRAFT – prepared with Claude, pending review by Kumar. Sponsor and interviews are simulated for this portfolio project.

## Context
UK firms must resolve customer complaints within set limits under the FCA's DISP rules: a summary resolution within 3 business days, otherwise a final response within 8 weeks. Customers who are unhappy can then go to the Financial Ombudsman Service. The FCA publishes complaints data twice a year (H1 2026 published 22 Oct 2026).

## Simulated sponsor
Head of Customer Operations / Complaints at a fictional UK retail bank ("the Bank").

## Problem
The Bank wants to know whether its complaint handling is slower or less effective than the market, where time is lost, and what a redesigned process would be worth. Today it has no market reference point and no agreed view of which stage of the process to fix first.

## What the published data already shows (verified, H1 2026 aggregate file)
- Share of complaints upheld fell from 61.3% (2022 H1) to 54.7% (2026 H1; FCA publishes 54.8%).
- Complaints closed within 3 days sit between 43.4% and 51.0% across the period (44.8% in H1 2026 per FCA).
- Complaints open over 8 weeks are around 5% to 7.6% across the period.
- Closing speed differs sharply by sector: Decumulation & pensions, Investments, Life insurer and Personal Investment close markedly slower than banking.
- Firm-level data covers 94.9% of national complaints opened (226 firms in 137 groups).

## Business questions
1. How do complaint volumes, closing times and upheld shares compare across sectors and over time?
2. How large is the gap between faster and slower firms (anonymised)?
3. Which process stages (acknowledge, triage, fast fix, investigate, final response) explain slow closure?
4. What would a redesigned process be worth, using assumptions the Bank supplies?

## Out of scope
Naming individual firms as failing; Financial Ombudsman Service data; official compliance judgements; invented cost figures.

## Success criteria
- A clear as-is vs to-be process map.
- Requirements agreed (BRD) and traced to SQL analyses.
- A business-case scenario driven by clearly labelled, user-supplied assumptions.
- Findings that state data limits (differing reporting periods, joint reporters).
