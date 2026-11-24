# Findings and Recommendations

> DRAFT – prepared with Claude, pending review by Kumar. Sponsor (Head of Customer Operations at a fictional UK retail bank) and process steps are simulated. All figures come from FCA complaints data, H1 2026 release, recalculated from counts, unless marked as an assumption.

## Headline
Across the UK market, fewer than half of complaints are resolved within 3 days, and that has barely moved in five years. Speed varies far more between sectors, and between firms inside one sector, than over time. That gap is the opportunity for a redesigned process.

## What the data shows (verified)

**1. The market is stable on speed and softer on outcomes.**
- In 2026 H1, firms opened 1,851,357 complaints (+6.3% on 2025 H2) and closed 1,832,014.
- Share upheld fell from 61.3% (2022 H1) to 54.7% (2026 H1). FCA publishes 54.8%; the 0.1 point difference is rounding.
- Closing within 3 days stayed between 43.4% and 51.0% (44.7% in 2026 H1). Over 8 weeks stayed between 5.3% and 7.6% (5.5%).

**2. Speed depends heavily on the sector.**
| Firm type (2026 H1) | Within 3 days | Over 8 weeks |
|---|---|---|
| Bank and Building society | 51.2% | 6.1% |
| Life insurer | 27.1% | 10.1% |
| Investment management | 22.5% | 11.0% |
| Personal Investment | 7.3% | 12.7% |

**3. Pensions are slowest and most often upheld.** Decumulation & pensions: 70.4% upheld, 21.5% within 3 days, 12.7% over 8 weeks. Banking and credit cards: 52.9% upheld, 49.7% within 3 days, 6.0% over 8 weeks.

**4. Volume is concentrated.** Current accounts lead with 525,653 complaints opened (+6.8% on 2025 H2), then Motor & transport insurance (237,421, +10.1%) and credit cards (219,131, +0.3%). Fastest risers: ISAs where investment is held (+28.7%), Warranty (+26.9%), Travel (+26.4%).

**5. Firms in the same sector differ widely.** Among Banking and credit cards firms (100+ closed, weighted by complaints closed), the fastest quarter closes 59.2% within 3 days and the slowest 18.2%.

**6. Redress per upheld complaint is stable.** £205 in 2026 H1, within a range of £183 to £238 since 2021 H2.

## What the data does not show
- Why firms are slow. The data has outcomes, not causes. The process stages and causes in the as-is map are hypotheses (H1 to H4) to test with the Bank's own timestamps and interviews.
- Whether faster closing causes better or worse outcomes. Firm-level share upheld and speed are shown side by side, not tested for a causal link.

## Recommendations (design ideas to test, not proven fixes)
1. **Triage on day 1** into simple, standard and complex, so quick fixes are not queued behind investigations.
2. **Delegate a settlement limit** to front-line handlers for small, clear cases.
3. **Set a 48-hour response standard** for product teams asked for information.
4. **Route pensions, investments and other specialist products** to named specialist handlers.
5. **Escalate at day 40** with a customer update, ahead of the 8-week (day 56) limit.
6. **Report the three closing bands weekly** and feed root causes back to product owners.

## Business case (illustrative)
Built in the calculator with placeholder assumptions for a mid-size bank. They are not the Bank's data and should be replaced with its own MI.
- Assumptions: 50,000 complaints closed per half-year; within 3 days from 38% to 50%; over 8 weeks from 8% to 5.5%; £45 per fast fix and £200 per investigated complaint (about £31 an hour); £150 extra per overdue complaint; 10% of overdue complaints go to the Ombudsman at about £1,000 each (£680 case fee for 2026/27 plus handling); £500,000 one-off and £400,000 a year to run; 60% of savings realised as cash.
- Result: gross benefit £2.49m a year, realised £1.49m, net £1.09m after running cost, payback about 0.5 years, 3-year net value £2.77m (undiscounted). The redesign covers its running cost even if only 16% of the gross benefit is realised.
- Not included: redress, retention, regulatory risk and discounting.

## Limitations
- Firms report different periods (192 of 226 use January to June 2026), so firm comparisons are approximate.
- The firm-level file covers 94.9% of national complaints opened (95.1% of closed); 19 rows are joint reporters and 226 firms belong to 137 groups.
- Closing time, share upheld and redress exist only at firm-type and product-group level nationally.
- FCA and Financial Ombudsman Service data are not comparable and are not compared here.
- Firm names are removed from all outputs. This is not a statement about any firm's compliance.
