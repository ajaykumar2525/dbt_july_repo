{{ config(
    materialized='incremental',
    unique_key='transaction_id'
) }}

select
    transaction_id,
    account_id,
    customer_id,
    account_number,
    account_type,
    transaction_date,
    transaction_type,
    transaction_mode,
    amount,
    transaction_status
from {{ ref('int_transaction_details') }}

{% if is_incremental() %}

where transaction_date >
(
    select coalesce(max(transaction_date), '1900-01-01')
    from {{ this }}
)

{% endif %}