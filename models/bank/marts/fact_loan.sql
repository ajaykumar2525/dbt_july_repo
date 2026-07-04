{{ config(materialized='table') }}

select
    loan_id,
    customer_id,
    loan_type,
    loan_amount,
    interest_rate,
    emi_amount,
    loan_status,
    start_date,
    end_date
from {{ ref('stg_loan') }}