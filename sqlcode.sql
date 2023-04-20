-- stated by joining(union) the 12 tables
WITH tripdata AS (
  SELECT *
FROM `portfolio-project-375106.cyclistic.2022_01_tripdata`
UNION ALL
SELECT *
FROM `portfolio-project-375106.cyclistic.2022_02_tripdata`
UNION ALL
SELECT *
FROM `portfolio-project-375106.cyclistic.2022_03_tripdata`
UNION ALL
SELECT *
FROM `portfolio-project-375106.cyclistic.2022_04_tripdata`
UNION ALL
SELECT *
FROM `portfolio-project-375106.cyclistic.202205_01-divvy-tripdata`
UNION ALL
SELECT *
FROM `portfolio-project-375106.cyclistic.202205_02-divvy-tripdata`
UNION ALL
SELECT *
FROM `portfolio-project-375106.cyclistic.202206_01-divvy-tripdata`
UNION ALL
SELECT *
FROM `portfolio-project-375106.cyclistic.202206_02-divvy-tripdata`
UNION ALL
SELECT *
FROM `portfolio-project-375106.cyclistic.202207_01-divvy-tripdata`
UNION ALL
SELECT *
FROM `portfolio-project-375106.cyclistic.202207_02-divvy-tripdata`
UNION ALL
SELECT *
FROM `portfolio-project-375106.cyclistic.202208_01-divvy-tripdata`
UNION ALL
SELECT *
FROM `portfolio-project-375106.cyclistic.202208_02-divvy-tripdata`
UNION ALL
SELECT *
FROM `portfolio-project-375106.cyclistic.202209_01-divvy-tripdata`
UNION ALL
SELECT *
FROM `portfolio-project-375106.cyclistic.202209_02-divvy-tripdata`
UNION ALL
SELECT *
FROM `portfolio-project-375106.cyclistic.202210_01-divvy-tripdata`
UNION ALL
SELECT *
FROM `portfolio-project-375106.cyclistic.202210_02-divvy-tripdata`
UNION ALL
SELECT *
FROM `portfolio-project-375106.cyclistic.2021_11_tripdata`
UNION ALL
SELECT *
FROM `portfolio-project-375106.cyclistic.2021_12_tripdata`
),

mytimestamp AS (
 SELECT ride_id, started_at, EXTRACT(TIME FROM started_at) - EXTRACT(TIME FROM ended_at) AS ridelength
FROM tripdata
)

SELECT EXTRACT(QUARTER FROM started_at) AS quarter, SUM(ridelength) as ridelengthsum
FROM mytimestamp
GROUP BY 1
ORDER BY 2

-- total rows
SELECT *
FROM tripdata

-- total ride
SELECT COUNT(ride_id) AS TotalRide
FROM tripdata

-- no of monthly ride
SELECT CASE WHEN EXTRACT(MONTH FROM started_at) = 1 THEN 'January'
            WHEN EXTRACT(MONTH FROM started_at) = 2 THEN 'February'
            WHEN EXTRACT(MONTH FROM started_at) = 3 THEN 'March'
            WHEN EXTRACT(MONTH FROM started_at) = 4 THEN 'April'
            WHEN EXTRACT(MONTH FROM started_at) = 5 THEN 'May'
            WHEN EXTRACT(MONTH FROM started_at) = 6 THEN 'June'
            WHEN EXTRACT(MONTH FROM started_at) = 7 THEN 'July'
            WHEN EXTRACT(MONTH FROM started_at) = 8 THEN 'August'
            WHEN EXTRACT(MONTH FROM started_at) = 9 THEN 'September'
            WHEN EXTRACT(MONTH FROM started_at) = 10 THEN 'October'
            WHEN EXTRACT(MONTH FROM started_at) = 11 THEN 'November'
            WHEN EXTRACT(MONTH FROM started_at) = 12 THEN 'December' END AS Month, 
            COUNT(ride_id) AS no_of_rides
FROM tripdata
GROUP BY 1
ORDER BY 1 DESC

-- ride by user type
SELECT member_casual, COUNT(ride_id) AS ride_by_user_type
FROM tripdata
GROUP BY 1

-- rideable type
SELECT rideable_type, COUNT(ride_id) AS rideablecount
FROM tripdata
GROUP BY 1

-- total ride x month x user
SELECT member_casual, 
CASE WHEN EXTRACT(MONTH FROM started_at) = 1 THEN 'January'
            WHEN EXTRACT(MONTH FROM started_at) = 2 THEN 'February'
            WHEN EXTRACT(MONTH FROM started_at) = 3 THEN 'March'
            WHEN EXTRACT(MONTH FROM started_at) = 4 THEN 'April'
            WHEN EXTRACT(MONTH FROM started_at) = 5 THEN 'May'
            WHEN EXTRACT(MONTH FROM started_at) = 6 THEN 'June'
            WHEN EXTRACT(MONTH FROM started_at) = 7 THEN 'July'
            WHEN EXTRACT(MONTH FROM started_at) = 8 THEN 'August'
            WHEN EXTRACT(MONTH FROM started_at) = 9 THEN 'September'
            WHEN EXTRACT(MONTH FROM started_at) = 10 THEN 'October'
            WHEN EXTRACT(MONTH FROM started_at) = 11 THEN 'November'
            WHEN EXTRACT(MONTH FROM started_at) = 12 THEN 'December' END AS Month, 
            COUNT(ride_id) AS no_of_rides
