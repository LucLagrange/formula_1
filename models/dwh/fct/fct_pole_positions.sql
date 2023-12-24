WITH pole_position AS(
    SELECT
        id_race
        , id_driver
        , id_constructor
    FROM    
        {{ref('stg_qualifyings')}}
    WHERE
        final_position = 1
)

SELECT * FROM pole_position