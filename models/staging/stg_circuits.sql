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
    , CASE WHEN alt LIKE '%N' THEN NULL ELSE alt END AS altitude
FROM {{ source('Formula1','circuits') }}
