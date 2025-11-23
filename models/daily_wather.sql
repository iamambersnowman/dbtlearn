WITH daily_weather AS(

SELECT 
date(time) AS daily_weather,
weather,
TEMP,
PRESSURE,
HUMIDITY,
CLOUDS
FROM {{ source('demo', 'weather') }}

),
daily_weather_agg AS(
SELECT daily_weather,
weather,
ROUND(AVG(TEMP),2)AS AVG_TEMP,
ROUND(AVG(PRESSURE),2) AS AVG_PRESSURE,
ROUND(AVG(HUMIDITY),2) AS AVG_HUMIDITY,
ROUND(AVG(CLOUDS),2) AS AVG_COUDS
FROM daily_weather
GROUP BY daily_weather, weather    
QUALIFY ROW_NUMBER() OVER(PARTITION BY daily_weather ORDER BY COUNT(weather) DESC ) = 1
)
SELECT * FROM daily_weather_agg
