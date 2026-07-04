{{ config(materialized='view') }}

select
    loan_id,
    customer_id,
    loan_type,
    loan_amount,
    interest_rate,
    emi_amount,
    loan_status,
    start_date,
    end_date,
    last_updated_date
from {{ source('raw_bank', 'LOAN_MASTER') }}