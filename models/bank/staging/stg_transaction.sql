{{ config(materialized='view') }}

select
    transaction_id,
    account_id,
    transaction_date,
    transaction_type,
    transaction_mode,
    amount,
    merchant_name,
    transaction_status,
    last_updated_date
from {{ source('raw_bank', 'TRANSACTION_MASTER') }}