create database example;
use example;
select * from dim_date;
select * from dim_hotels;
select * from dim_rooms;
select * from fact_aggregated_bookings;
select * from fact_bookings;


CREATE TABLE FACT_BOOKINGS (
    booking_id TEXT,
    property_id INT,
    booking_date TEXT,
    check_in_date TEXT,
    checkout_date TEXT,
    no_guests INT,
    room_category TEXT,
    booking_platform TEXT,
    ratings_given TEXT,
    booking_status TEXT,
    revenue_generated INT,
    revenue_realized INT,
    customer_id INT,
    payment_method TEXT,
    stay_duration INT,
    cancellation_reason TEXT,
    is_loyalty_member TEXT,
    country TEXT,
    customer_age INT,
    special_requests TEXT,
    discount_applied DOUBLE,
    booking_channel TEXT
);

set global local_infile=on;


select * from fact_bookings;

### Total Revenue ###

select sum(revenue_realized) as "Total_Revenue" from Fact_bookings;

select sum(revenue_realized)/1000000 as TotalRevenueInMillions from Fact_bookings;

###Total Bookings###
select count(*) as "Total_Bookings" from fact_bookings;

###Total Capacity###
select sum(capacity) as "Total_Capacity" from fact_aggregated_bookings;

###Total Successful Booking###
select count(booking_id) as Total_Successful_Booking from fact_bookings where booking_status = "Checked Out";

###Occupancy Percentage###

 
 select round(SUM(successful_bookings) / SUM(capacity) * 100, 2) AS occupancy_percentage
FROM fact_aggregated_bookings;


###Average Rating###


SET SQL_SAFE_UPDATES = 0;

select avg(ratings_given)as Avg_Rating from fact_bookings where ratings_given is not null and ratings_given!='';


###Total Cancellations###
Select count(booking_id) As "TotalBookingCancelled" from fact_bookings where booking_status= "Cancelled";

SELECT round((count(case when booking_status = 'Cancelled' then 1 end) * 100.0 / count(*)), 2) as "CancelledPercentage"
FROM fact_bookings;


###Total No Show###
Select count(booking_id) as "TotalNoShow" from fact_bookings where booking_status="No Show";

###City Wise Revenue###
Select T2.City, sum(T1.revenue_realized) as Total_Revenue from fact_bookings T1
inner join dim_hotels T2 on T1.property_id=T2.property_id group by T2.City;


###Property Wise Revenue###
Select T2.Property_name,sum(T1.revenue_realized) as TotalRevenue from fact_bookings T1
inner join dim_hotels T2 on T1.property_id=T2.property_id Group By	T2.property_name;

###City Wise Total Bookings###
Select T2.City,count(T1.booking_id) As TotalBookings From fact_bookings
T1 inner Join dim_hotels T2 on T1.property_id=T2.property_id group by	T2.City;



###Monthly Bookings ###
SELECT DATE_FORMAT(T1.check_in_date, '%Y-%m') AS booking_month,
    COUNT(T1.booking_id) AS TotalBookings
FROM fact_bookings T1
GROUP BY booking_month
ORDER BY booking_month;

###Monthly Revenue###
SELECT DATE_FORMAT(T1.check_in_date, '%Y-%m') AS Month,
    SUM(T1.revenue_realized) AS Monthly_Revenue
FROM fact_bookings T1
GROUP BY Month
ORDER BY Month;

###Top 3 Booking Platforms###
select booking_platform,count(*) as total_bookings from fact_bookings
group by booking_platform order by total_bookings desc limit 3;

###Total Bookings from different countries###(Top to Bottom - sort)
select country,Count(*) as total_bookings from fact_bookings group by country order by total_bookings DESC;

###Total Revenue generated from each room class and discounts applied###
select T2.room_class,sum(T1.discount_applied) As Total_Discount, sum(T1.revenue_realized) As Total_Revenue From fact_bookings T1
Join dim_rooms T2 On T1.room_category=T2.room_id Group by T2.room_class;









