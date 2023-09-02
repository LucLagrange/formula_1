{{ config(
    cluster_by = "id_driver",
) }}

SELECT
    cast(driverid AS string) AS id_driver
    , driverref AS driver_reference
    , CASE WHEN number LIKE '%N' THEN NULL ELSE number END AS car_number
    , forename AS first_name
    , surname AS last_name
    , nationality
    , cast(dob AS date) AS birth_date
FROM {{ source('Source_files','drivers') }}