FROM tripdata
GROUP BY 1, 2

-- dayofweek count
SELECT member_casual, 
      CASE WHEN EXTRACT(DAYOFWEEK FROM started_at) = 1 THEN 'Sunday'
         WHEN EXTRACT(DAYOFWEEK FROM started_at) = 2 THEN 'Monday'
         WHEN EXTRACT(DAYOFWEEK FROM started_at) = 3 THEN 'Tuesday'
         WHEN EXTRACT(DAYOFWEEK FROM started_at) = 4 THEN 'Wednesday'
         WHEN EXTRACT(DAYOFWEEK FROM started_at) = 5 THEN 'Thursday'
         WHEN EXTRACT(DAYOFWEEK FROM started_at) = 6 THEN 'Friday'
         WHEN EXTRACT(DAYOFWEEK FROM started_at) = 7 THEN 'Saturday' END AS day_of_week,
         COUNT(ride_id) AS daycount
FROM tripdata
GROUP BY 1, 2

-- quarter count
SELECT member_casual, 
      CASE WHEN EXTRACT(QUARTER FROM started_at) = 1 THEN '1st Quarter'
      WHEN EXTRACT(QUARTER FROM started_at) = 2 THEN '2nd Quarter'
      WHEN EXTRACT(QUARTER FROM started_at) = 3 THEN '3rd Quarter'
      WHEN EXTRACT(QUARTER FROM started_at) = 4 THEN '4th Quarter' END AS quarter,
      COUNT(ride_id) AS quartercount
FROM tripdata
GROUP BY 1, 2

SELECT member_casual, count(ride_id) as total_ride
FROM tripdata
GROUP BY 1

SELECT member_casual, rideable_type, count(ride_id) as total_ride
FROM tripdata
GROUP BY 1, 2

SELECT CASE WHEN EXTRACT(MONTH FROM started_at) = 1 THEN 'January'
            WHEN EXTRACT(MONTH FROM started_at) = 2 THEN 'February'
            WHEN EXTRACT(MONTH FROM started_at) = 3 THEN 'March'
            WHEN EXTRACT(MONTH FROM started_at) = 4 THEN 'April'
            WHEN EXTRACT(MONTH FROM started_at) = 5 THEN 'May'
            WHEN EXTRACT(MONTH FROM started_at) = 6 THEN 'June'
            WHEN EXTRACT(MONTH FROM started_at) = 7 THEN 'July'
            WHEN EXTRACT(MONTH FROM started_at) = 8 THEN 'August'
            WHEN EXTRACT(MONTH FROM started_at) = 9 THEN 'September'
            WHEN EXTRACT(MONTH FROM started_at) = 10 THEN 'October'
            WHEN EXTRACT(MONTH FROM started_at) = 11 THEN 'November'
            WHEN EXTRACT(MONTH FROM started_at) = 12 THEN 'December' END AS Month,
            SUM(ridelength) AS ridelength
FROM mytimestamp
GROUP BY 1
ORDER BY 2 DESC

SELECT  CASE WHEN EXTRACT(DAYOFWEEK FROM started_at) = 1 THEN 'Sunday'
         WHEN EXTRACT(DAYOFWEEK FROM started_at) = 2 THEN 'Monday'
         WHEN EXTRACT(DAYOFWEEK FROM started_at) = 3 THEN 'Tuesday'
         WHEN EXTRACT(DAYOFWEEK FROM started_at) = 4 THEN 'Wednesday'
         WHEN EXTRACT(DAYOFWEEK FROM started_at) = 5 THEN 'Thursday'
         WHEN EXTRACT(DAYOFWEEK FROM started_at) = 6 THEN 'Friday'
         WHEN EXTRACT(DAYOFWEEK FROM started_at) = 7 THEN 'Saturday' END AS day_of_week,
      SUM(ridelength) AS ridelength
FROM mytimestamp
GROUP BY 1

SELECT  member_casual,
      AVG(ridelength) AS avgridelength
FROM mytimestamp
GROUP BY 1

SELECT  member_casual,
  CASE WHEN EXTRACT(QUARTER FROM started_at) = 1 THEN '1st Quarter'
      WHEN EXTRACT(QUARTER FROM started_at) = 2 THEN '2nd Quarter'
      WHEN EXTRACT(QUARTER FROM started_at) = 3 THEN '3rd Quarter'
      WHEN EXTRACT(QUARTER FROM started_at) = 4 THEN '4th Quarter' END AS quarter,
      SUM(ridelength) AS totalridelength
FROM mytimestamp
GROUP BY 1, 2

SELECT CASE WHEN EXTRACT(QUARTER FROM started_at) = 1 THEN '1st Quarter'
      WHEN EXTRACT(QUARTER FROM started_at) = 2 THEN '2nd Quarter'
      WHEN EXTRACT(QUARTER FROM started_at) = 3 THEN '3rd Quarter'
      WHEN EXTRACT(QUARTER FROM started_at) = 4 THEN '4th Quarter' END AS quarter,
      SUM(ridelength) AS totalridelength
FROM mytimestamp
GROUP BY 1
