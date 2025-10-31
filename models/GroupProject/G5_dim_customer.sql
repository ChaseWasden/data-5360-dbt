{{ config(
    database='GROUP5_ECOESSENTIALS',
    materialized = 'table',
    schema = 'dw_eco_essentials'
    )
}}


SELECT
customer_id as customer_key,
customer_id,
customer_first_name,
customer_last_name,
customer_phone,
customer_address,
customer_city,
customer_state,
customer_zip
FROM {{ source('transaction_db', 'customer') }}