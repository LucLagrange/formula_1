{{ config(
    materialized='table',
    cluster_by = "id_race",
) }}

SELECT
    stop AS pit_stop_number
    , lap AS lap_of_pit_stop
    , time AS time_at_pit_stop
    , duration AS pit_stop_duration
    , milliseconds AS pit_stop_duration_milliseconds
    , CAST(raceid AS STRING) AS id_race
    , CAST(driverid AS STRING) AS id_driver
FROM
    `formula-1-391319.Formula1.pit_stops`
