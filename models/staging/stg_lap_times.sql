{{ config(
    cluster_by = "id_race",
) }}

SELECT
  CAST(raceid AS STRING) AS id_race
  , CAST(driverid AS STRING) AS id_driver
  , lap 
  , position AS current_position 
  , time AS lap_time
  , milliseconds AS lap_time_milliseconds
FROM {{ source('Source_files','lap_times') }}
