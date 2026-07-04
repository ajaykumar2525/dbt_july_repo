{{ config(materialized='table') }}

with orders_cte as (
    SELECT 
        ORDER_ID,
        CUSTOMER_NAME,
        PRODUCT_NAME,
        CATEGORY,
        QUANTITY,
        PRICE,
        ORDER_DATE,
        CITY,
        STATUS
    FROM {{ source('raw_schema','ORDERS')}}
)

select * from orders_cte