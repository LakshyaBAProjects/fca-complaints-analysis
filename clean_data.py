"""
clean_data.py - load the two raw FCA complaints files into SQLite.

What it does, in plain English:
1. Reads the aggregate file (national totals, long format) into 3 tables.
2. Reads the firm-level file (one row per firm, wide format) and reshapes it
   into ONE tidy table: one row per firm x product group, with counts.
3. Saves everything to 02_data/clean/complaints.db and writes CSV copies.

It never changes the raw files. Percentages in the firm file are fractions
(0.5 = 50%). There is no ">8 weeks" column at firm level, so we derive it.
"""
import shutil, sqlite3, tempfile
from pathlib import Path
import pandas as pd

ROOT = Path(__file__).resolve().parent
RAW = ROOT / "02_data" / "raw"
CLEAN = ROOT / "02_data" / "clean"
AGG = RAW / "aggregate-complaints-data-2026-h1.xlsx"
FIRM = RAW / "firm-level-complaints-data-2026-h1.xlsx"

PRODUCTS = ["Banking and credit cards", "Decumulation & pensions", "Home finance",
            "Insurance & pure protection", "Investments"]

def clean_cols(df):
    df.columns = [str(c).strip() for c in df.columns]
    return df

# ---- 1. Aggregate file (already long format) ----
agg_firm_type = clean_cols(pd.read_excel(AGG, sheet_name="Firm Type"))
agg_firm_type.columns = ["half_year", "firm_type", "variable_type", "variable", "volume"]
agg_product_group = clean_cols(pd.read_excel(AGG, sheet_name="Product Group"))
agg_product_group.columns = ["half_year", "product_group", "variable_type", "variable", "volume"]
agg_product = clean_cols(pd.read_excel(AGG, sheet_name="Product Specific"))
agg_product.columns = ["half_year", "product_group", "product", "variable_type", "volume"]

# ---- 2. Firm-level file: melt each wide sheet, then join ----
def melt_sheet(sheet, name):
    df = clean_cols(pd.read_excel(FIRM, sheet_name=sheet))
    df = df[df["Firm Name"].notna()]
    df = df.rename(columns={"Firm Name": "firm_name", "Group": "firm_group",
                            "Joint Reporting": "joint_reporting",
                            "Reporting period": "reporting_period"})
    keep = [c for c in PRODUCTS if c in df.columns]
    long = df.melt(id_vars=["firm_name", "firm_group", "joint_reporting", "reporting_period"],
                   value_vars=keep, var_name="product_group", value_name=name)
    return long.dropna(subset=[name])

opened = melt_sheet("Opened", "opened")
closed = melt_sheet("Closed", "closed")
p3 = melt_sheet("Percentage within 3 days", "pct_within_3d")
p38 = melt_sheet("Percentage after 3 days, within", "pct_3d_to_8w")
pup = melt_sheet("Percentage upheld", "pct_upheld")

keys = ["firm_name", "firm_group", "joint_reporting", "reporting_period", "product_group"]
firm_product = closed
for part in (opened, p3, p38, pup):
    firm_product = firm_product.merge(part, on=keys, how="outer")
# derive over-8-weeks share (no column in the file)
firm_product["pct_over_8w"] = (1 - firm_product["pct_within_3d"] - firm_product["pct_3d_to_8w"]).clip(lower=0)
# counts back from percentages (used for weighting)
firm_product["closed_within_3d"] = firm_product["closed"] * firm_product["pct_within_3d"]
firm_product["upheld_count"] = firm_product["closed"] * firm_product["pct_upheld"]

# firm-level totals (Grand Total columns)
def totals(sheet, name):
    df = clean_cols(pd.read_excel(FIRM, sheet_name=sheet))
    df = df[df["Firm Name"].notna()]
    return df[["Firm Name", "Group", "Joint Reporting", "Reporting period", "Grand Total"]].rename(
        columns={"Firm Name": "firm_name", "Group": "firm_group", "Joint Reporting": "joint_reporting",
                 "Reporting period": "reporting_period", "Grand Total": name})
firm_total = totals("Opened", "opened")
for sheet, name in [("Closed", "closed"), ("Percentage within 3 days", "pct_within_3d"),
                    ("Percentage after 3 days, within", "pct_3d_to_8w"), ("Percentage upheld", "pct_upheld")]:
    firm_total = firm_total.merge(totals(sheet, name), on=["firm_name", "firm_group", "joint_reporting", "reporting_period"], how="outer")
firm_total["pct_over_8w"] = (1 - firm_total["pct_within_3d"] - firm_total["pct_3d_to_8w"]).clip(lower=0)

joint = clean_cols(pd.read_excel(FIRM, sheet_name="Main return Joint reporters"))
joint.columns = ["firm_name", "other_firms_included", "reporting_period"]

# ---- 3. Write DB on a temp copy (the Documents mount can't host SQLite), then copy back ----
tables = {"agg_firm_type": agg_firm_type, "agg_product_group": agg_product_group,
          "agg_product": agg_product, "firm_product": firm_product,
          "firm_total": firm_total, "joint_reporters": joint}
tmpdir = Path(tempfile.mkdtemp())
tmpdb = tmpdir / "complaints.db"
con = sqlite3.connect(tmpdb)
for name, df in tables.items():
    df.to_sql(name, con, index=False, if_exists="replace")
    df.to_csv(CLEAN / f"{name}.csv", index=False)
    print(f"{name}: {len(df)} rows")
con.close()
shutil.copy(tmpdb, CLEAN / "complaints.db")
print("Saved", CLEAN / "complaints.db")
