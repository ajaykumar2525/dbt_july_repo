{{config(materialized = 'table')}}
select
    branch_name,
    count(distinct customer_id) as total_customers,
    count(distinct account_id) as total_accounts,
    sum(current_balance) as total_balance
from {{ ref('int_customer_account') }}
group by branch_name