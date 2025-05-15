📊 Complete Dataset Preview

👥 Users Table

INSERT INTO users (
    user_id,
    first_name,
    last_name,
    email,
    password_hash,
    phone_number,
    role,
    created_at
) VALUES
    ('11111111-1111-1111-1111-111111111111', 'Alice', 'Smith', 'alice@example.com',
     '$2a$10$xJwL5vWJ9JZ6Z1Z1Z1Z1Zu', '1234567890', 'guest', NOW()),

    ('22222222-2222-2222-2222-222222222222', 'Bob', 'Johnson', 'bob@example.com',
     '$2a$10$yJwL5vWJ9JZ6Z1Z1Z1Z1Zu', '0987654321', 'host', NOW()),

    ('33333333-3333-3333-3333-333333333333', 'Charlie', 'Brown', 'charlie@example.com',
     '$2a$10$zJwL5vWJ9JZ6Z1Z1Z1Z1Zu', NULL, 'admin', NOW());


🏠 Properties Table


INSERT INTO properties (
    property_id,
    host_id,
    title,
    description,
    location,
    price_per_night,
    status
) VALUES
    ('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222',
     'Cozy Cabin', 'A cozy log cabin in the woods.', 'Lake Tahoe, CA', 120.00, 'active'),

    ('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222',
     'Beach House', 'Ocean view with pool.', 'Malibu, CA', 250.00, 'active');


📅 Bookings Table



INSERT INTO bookings (
    booking_id,
    property_id,
    user_id,
    start_date,
    end_date,
    total_price,
    status,
    created_at
) VALUES
    ('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
     '11111111-1111-1111-1111-111111111111', '2025-06-01', '2025-06-05', 480.00,
     'confirmed', NOW()),

    ('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
     '11111111-1111-1111-1111-111111111111', '2025-07-10', '2025-07-12', 500.00,
     'pending', NOW());


⭐ Reviews Table 

INSERT INTO reviews (
    review_id,
    property_id,
    user_id,
    rating,
    comment,
    created_at
) VALUES
    ('rrrrrrr1-rrrr-rrrr-rrrr-rrrrrrrrrrrr', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
     '11111111-1111-1111-1111-111111111111', 5, 'Amazing stay! Clean and quiet.', NOW()),

    ('rrrrrrr2-rrrr-rrrr-rrrr-rrrrrrrrrrrr', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
     '11111111-1111-1111-1111-111111111111', 4, 'Great view but noisy at night.', NOW());

💬 Messages Table

INSERT INTO messages (
    message_id,
    sender_id,
    recipient_id,
    message_body,
    sent_at,
    is_read
) VALUES
    ('mmmmmmm1-mmmm-mmmm-mmmm-mmmmmmmmmmmm', '11111111-1111-1111-1111-111111111111',
     '22222222-2222-2222-2222-222222222222', 'Hi, is the cabin available for June?',
     NOW(), false),

    ('mmmmmmm2-mmmm-mmmm-mmmm-mmmmmmmmmmmm', '22222222-2222-2222-2222-222222222222',
     '11111111-1111-1111-1111-111111111111', 'Yes, it is! Let me know if you want to book.',
     NOW(), false);




🚀 Seeding Commands

# PostgreSQL
psql -U $DB_USER -d $DB_NAME -h $DB_HOST -f seed_data.sql

# MySQL
mysql --user=$DB_USER --password=$DB_PASS --host=$DB_HOST $DB_NAME < seed_data.sql



🔄 Data Relationships



erDiagram
    users ||--o{ properties : "hosts"
    users ||--o{ bookings : "books"
    properties ||--o{ bookings : "has"
    bookings ||--o{ payments : "has"
    properties ||--o{ reviews : "receives"
    users ||--o{ messages : "sends"
