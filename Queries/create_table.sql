CREATE TABLE listings (
    id TEXT,
    name TEXT,
    host_id TEXT,
    host_name TEXT,
    neighbourhood_group TEXT,
    neighbourhood TEXT,
    latitude TEXT,
    longitude TEXT,
    room_type TEXT,
    price TEXT,
    minimum_nights TEXT,
    number_of_reviews TEXT,
    last_review TEXT,
    reviews_per_month TEXT,
    calculated_host_listings_count TEXT,
    availability_365 TEXT,
    number_of_reviews_ltm TEXT,
    license TEXT
);


CREATE TABLE clean_listings AS
SELECT
    CAST(id AS INTEGER) AS id,
    name,
    CAST(host_id AS INTEGER) AS host_id,
    host_name,
    neighbourhood_group,
    neighbourhood,
    CAST(latitude AS REAL) AS latitude,
    CAST(longitude AS REAL) AS longitude,
    room_type,
    CAST(price AS INTEGER) AS price,
    CAST(minimum_nights AS INTEGER) AS minimum_nights,
    CAST(number_of_reviews AS INTEGER) AS number_of_reviews,
    last_review,
    CAST(reviews_per_month AS REAL) AS reviews_per_month,
    CAST(calculated_host_listings_count AS INTEGER) AS calculated_host_listings_count,
    CAST(availability_365 AS INTEGER) AS availability_365,
    CAST(number_of_reviews_ltm AS INTEGER) AS number_of_reviews_ltm,
    license
FROM listings;