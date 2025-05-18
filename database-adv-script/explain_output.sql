-- Before adding index
EXPLAIN SELECT * FROM bookings WHERE user_id = 1;

-- After adding index
-- Assumes idx_booking_user_id has been created
EXPLAIN SELECT * FROM bookings WHERE user_id = 1;
