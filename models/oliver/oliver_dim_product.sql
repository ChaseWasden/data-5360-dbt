{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
product_id as product_key,
product_id,
description,
product_name,
unit_price
FROM {{ source('oliver_landing', 'product') }}