{{ config(
    cluster_by = "id_driver_standing",
) }}

SELECT
CAST(driverStandingsId AS STRING) AS id_driver_standing
, CAST(raceid AS STRING) AS id_race
, CAST(driverid AS STRING) AS id_driver
, SAFE_CAST(points AS INT) AS points_gained
, SAFE_CAST(position AS INT) AS end_position
, SAFE_CAST(wins AS INT) AS wins_number
FROM {{ source('Source_files','driver_standings') }}