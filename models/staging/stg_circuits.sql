{{ config(
    cluster_by = "id_circuit",
) }}

SELECT
    cast(circuitid AS string) AS id_circuit
    , circuitref AS circuit_reference
    , name AS circuit_name
    , location AS circuit_location
    , country AS circuit_country
    , lat AS lattitude
    , lng AS longitude
    , SAFE_CAST(alt AS INT) AS altitude
FROM {{ source('Source_files','circuits') }}
