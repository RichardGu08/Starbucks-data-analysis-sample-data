import pandas as pd
import pymysql
import json
import os

# -----------------------------
# 1. Load CSV
# -----------------------------
file_path = r"C:\Users\Richard\Desktop\Seeu\SQL_course\Starbucks_project\transcript.csv"
df = pd.read_csv(file_path)

# Drop index column
df = df.drop(columns=["MyUnknownColumn"], errors="ignore")

# -----------------------------
# 2. Clean / transform
# -----------------------------

# Rename columns if needed (Kaggle dataset usually uses these)
df = df.rename(columns={
    "person": "person_id",
    "time": "time",
    "event": "event",
    "value": "value"
})

# Ensure JSON column is valid string
def safe_json(x):
    if isinstance(x, dict):
        return json.dumps(x)
    try:
        return json.dumps(eval(x))  # Kaggle sometimes stores dict as string
    except:
        return None

df["value"] = df["value"].apply(safe_json)

# Keep only needed columns
df = df[["person_id", "event", "value", "time"]]

# Drop nulls (optional)
df = df.dropna(subset=["person_id", "event"])

# -----------------------------
# 3. Convert to list of tuples
# -----------------------------
data_list = list(df.itertuples(index=False, name=None))

# Example tuple:
# ('abc123', 'offer received', '{"offer id": "..."}', 10)

# -----------------------------
# 4. Connect to MySQL
# -----------------------------
conn = pymysql.connect(
    host="localhost",
    user="root",
    password="Comet123!",
    database="starbucks",
    autocommit=False
)

cursor = conn.cursor()

# -----------------------------
# 5. Insert (batch)
# -----------------------------
insert_sql = """
INSERT INTO transcript2 (person, event, value, time)
VALUES (%s, %s, %s, %s)
"""

batch_size = 10000

for i in range(0, len(data_list), batch_size):
    batch = data_list[i:i + batch_size]
    cursor.executemany(insert_sql, batch)
    conn.commit()
    print(f"Inserted {i + len(batch)} rows")

# -----------------------------
# 6. Cleanup
# -----------------------------
cursor.close()
conn.close()

print("Import complete.")