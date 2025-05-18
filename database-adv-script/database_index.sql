-- Index for faster lookup of users by email
CREATE INDEX idx_user_email ON User (email);

-- Index to optimize queries retrieving properties by host
CREATE INDEX idx_property_host_id ON Property (host_id);

-- Index to speed up joins and queries on property_id in Booking
CREATE INDEX idx_booking_property_id ON Booking (property_id);

-- Index to optimize queries fetching bookings by user
CREATE INDEX idx_booking_user_id ON Booking (user_id);

-- Index for quick access to payment information by booking
CREATE INDEX idx_payment_booking_id ON Payment (booking_id);

-- Index to improve performance of review-related queries by property
CREATE INDEX idx_review_property_id ON Review (property_id);

-- Index to enhance query speed for reviews written by specific users
CREATE INDEX idx_review_user_id ON Review (user_id);
