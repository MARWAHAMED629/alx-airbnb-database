# 📊 Database Schema Definition (DDL)

```sql
-- ALX AirBnB Clone - Database Schema
-- Normalization Level: 3NF Compliant
-- Engine: PostgreSQL/MySQL Compatible

🏗️ Schema Overview
This repository contains the Data Definition Language (DDL) scripts for the AirBnB clone backend database.

db/
├── schema.sql       # Complete database schema definition
├── migrations/      # Versioned schema changes
└── README.md        # This documentation


🧑‍💻 Installation
To initialize the database:

# PostgreSQL
psql -U [username] -d [database] -f schema.sql

# MySQL
mysql -u [username] -p [database] < schema.sql


🏛️ Core Entities



## Entities and Relationships

- **User**: Holds user information (guest, host, admin).
- **Property**: Associated with a host.
- **Booking**: Links users to property bookings.
- **Payment**: Payment data per booking.
- **Review**: Users review properties.
- **Message**: Messaging between users.

🔗 Key Relationships

Relation	Description
users → properties	One-to-many (Host owns properties)
properties → bookings	One-to-many (Property has bookings)
users → bookings	One-to-many (Guest makes bookings)

---


🏆 Normalization Status

-- Normalization Verification
SELECT
    '1NF' AS form,
    TRUE AS compliant,
    'Atomic values, no repeating groups' AS details
UNION ALL
SELECT '2NF', TRUE, 'No partial dependencies'
UNION ALL
SELECT '3NF', TRUE, 'No transitive dependencies';


🚀 Usage Example


# Sample ORM Usage (Python)
property = Property.query.filter_by(host_id=current_user.id).first()
new_booking = Booking(
    property_id=property.id,
    guest_id=current_user.id,
    check_in=datetime(2023, 12, 15)
db.session.add(new_booking)


📜 License


MIT © ALX AirBnB Clone Team



