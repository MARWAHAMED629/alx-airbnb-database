# Index Performance Report

## 🌟 Objective

Improve the performance of frequently executed SQL queries by creating indexes on high-usage columns in the `User`, `Booking`, and `Property` tables.

## 🧩 Identified High-Usage Columns

The following columns were selected for indexing due to their frequent presence in `WHERE`, `JOIN`, and `ORDER BY` clauses:

| Index Name                 | Table    | Column       | Purpose                                         |
| -------------------------- | -------- | ------------ | ----------------------------------------------- |
| idx\_user\_email           | User     | email        | Speeds up login and email-based lookups         |
| idx\_property\_host\_id    | Property | host\_id     | Accelerates property retrievals per host        |
| idx\_booking\_property\_id | Booking  | property\_id | Enhances JOINs and filters involving properties |
| idx\_booking\_user\_id     | Booking  | user\_id     | Optimizes user-specific booking queries         |
| idx\_payment\_booking\_id  | Payment  | booking\_id  | Fast access to payments by booking              |
| idx\_review\_property\_id  | Review   | property\_id | Boosts review lookups by property               |
| idx\_review\_user\_id      | Review   | user\_id     | Improves retrieval of reviews by user           |

## 🧪 Performance Comparison

**Before Indexing:**
Queries like `SELECT * FROM Booking WHERE user_id = ?` caused full table scans, leading to slow response times on large datasets.

**After Indexing:**
Execution plans indicate index usage with significantly fewer rows scanned, improving performance notably.

### Sample Analysis

```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = 1;
```

**Before:** Type = ALL (full table scan)

**After:** Type = ref (index used), with key = idx\_booking\_user\_id

## 🏐 Index Creation Commands

**File: `database_index.sql`**

```sql
-- Index for faster lookup of users by email
CREATE INDEX idx_user_email ON User (email);

-- Index to optimize property retrieval by host
CREATE INDEX idx_property_host_id ON Property (host_id);

-- Index to speed up joins on property in bookings
CREATE INDEX idx_booking_property_id ON Booking (property_id);

-- Index for faster lookup of bookings by user
CREATE INDEX idx_booking_user_id ON Booking (user_id);

-- Index to speed up payment lookup by booking
CREATE INDEX idx_payment_booking_id ON Payment (booking_id);

-- Index for retrieving reviews by property
CREATE INDEX idx_review_property_id ON Review (property_id);

-- Index for fetching reviews by user
CREATE INDEX idx_review_user_id ON Review (user_id);
```

