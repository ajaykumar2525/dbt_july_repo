{{config(materialized = 'table')}}
select
    date_trunc('month', transaction_date) as month,
    transaction_type,
    count(*) as total_transactions,
    sum(amount) as total_amount
from {{ ref('fact_transaction') }}
group by
    date_trunc('month', transaction_date),
    transaction_type