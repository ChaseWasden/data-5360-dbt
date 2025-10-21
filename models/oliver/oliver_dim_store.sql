{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
store_id as store_key,
store_id,
city,
state,
store_name,
street
FROM {{ source('oliver_landing', 'store') }}