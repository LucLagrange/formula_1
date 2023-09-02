SELECT
    re.id_result
    , re.id_race
    , re.id_driver
    , d.driver_name
    , ra.id_circuit
    , ra.season_year
    , ROW_NUMBER()
        OVER (PARTITION BY ra.id_circuit ORDER BY ra.season_year DESC)
        AS victory_order_circuit
FROM
    {{ref('stg_results')}} AS re
LEFT JOIN
    {{ ref('stg_races') }} AS ra
    ON
        re.id_race = ra.id_race
LEFT JOIN
    {{ ref('dim_drivers') }} AS d
    ON
        re.id_driver = d.id_driver
WHERE
    final_rank = '1'
