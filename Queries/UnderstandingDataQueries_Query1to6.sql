-- 1. Preview Dataset
SELECT * FROM clean_listings LIMIT 5;

-- 2. Top 10 Neighbourhoods by listings
SELECT neighbourhood, count(*) as listing_count
from clean_listings
GROUP by neighbourhood
ORDER by listing_count DESC
LIMIT 10;

-- 3. Average price by room type
SELECT room_type, ROUND(AVG(price), 2) AS avg_price
FROM clean_listings
GROUP BY room_type
ORDER BY avg_price DESC;

-- 4. Listings available all year
SELECT COUNT(*) AS always_available
FROM listings
WHERE availability_365 = 365;

-- 5. Most Reviewed listings
SELECT name, number_of_reviews
FROM listings
ORDER BY number_of_reviews DESC
LIMIT 5;

-- 6. Avg Minimum Nights by Neighbourhood Group
SELECT neighbourhood_group, ROUND(AVG(minimum_nights), 2) AS avg_min_nights
FROM listings
GROUP BY neighbourhood_group;
