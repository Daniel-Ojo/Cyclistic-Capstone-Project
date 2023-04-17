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
)

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

-- no of rides per month
