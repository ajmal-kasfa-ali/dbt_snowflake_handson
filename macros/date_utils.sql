{%macro get_season(STARTED_AT)%}
CASE WHEN MONTH(TO_TIMESTAMP(REPLACE(STARTED_AT, '"', ''))) in (12,1,2)
    THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP(REPLACE(STARTED_AT, '"', ''))) in (3,4,5)
    THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP(REPLACE(STARTED_AT, '"', ''))) in (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTUMN' 
    END 
{%endmacro%}

{%macro get_daytype(STARTED_AT)%}
CASE 
WHEN DAYNAME(TO_TIMESTAMP(REPLACE(STARTED_AT, '"', ''))) in ('Sat','Sun')
THEN 'WEEKEND'
ELSE 'BUSINESSDAY'
END
{%endmacro%}