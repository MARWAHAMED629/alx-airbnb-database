# 🔧 Optimization Report

## 🎯 Objective
Improve the performance of complex booking queries by restructuring joins and using CTEs where appropriate.

---

## 🧾 Initial Query Description
The initial query joins the `bookings`, `users`, `properties`, and `payments` tables to return a complete record of each booking.

### ❌ Issues Identified
- Multiple joins over large tables lead to full scans.
- Lack of index usage on `user_id`, `property_id`, and `booking_id` columns.
- No filtering applied, causing unnecessary data processing.

---

## ✅ Optimization Strategy
- Used **CTE (Common Table Expression)** to improve logical clarity and query planning.
- Ensured **indexes** exist on foreign key columns used in `JOIN` conditions:
  - `bookings.user_id`
  - `bookings.property_id`
  - `payments.booking_id`

---

## 🧪 Performance Comparison

### Before Optimization (Full Scan Example)
```sql
EXPLAIN ANALYZE SELECT * FROM bookings;
