{{ config(
    materialized='table',
    cluster_by = "id_race",
) }}

SELECT
  CAST(raceid AS STRING) AS id_race
  , CAST(driverid AS STRING) AS id_driver
  , lap 
  , position AS current_position 
  , time AS lap_time
  , milliseconds AS lap_time_milliseconds
FROM
  `formula-1-391319.Formula1.lap_times`
