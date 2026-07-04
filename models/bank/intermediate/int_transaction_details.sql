{{ config(materialized='view') }}

select
    t.transaction_id,
    t.transaction_date,
    t.transaction_type,
    t.transaction_mode,
    t.amount,
    t.transaction_status,

    a.account_number,
    a.account_type,
    a.customer_id,
    a.account_id

from {{ ref('stg_transaction') }} t
join {{ ref('stg_account') }} a
    on t.account_id = a.account_id