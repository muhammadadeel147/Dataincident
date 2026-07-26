-- Placeholder staging select. Stage 4 will patch this / add tests.
-- Mirrors the nyc_taxi_pipeline lineage: raw_trips → staging_trips → mart_daily_summary

select
    *
from {{ source('nyc_taxi_pipeline', 'raw_trips') }}
where 1 = 1
