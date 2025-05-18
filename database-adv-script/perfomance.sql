-- 🔍 Initial Query: Retrieve full booking information with user, property, and payment details
-- This query joins the bookings table with users, properties, and payments
-- to return complete details for each booking.
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    p.name AS property_name,
    p.description AS property_description,
    pay.amount AS payment_amount,
    pay.payment_method
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
LEFT JOIN 
    payments pay ON b.booking_id = pay.booking_id;


-- ✅ Optimized Version Using CTE
-- A Common Table Expression (CTE) is used here to isolate booking data,
-- making the query more readable and potentially improving optimizer performance.
WITH BookingDetails AS (
    SELECT 
        b.booking_id,
        b.user_id,
        b.property_id,
        b.start_date,
        b.end_date,
        b.total_price
    FROM 
        bookings b
)
SELECT 
    bd.booking_id,
    bd.start_date,
    bd.end_date,
    bd.total_price,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    p.name AS property_name,
    p.description AS property_description,
    pay.amount AS payment_amount,
    pay.payment_method
FROM 
    BookingDetails bd
JOIN 
    users u ON bd.user_id = u.user_id
JOIN 
    properties p ON bd.property_id = p.property_id
LEFT JOIN 
    payments pay ON bd.booking_id = pay.booking_id;


-- 🧪 Performance Analysis Section
-- Use EXPLAIN ANALYZE to inspect the execution plan and detect inefficiencies
-- Run this before and after optimization and indexing
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name,
    u.last_name,
    p.name,
    pay.amount
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
LEFT JOIN 
    payments pay ON b.booking_id = pay.booking_id;
