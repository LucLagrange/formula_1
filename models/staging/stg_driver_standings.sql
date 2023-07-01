{{ config(
    materialized='table',
    cluster_by = "id_driver_standing",
) }}

SELECT
CAST(driverStandingsId AS STRING) AS id_driver_standing
, CAST(raceid AS STRING) AS id_race
, CAST(driverid AS STRING) AS id_driver
, points AS points_gained
, position AS end_position
, wins AS wins_number
FROM
`formula-1-391319.Formula1.driver_standings`