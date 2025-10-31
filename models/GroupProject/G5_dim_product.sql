{{ config(
    database='GROUP5_ECOESSENTIALS',
    materialized = 'table',
    schema = 'dw_eco_essentials'
    )
}}




SELECT
    product_id AS product_key,
    product_id,
    product_type,
    product_name,
    price
FROM
    {{ source('transaction_db', 'product') }}
