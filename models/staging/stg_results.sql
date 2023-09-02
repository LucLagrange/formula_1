{{ config(
    cluster_by = "id_result",
) }}

SELECT
    cast(resultid AS STRING) AS id_result
    , cast(raceid AS STRING) AS id_race
    , cast(driverid AS STRING) AS id_driver
    , cast(constructorid AS STRING) AS id_constructor
    , number AS car_number
    , grid AS start_position
    , position AS end_position
    , positionorder AS final_rank
    , points AS points_gained
    , laps AS laps_driven
    , CASE WHEN fastestlap LIKE '%N' THEN NULL ELSE fastestlap END AS fastest_lap
    , CASE WHEN rank LIKE '%N' THEN NULL ELSE rank END AS fastest_lap_rank
    , CASE WHEN fastestlapspeed LIKE '%N' THEN NULL ELSE fastestlapspeed END AS fastest_lap_speed
    , CASE WHEN milliseconds LIKE '%N' THEN NULL ELSE milliseconds END AS total_milliseconds_elapsed
    , cast(statusid AS STRING) AS id_status
FROM {{ source('Source_files','results') }}
