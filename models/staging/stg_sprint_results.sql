{{ config(
    cluster_by = "id_result",
) }}

SELECT
    number AS driver_number
    , grid AS start_position
    , position AS end_position
    , positionorder AS final_rank
    , points AS points_gained
    , laps AS laps_driven
    , CASE WHEN fastestlap LIKE '%N' THEN NULL ELSE fastestlap END AS fastest_lap
    , CASE WHEN fastestlaptime LIKE '%N' THEN NULL ELSE fastestlaptime END AS fastest_lap_time
    , CASE WHEN milliseconds LIKE '%N' THEN NULL ELSE milliseconds END AS total_milliseconds_elapsed
    , CAST(resultid AS STRING) AS id_result
    , CAST(raceid AS STRING) AS id_race
    , CAST(driverid AS STRING) AS id_driver
    , CAST(constructorid AS STRING) AS id_constructor
    , CAST(statusid AS STRING) AS id_status
FROM {{ source('Formula1','sprint_results') }}
