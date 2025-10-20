{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

SELECT
    cu.customer_key,
    e.employee_key,
    p.product_key,
    d.date_key,
    s.store_key
FROM {{ source('oliver_landing', 'orderline') }} c
INNER JOIN {{ source('oliver_landing', 'orders') }} o
        ON o.order_id = c.order_id
INNER JOIN {{ ref('oliver_dim_customer') }}  cu ON cu.customer_id  = o.customer_id
INNER JOIN {{ ref('oliver_dim_employee') }}  e  ON e.employee_id   = o.employee_id
INNER JOIN {{ ref('oliver_dim_store') }}     s  ON s.store_id      = o.store_id
INNER JOIN {{ ref('oliver_dim_product') }}   p  ON p.product_id    = c.product_id
INNER JOIN {{ ref('oliver_dim_date') }}      d  ON d.date_day      = TRY_TO_DATE(o.order_date)
