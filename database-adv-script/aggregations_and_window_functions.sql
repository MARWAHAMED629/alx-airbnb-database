-- List all users along with the total number of bookings they have made
-- Users with no bookings will still appear in the result with a count of 0
SELECT 
    u.user_id, 
    u.first_name, 
    u.last_name, 
    COUNT(b.booking_id) AS total_bookings
FROM 
    users u
LEFT JOIN 
    bookings b ON u.user_id = b.user_id
GROUP BY 
    u.user_id, u.first_name, u.last_name;


-- Calculate the number of bookings for each property
-- Then rank the properties based on their booking counts using window functions
WITH property_bookings AS (
    SELECT
        p.property_id,
        p.name,
        COUNT(b.booking_id) AS booking_count
    FROM
        properties p
    LEFT JOIN
        bookings b ON p.property_id = b.property_id
    GROUP BY
        p.property_id, p.name
)
SELECT
    property_id,
    name,
    booking_count,
    ROW_NUMBER() OVER (ORDER BY booking_count DESC) AS row_num, -- Assigns a unique sequential number to each row
    RANK() OVER (ORDER BY booking_count DESC) AS rank           -- Assigns the same rank to rows with equal booking counts
FROM
    property_bookings
ORDER BY
    booking_count DESC;

