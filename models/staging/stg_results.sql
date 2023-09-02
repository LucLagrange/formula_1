{{ config(
    cluster_by = "id_result",
) }}

SELECT
    cast(resultid AS STRING) AS id_result
    , cast(raceid AS STRING) AS id_race
    , cast(driverid AS STRING) AS id_driver
    , cast(constructorid AS STRING) AS id_constructor
    , cast(statusid AS STRING) AS id_status
    , number AS car_number
    , SAFE_CAST(grid AS INTEGER) AS start_position
    , SAFE_CAST(position AS INT) AS end_position
    , SAFE_CAST(positionorder AS INT) AS final_rank
    , SAFE_CAST(points AS INT) AS points_gained
    , SAFE_CAST(laps AS INT) AS laps_driven
    , CASE WHEN fastestlap LIKE '%N' THEN NULL ELSE fastestlap END AS fastest_lap
    , CASE WHEN rank LIKE '%N' THEN NULL ELSE rank END AS fastest_lap_rank
    , CASE WHEN fastestlapspeed LIKE '%N' THEN NULL ELSE fastestlapspeed END AS fastest_lap_speed
    , CASE WHEN milliseconds LIKE '%N' THEN NULL ELSE milliseconds END AS total_milliseconds_elapsed
FROM {{ source('Source_files','results') }}
