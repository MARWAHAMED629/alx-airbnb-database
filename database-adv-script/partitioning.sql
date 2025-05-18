-- 🧱 Step 1: Drop the original table if it exists
DROP TABLE IF EXISTS bookings;

-- 🧱 Step 2: Create the partitioned table
CREATE TABLE bookings (
    booking_id INT NOT NULL,
    property_id INT NOT NULL,
    user_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2),
    status VARCHAR(10),
    PRIMARY KEY (booking_id, start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- ✅ Step 3: Insert some sample data
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(1, 101, 201, '2022-06-01', '2022-06-05', 500.00, 'confirmed'),
(2, 102, 202, '2023-07-10', '2023-07-12', 300.00, 'confirmed'),
(3, 103, 203, '2024-08-15', '2024-08-20', 800.00, 'pending'),
(4, 104, 204, '2023-09-01', '2023-09-03', 400.00, 'canceled');

-- 🧪 Step 4: Test performance query
EXPLAIN SELECT * FROM bookings WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
