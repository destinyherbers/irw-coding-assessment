# 311 service requests: which parts of DC are most neglected?
# ---------------------------------------------------------------
# First-draft analysis generated with an AI coding assistant and lightly
# edited. It runs and produces a clean-looking result. Your job (Part 2) is to
# review it the way you'd review a reporter's or intern's notebook before it
# turns into a published story.
#
# Run:  python review/flawed_analysis.py
# Requires: pandas, matplotlib

import pandas as pd
import matplotlib.pyplot as plt

# DC ward populations (2020 census, rounded). Kept here for reference.
WARD_POPULATION = {1: 30000, 2: 35000, 3: 40000, 4: 60000,
                   5: 70000, 6: 80000, 7: 90000, 8: 45000}

df = pd.read_csv("data/sample_311.csv")
print(f"Loaded {len(df)} service requests.")

# Parse dates and drop the few bad ones so the rest of the analysis is clean.
df["date_received"] = pd.to_datetime(df["date_received"], errors="coerce")
df = df.dropna(subset=["date_received"])

# ---- Which ward has the most 311 requests? ----
by_ward = df["ward"].value_counts()
worst_ward = int(by_ward.index[0])
print(f"\nWard {worst_ward} has the most 311 requests ({by_ward.iloc[0]}).")
print("This makes Ward", worst_ward, "the most neglected part of the city.")

# ---- What are people complaining about most? ----
top_service = df["service_type"].value_counts().index[0]
top_service_n = df["service_type"].value_counts().iloc[0]
print(f"\nThe #1 complaint citywide is '{top_service}' ({top_service_n} requests).")

pothole_share = (df["service_type"] == "Pothole").sum() / len(df) * 100
print(f"Potholes make up {pothole_share:.1f}% of all requests.")

# ---- How big is the backlog? ----
backlog = df[df["status"] != "Closed"]
print(f"\nThere are {len(backlog)} open requests still awaiting resolution.")

# ---- How fast does the city respond? ----
avg_response = df["response_days"].mean()
print(f"The city takes {avg_response:.0f} days on average to respond to a request.")

# ---- Chart ----
by_ward_sorted = by_ward.sort_index()
plt.figure(figsize=(8, 5))
plt.bar(by_ward_sorted.index.astype(str), by_ward_sorted.values, color="#DC143C")
plt.title(f"Ward {worst_ward} is DC's most neglected ward")
plt.xlabel("Ward")
plt.ylabel("Number of 311 requests")
plt.ylim(150, by_ward_sorted.max() + 20)
plt.tight_layout()
plt.savefig("review/ward_chart.png", dpi=150)
print("\nSaved chart to review/ward_chart.png")
