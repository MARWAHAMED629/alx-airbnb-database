-- Fetch bookings along with the user information for each booking
SELECT 
    b.booking_id, 
    b.start_date, 
    b.end_date, 
    b.total_price, 
    u.first_name, 
    u.last_name, 
    u.email
FROM 
    bookings AS b
INNER JOIN 
    users AS u ON b.user_id = u.user_id;


-- Fetch all properties and their corresponding reviews, if available
SELECT 
    p.property_id, 
    p.name, 
    p.description, 
    r.review_id, 
    r.rating, 
    r.comment
FROM 
    properties AS p
LEFT JOIN 
    reviews AS r ON p.property_id = r.property_id;


-- Simulate a FULL OUTER JOIN to retrieve all users and all bookings,
-- including users without bookings and bookings without users

-- Part 1: Users with or without bookings
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM
    users AS u
LEFT JOIN
    bookings AS b ON u.user_id = b.user_id

UNION

-- Part 2: Bookings without corresponding users
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM
    users AS u
RIGHT JOIN
    bookings AS b ON u.user_id = b.user_id
WHERE
    u.user_id IS NULL;

