{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

SELECT
    c.first_name  AS customer_first_name,
    c.last_name   AS customer_last_name,
    d.date_day,
    p.product_id,
    e.first_name  AS employee_first_name,
    e.last_name   AS employee_last_name,
    st.store_name
FROM {{ ref('fact_sales') }} f
LEFT JOIN {{ ref('oliver_dim_customer') }}  c  ON f.customer_key = c.customer_key
LEFT JOIN {{ ref('oliver_dim_employee') }}  e  ON f.employee_key = e.employee_key
LEFT JOIN {{ ref('oliver_dim_product') }}   p  ON f.product_key  = p.product_key
LEFT JOIN {{ ref('oliver_dim_store') }}     st ON f.store_key    = st.store_key
LEFT JOIN {{ ref('oliver_dim_date') }}      d  ON f.date_key     = d.date_key
