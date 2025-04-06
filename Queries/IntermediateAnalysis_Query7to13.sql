-- 7. Top 10 hosts by listings
SELECT host_id, host_name, COUNT(*) AS total_listings
FROM listings
GROUP BY host_id, host_name
ORDER BY total_listings DESC
LIMIT 10;

-- 8. Most Expensive Neighbourhoods
SELECT neighbourhood, ROUND(AVG(price), 2) AS avg_price
FROM listings
GROUP BY neighbourhood
ORDER BY avg_price DESC
LIMIT 10;

-- 9. Neighbourhood wise Room type distribution
SELECT 
  neighbourhood,
  COUNT(CASE WHEN room_type = 'Entire home/apt' THEN 1 END) AS entire_home,
  COUNT(CASE WHEN room_type = 'Private room' THEN 1 END) AS private_room,
  COUNT(CASE WHEN room_type = 'Shared room' THEN 1 END) AS shared_room
FROM listings
GROUP BY neighbourhood
ORDER BY entire_home DESC;

--10. Neighbourhoods with listings above City Average
WITH avg_price_london AS (
  SELECT AVG(price) AS city_avg FROM clean_listings
)
SELECT l.neighbourhood, ROUND(AVG(l.price), 2) AS neighbourhood_avg
FROM clean_listings l, avg_price_london a
GROUP BY l.neighbourhood
HAVING AVG(l.price) > a.city_avg
ORDER BY neighbourhood_avg DESC;

-- 11. Top 5 Listings per neighbourhood_group by Reviews
Select * from (

	select id, name, neighbourhood_group, number_of_reviews,
	rank() over( partition by neighbourhood_group order by number_of_reviews DESC) as rank
	from clean_listings
	) ranked_listings
where rank<=5;

-- 12. Most Active hosts with average reviews 
SELECT host_id, host_name,
       COUNT(id) AS total_listings,
       ROUND(AVG(number_of_reviews), 2) AS avg_reviews
FROM clean_listings
GROUP BY host_id, host_name
HAVING COUNT(id) > 5
ORDER BY avg_reviews DESC
LIMIT 10;

-- 13.  Calculate Total Monthly Revenue Potential

with Monthly_Revenue as (
	select id, neighbourhood, price, availability_365,
	round((price * (availability_365/30)), 2) as estimated_mthly_revenue
	from clean_listings
	where availability_365>0
)
select neighbourhood, round(avg(estimated_mthly_revenue),2) as avg_mthly_revenue
from Monthly_Revenue
group by neighbourhood
order by avg_mthly_revenue desc
limit 10;
