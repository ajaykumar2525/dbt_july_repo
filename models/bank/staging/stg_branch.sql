{{ config(materialized='view') }}

select
    branch_id,
    branch_name,
    branch_city,
    branch_state,
    region,
    ifsc_code
from {{ source('raw_bank', 'BRANCH_MASTER') }}