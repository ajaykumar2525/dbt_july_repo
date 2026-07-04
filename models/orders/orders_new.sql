{{ config(materialized='table') }}

with orders_cte as (
    SELECT 
        CUSTOMER_NAME,
        PRODUCT_NAME,
        CATEGORY,
        QUANTITY,
        PRICE,
        ORDER_DATE,
        CITY,
        STATUS
    FROM {{source('raw_schema','ORDERS_NEW')}}
)

select * from orders_cte