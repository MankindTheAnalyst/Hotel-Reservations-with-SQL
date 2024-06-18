-- Project Hotel Reservation Analysis with SQL

#1. What is the total number of reservations in the dataset?

SELECT count(room_type_reserved) AS total_reservations
FROM hrd;

#2.Which meal plan is the most popular among guests?

select type_of_meal_plan, count(*) as most_preferred_meal
from hrd
group by type_of_meal_plan
order by most_preferred_meal desc
limit 1;

#3.What is the average price per room for reservations involving children?

SELECT AVG(avg_price_per_room) AS average_value_no_of_children
FROM hrd
WHERE no_of_children > 0;

#4.How many reservations were made for the year 20XX (replace XX with the desired year)?

SELECT COUNT(*) AS total_reservations
FROM hrd
 WHERE YEAR(arrival_date) = 2018;
 
#5.What is the most commonly booked room type?

Select room_type_reserved, count(*) as 
room_type_reserved_By_customer
from hrd
group by room_type_reserved
order by room_type_reserved_By_customer desc
 limit 1;

#6.How many reservations fall on a weekend (no_of_weekend_nights > 0)?

SELECT COUNT(*) AS weekend_reservations
FROM hrd
WHERE no_of_weekend_nights > 0;

#7.What is the highest and lowest lead time for reservations?

SELECT max(lead_time)as highest_lead_time , min(lead_time) as 
Lowest_lead_time
FROM hrd;

#8.What is the most common market segment type for  reservations?

SELECT market_segment_type as most_perefer_segment_type, count(market_segment_type) as total_market_type
FROM hrd
group by market_segment_type
order by most_perefer_segment_type desc
limit 1;

#9.How many reservations have a booking status of "Confirmed"?

SELECT booking_status ,count(booking_status) as confirm
FROM hrd
group by booking_status
order by confirm
limit 1,1;

#10.What is the total number of adults and children across all reservations?

SELECT sum(no_of_adults) as adults,sum(no_of_children) as children
FROM hrd;

#11. What is the average number of weekend nights for reservations involving children?

SELECT no_of_children ,avg(no_of_weekend_nights) as avg_no_of_weekend_night
FROM hrd
group by no_of_children;

#12.How many reservations were made in each month of the year?
SELECT
EXTRACT(YEAR from arrival_date )AS reservation_year,
EXTRACT(month from arrival_date ) AS reservation_month,
COUNT(arrival_date) AS reservations_count,
arrival_date
FROM
hrd
GROUP BY
arrival_date,
arrival_date
ORDER BY
reservation_month,
reservation_year;

#13 What is the average number of nights (both weekend and weekday) spent by guests for each room type? 

SELECT room_type_reserved, avg(no_of_weekend_nights) as 
weekend_night ,
avg(no_of_week_nights) as week_nights
from hrd
group by room_type_reserved;

#14. For reservations involving children, what is the most common room type, and what is the average price for that room type?

SELECT
room_type_reserved,
AVG(avg_price_per_room) AS avg_price
FROM
hrd
WHERE
no_of_children > 0
GROUP BY
room_type_reserved
order by
count(*) desc
limit 1;

# 15. Find the market segment type that generates the highest average price per room.

select market_segment_type, sum(avg_price_per_room) AS Highest_avg_price_per_room
from hrd
group by market_segment_type
order by Highest_avg_price_per_room desc
limit 1;
