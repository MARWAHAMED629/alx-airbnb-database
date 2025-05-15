# 🌱 Database Seed Script

```sql
-- ALX AirBnB Clone - Database Seeder
-- Purpose: Populate database with realistic test data
-- Safe for: Development/Staging environments

📂 Repository Structure

db/
├── seeds/
│   ├── seed.sql          # Main seeding script
│   ├── fixtures/         # Optional JSON fixtures
│   └── README.md         # This documentation

🧩 Sample Data Overview

/* Contains 6 entity types with relational integrity */
-- Users (3)       → Guest, Host, Admin
-- Properties (2)  → Different listing types
-- Bookings (2)    → Past + upcoming stays
-- Payments (1)    → Completed transaction
-- Reviews (1)     → Guest feedback
-- Messages (3)    → Simulated conversations

🛠️ Usage

#PostgreSQL

psql -U [username] -d [database_name] -f seeds/seed.sql

#MYSql

mysql -u [username] -p [database_name] < seeds/seed.sql



📊 Data Samples Preview

** --User Table
INSERT INTO users (user_id, email, role) VALUES
    ('a1b2c3d4-1234-5678-9101', 'guest@example.com', 'guest'),
    ('b2c3d4e5-2345-6789-1011', 'host@example.com', 'host'),
    ('c3d4e5f6-3456-7891-0111', 'admin@example.com', 'admin');

** --Properties Table
INSERT INTO properties (property_id, host_id, title, daily_rate) VALUES
    ('d4e5f6g7-4567-8910-1112', 'b2c3d4e5-2345-6789-1011', 'Beachfront Villa', 250.00),
    ('e5f6g7h8-5678-9101-1121', 'b2c3d4e5-2345-6789-1011', 'Downtown Loft', 175.50);

** --Bookings Table

INSERT INTO bookings (booking_id, property_id, guest_id, status) VALUES
    ('f6g7h8i9-6789-1011-1213', 'd4e5f6g7-4567-8910-1112', 'a1b2c3d4-1234-5678-9101', 'completed'),
    ('g7h8i9j0-7891-0111-2131', 'e5f6g7h8-5678-9101-1121', 'a1b2c3d4-1234-5678-9101', 'confirmed');


** --🔄 Reseeding Options



# To reset and reseed (PostgreSQL example)
psql -U [user] -c "DROP DATABASE [dbname]; CREATE DATABASE [dbname];"
psql -U [user] -d [dbname] -f schema.sql -f seeds/seed.sql


