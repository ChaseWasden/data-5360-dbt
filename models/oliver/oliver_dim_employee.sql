{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
employee_id as employee_key,
employee_id,
first_name,
last_name,
email,
hire_date,
phone_number,
position
FROM {{ source('oliver_landing', 'employee') }}