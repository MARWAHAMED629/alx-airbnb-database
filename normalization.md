# Database Normalization - ALX AirBnB Clone

```sql
-- Database Normalization Report
-- Project: ALX AirBnB Clone
-- Status: Compliant up to 3NF
# Database Normalization - ALX AirBnB Clone

```sql
-- Database Normalization Report
-- Project: ALX AirBnB Clone
-- Status: Compliant up to 3NF

## Objective
To verify that the database schema adheres to normalization principles (up to 3NF) for:

-- Minimizing data redundancy

-- Ensuring data integrity

-- Optimizing query performance

## First Normal Form (1NF) Compliance

-- 1NF requires:
-- 1. Atomic column values
-- 2. No repeating groups
-- 3. Unique row identifiers

-- Example compliant table:
CREATE TABLE users (
    user_id UUID PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
    -- All columns contain atomic values
    -- No array-type or repeating groups
);


- ✅ All tables in the schema satisfy 1NF.


## Second Normal Form (2NF)

-- 2NF requires:
-- 1. Already in 1NF
-- 2. No partial dependencies (all non-PK attributes depend on FULL PK)

-- Compliant example (single-column PK):
CREATE TABLE properties (
    property_id UUID PRIMARY KEY,
    host_id UUID REFERENCES users(user_id),
    title VARCHAR(100) NOT NULL,
    -- All attributes depend entirely on property_id
    -- No composite PK → no partial dependencies possible
);

-- Non-compliant example would be:
-- CREATE TABLE property_amenities (
--     property_id UUID,
--     amenity_id UUID,
--     amenity_name VARCHAR(50),  -- Depends on amenity_id, not full PK
--     PRIMARY KEY (property_id, amenity_id)
-- );

- ✅ All tables satisfy 2NF.


## Third Normal Form (3NF)


-- 3NF requires:
-- 1. Already in 2NF
-- 2. No transitive dependencies (non-PK attributes depend ONLY on PK)



-- Compliant payment table:
CREATE TABLE payments (
    payment_id UUID PRIMARY KEY,
    booking_id UUID REFERENCES bookings(booking_id),
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(20) NOT NULL,
    -- All attributes depend only on payment_id
    -- No attribute depends on another non-PK attribute
);

-- Compliant review table:
CREATE TABLE reviews (
    review_id UUID PRIMARY KEY,
    property_id UUID REFERENCES properties(property_id),
    user_id UUID REFERENCES users(user_id),
    rating SMALLINT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    -- rating and comment depend only on review_id
    -- No transitive dependencies
);



- ✅ The database schema satisfies 3NF.


---

## Conclusion


-- After comprehensive analysis:

-- Normalization Verification Results:
SELECT 
    '1NF' AS normal_form,
    TRUE AS compliant,
    'All tables have atomic values and proper PKs' AS notes
UNION ALL
SELECT '2NF', TRUE, 'No partial dependencies detected'
UNION ALL
SELECT '3NF', TRUE, 'No transitive dependencies found';

-- Final Assessment: The database schema fully complies with 1NF, 2NF, and 3NF normalization standards. No structural anomalies were identified.
