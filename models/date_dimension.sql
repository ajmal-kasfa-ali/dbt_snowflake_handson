WITH CTE AS (
select
TO_TIMESTAMP(REPLACE(STARTED_AT, '"', '')) AS STARTED_AT
,
DATE(TO_TIMESTAMP(REPLACE(STARTED_AT, '"', ''))) AS DATE_STARTED_AT,
HOUR(TO_TIMESTAMP(REPLACE(STARTED_AT, '"', ''))) AS HOUR_STARTED_AT,

{{ get_daytype('STARTED_AT')}} as DAY_TYPE,
{{ get_season(STARTED_AT)}} as STATION_OF_YEAR

from
{{ source('demo', 'bike') }}
where STARTED_AT != 'started_at' and STARTED_AT != '"started_at"'
)
select 
*
from CTE