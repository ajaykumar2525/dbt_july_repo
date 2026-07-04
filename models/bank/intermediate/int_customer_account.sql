{{
    config(materialized = 'view')
}}

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.gender,
    c.city,
    c.state,
    c.country,
    c.customer_status,

    a.account_id,
    a.account_number,
    a.account_type,
    a.current_balance,
    a.account_status,
    a.open_date,

    b.branch_name,
    b.branch_city,
    b.branch_state,
    b.region
    
FROM {{ref("stg_customer")}} as c 
JOIN {{ref("stg_account")}} as a
ON a.customer_id = c.customer_id
JOIN {{ref("stg_branch")}} as b
ON a.branch_id = b.branch_id