{{ config(
    materialized='table',
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
    , alt AS altitude
FROM `formula-1-391319.Formula1.circuits`
