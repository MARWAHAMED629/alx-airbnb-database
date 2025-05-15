# Entity-Relationship Diagram (ERD) - ALX AirBnB Clone

## Objective

Create a visual ER diagram that models the database for our AirBnB-like backend, based on the following specifications.

## Entities and Attributes

### User

- user_id (PK)
- first_name
- last_name
- email (UNIQUE)
- password_hash
- phone_number
- role (ENUM: guest, host, admin)
- created_at

### Property

- property_id (PK)
- host_id (FK → User)
- name
- description
- location
- pricepernight
- created_at
- updated_at

### Booking

- booking_id (PK)
- property_id (FK → Property)
- user_id (FK → User)
- start_date
- end_date
- total_price
- status (ENUM: pending, confirmed, canceled)
- created_at

### Payment

- payment_id (PK)
- booking_id (FK → Booking)
- amount
- payment_date
- payment_method (ENUM: credit_card, paypal, stripe)

### Review

- review_id (PK)
- property_id (FK → Property)
- user_id (FK → User)
- rating (1–5)
- comment
- created_at

### Message

- message_id (PK)
- sender_id (FK → User)
- recipient_id (FK → User)
- message_body
- sent_at

## Relationships

- A User can host many Properties.
- A Property belongs to one User (host).
- A User can make many Bookings.
- A Booking is made by one User.
- A Booking is for one Property.
- A Booking can have one Payment.
- A User can leave many Reviews on Properties.
- A Property can have many Reviews.
- A User can send and receive many Messages.

## Diagram

The ER diagram is defined in the PlantUML file: `ERD/ERD.drawio`.

You can also view the rendered image: `ERD/erd.png`
