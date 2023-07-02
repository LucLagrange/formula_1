SELECT
    id_driver
    , CONCAT(first_name, " ", last_name) AS driver_name
FROM
    {{ ref('stg_drivers')}}