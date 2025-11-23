WITH CTE AS (
    SELECT
        TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
        DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
        HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
        MONTH(TO_TIMESTAMP(STARTED_AT)) AS MONTH_STARTED_AT,
        DAYNAME(TO_TIMESTAMP(STARTED_AT)) AS DAY_NAME,
        
        CASE 
            WHEN DAYNAME(TO_TIMESTAMP(STARTED_AT)) IN ('Sat', 'Sun') THEN 'Weekend'
            ELSE 'Business day'
        END AS Day_type,
        
        {{ get_season('MONTH(TO_TIMESTAMP(STARTED_AT))') }} AS Season_of_the_year

    FROM {{ source('demo', 'bike') }}
)
SELECT * FROM CTE