use world;
CREATE TABLE drivers (
  driver_id   INT PRIMARY KEY,
  driver_name VARCHAR(50) NOT NULL,
  base_area   VARCHAR(50) NOT NULL
);

-- -------------------------
-- Create table: trips  (DATE column included)
-- -------------------------
CREATE TABLE trips (
  trip_id      INT PRIMARY KEY,
  driver_id    INT NOT NULL,
  trip_date    DATE NOT NULL,
  distance_km  DECIMAL(5,1) NOT NULL,
  fare         INT NOT NULL,
  rating       DECIMAL(3,1) NOT NULL,
  CONSTRAINT fk_trips_driver
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);

-- -------------------------
-- Insert data: drivers (4 rows)
-- -------------------------
INSERT INTO drivers (driver_id, driver_name, base_area) VALUES
(1, 'Asha',  'Indiranagar'),
(2, 'Ravi',  'Koramangala'),
(3, 'Meera', 'Whitefield'),
(4, 'Kabir', 'HSR Layout');

-- -------------------------
-- Insert data: trips (10 rows)
-- -------------------------
INSERT INTO trips (trip_id, driver_id, trip_date, distance_km, fare, rating) VALUES
(101, 1, '2025-11-01', 12.0, 350, 4.8),
(102, 1, '2025-11-02',  5.5, 180, 4.6),
(103, 2, '2025-11-01',  8.0, 260, 4.9),
(104, 2, '2025-11-03', 15.0, 500, 4.7),
(105, 3, '2025-11-02',  3.0, 120, 4.2),
(106, 3, '2025-11-04', 22.0, 780, 4.9),
(107, 4, '2025-11-01',  6.0, 210, 4.5),
(108, 4, '2025-11-03',  9.0, 300, 4.4),
(109, 4, '2025-11-04',  4.0, 150, 4.8),
(110, 1, '2025-11-04', 18.0, 620, 4.9);

-- Quick check
SELECT * FROM drivers ORDER BY driver_id;
SELECT * FROM trips ORDER BY trip_id;

SELECT * FROM drivers;
SELECT * FROM trips;

-- For each trip_date, show number of trips, total fare, and average rating.
select trip_date, count(*) as trips_count, sum(fare) as total_fare, avg(rating) as avg_rating 
from trips group by trip_date order by trip_date;

-- By base_area, show total trips, total fare, and average distance.
select d.base_area, count(t.trip_id) as trips, sum(t.fare) as total_fare, avg(t.distance_km) as avg_distance 
from drivers d join trips t on d.driver_id = t.driver_id group by d.base_area order by d.base_area;

-- Rating buckets count (>=4.8 as “High”, else “Other”)
select case 
when rating >= 4.8 then 'high' else 'other' end as rating_bucket, count(*) as trips 
from trips group by rating_bucket;

-- Days where total fare >= 800 (GROUP BY + HAVING)
select trip_date,sum(fare) as total_fare from trips group by trip_date having sum(fare) >=800;

-- Base-area average rating, only areas with avg rating >= 4.7 (HAVING)
select base_area,avg(rating) as avg_rating from drivers as d join trips as t on d.driver_id = t.driver_id group by base_area having avg(rating)>=4.7;

-- Trips with fare greater than the overall average fare (single-row subquery)
select trip_id,driver_id,fare from trips where fare > (select avg(fare) from trips);

-- Drivers who have at least one trip rated 4.9 (multi-row IN subquery)
select d.driver_id, d.driver_name from drivers as d 
where d.driver_id in (select driver_id from trips where rating = 4.9);

-- Drivers whose total fare is greater than the average total fare per driver
select d.driver_id, d.driver_name, dt.total_fare from (select driver_id, sum(fare) as total_fare 
from trips group by driver_id) dt join drivers d on d.driver_id = dt.driver_id 
where dt.total_fare > (select avg(total_fare) 
from (select sum(fare) as total_fare from trips group by driver_id) x);

-- Latest trip per driver
select driver_id, trip_id, trip_date, fare from (select *, row_number() over 
(partition by driver_id order by trip_date desc, trip_id desc) rn from trips) t where rn = 1;

-- Row number of trips per driver ordered by date (then trip_id)
select driver_id, trip_id, trip_date, row_number() over 
(partition by driver_id order by trip_date, trip_id) as rn from trips order by driver_id, rn;

-- Running total fare per driver over time
select driver_id, trip_id, trip_date, fare, sum(fare) 
over (partition by driver_id order by trip_date, trip_id rows unbounded preceding) as running_fare 
from trips order by driver_id, trip_date;

-- Rank trips by fare within each driver (highest fare rank 1)
select driver_id, trip_id, fare, rank() over (partition by driver_id order by fare desc) as fare_rank 
from trips order by driver_id, fare_rank;

-- Show each trip’s fare minus the driver’s average fare (window AVG)
select driver_id, trip_id, fare, fare - avg(fare) over (partition by driver_id) as diff_from_avg 
from trips order by driver_id, trip_id;

-- For each driver, show the previous trip’s fare (LAG) ordered by date
select driver_id, trip_id, trip_date, fare, lag(fare) over 
(partition by driver_id order by trip_date, trip_id) as prev_fare from trips order by driver_id, trip_date;




