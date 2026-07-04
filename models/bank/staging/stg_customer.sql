{{
    config(materialized = 'view')
}}

SELECT 
    customer_id,
    TRIM(first_name) as first_name,
    TRIM(last_name) as last_name,
    lower(email) as email_address,
    GENDER,
    city,
    state,
    country,
    customer_status,
    created_date,
    last_updated_date
FROM {{source("raw_bank","CUSTOMER_MASTER")}}