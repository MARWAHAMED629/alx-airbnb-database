-- Retrieve properties where the average rating from reviews is greater than 4.0
SELECT 
    p.property_id, 
    p.name, 
    p.description,
    avg_reviews.avg_rating
FROM 
    properties AS p
JOIN (
    SELECT 
        property_id, 
        AVG(rating) AS avg_rating
    FROM 
        reviews
    GROUP BY 
        property_id
) AS avg_reviews ON p.property_id = avg_reviews.property_id
WHERE 
    avg_reviews.avg_rating > 4.0;

-- Retrieve users who have made more than 3 bookings
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    booking_stats.booking_count
FROM
    users AS u
JOIN (
    SELECT
        user_id,
        COUNT(*) AS booking_count
    FROM
        bookings
    GROUP BY
        user_id
) AS booking_stats ON u.user_id = booking_stats.user_id
WHERE
    booking_stats.booking_count > 3;

