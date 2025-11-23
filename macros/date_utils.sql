{% macro get_season(month_expr) %}
    CASE 
        WHEN {{ month_expr }} IN (12, 1, 2) THEN 'Winter'
        WHEN {{ month_expr }} IN (3, 4, 5) THEN 'Spring'
        WHEN {{ month_expr }} IN (6, 7, 8) THEN 'Summer'
        ELSE 'Autumn'
    END
{% endmacro %}