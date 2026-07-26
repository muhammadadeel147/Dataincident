# NYC Taxi Pipeline — dbt demo seed

Minimal dbt project used as the GitHub target for **Data Incident Commander**.

Pipeline mirrored from the DataHub sample:

`raw_trips` → `staging_trips` → `mart_daily_summary`

Incident PRs should add narrow freshness / quality guards, not rewrite the whole project.
