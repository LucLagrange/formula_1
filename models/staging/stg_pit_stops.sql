{{ config(
    cluster_by = "id_race",
) }}

SELECT
    stop AS pit_stop_number
    , SAFE_CAST(lap AS INT) AS lap_of_pit_stop
    , time AS time_at_pit_stop
    , duration AS pit_stop_duration
    , milliseconds AS pit_stop_duration_milliseconds
    , CAST(raceid AS STRING) AS id_race
    , CAST(driverid AS STRING) AS id_driver
FROM {{ source('Source_files','pit_stops') }}
