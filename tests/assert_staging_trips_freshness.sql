-- Singular dbt test: fail when staging lags raw by more than 1 day.
-- Addresses planted incident: raw_trips stays current while staging_trips stalls.

with raw_bounds as (
    select max(date(tpep_pickup_datetime)) as max_raw_date
    from {{ source('nyc_taxi_pipeline', 'raw_trips') }}
),
staging_bounds as (
    select max(trip_date) as max_staging_date
    from {{ ref('staging_trips') }}
)
select
    raw_bounds.max_raw_date,
    staging_bounds.max_staging_date,
    cast(julianday(raw_bounds.max_raw_date) - julianday(staging_bounds.max_staging_date) as integer) as lag_days
from raw_bounds
cross join staging_bounds
where julianday(raw_bounds.max_raw_date) - julianday(staging_bounds.max_staging_date) > 1
