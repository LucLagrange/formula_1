{{ config(
    materialized='table',
    cluster_by = "id_result",
) }}

SELECT
    number AS driver_number
    , grid AS start_position
    , position AS end_position
    , positionorder AS final_rank
    , points AS points_gained
    , laps AS laps_driven
    , fastestlap AS fastest_lap
    , fastestlaptime AS fastest_lap_time
    , milliseconds AS total_milliseconds_elapsed
    , CAST(resultid AS STRING) AS id_result
    , CAST(raceid AS STRING) AS id_race
    , CAST(driverid AS STRING) AS id_driver
    , CAST(constructorid AS STRING) AS id_constructor
    , CAST(statusid AS STRING) AS id_status
FROM
    `formula-1-391319.Formula1.sprint_results`
