{{ config(materialized='view') }}

select
    account_id,
    customer_id,
    account_number,
    account_type,
    branch_id,
    open_date,
    account_status,
    current_balance,
    last_updated_date
from {{ source('raw_bank', 'ACCOUNT_MASTER') }}