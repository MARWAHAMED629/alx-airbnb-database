# 📊 Partition Performance Report

## 🎯 Objective
Improve performance of date-based queries on a large `bookings` table by implementing partitioning.

---

## 🧩 Partitioning Strategy

- Partition Type: `RANGE` Partitioning
- Partition Key: `YEAR(start_date)`
- Partitions:
  - `p2022`: Data before 2023
  - `p2023`: Year 2023
  - `p2024`: Year 2024
  - `pmax`: All future dates

---

## ⚙️ Query Tested

```sql
EXPLAIN SELECT * FROM bookings WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
