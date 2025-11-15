
{{ config(
    database='GROUP5_ECOESSENTIALS',
    materialized = 'table',
    schema = 'dw_eco_essentials'
) }}

SELECT
    CAST(TO_VARCHAR(DATE(o.ORDER_TIMESTAMP), 'YYYYMMDD') AS INTEGER) AS date_key,
    
    cust.customer_key,
    camp.campaign_key,
    prod.product_key,
    
    ol.quantity,
    ol.price_after_discount AS sale_amount,
    ol.price_after_discount / ol.quantity AS unit_price_after_discount,
    ol.discount

FROM {{ source('transaction_db', 'order_line') }} ol
INNER JOIN {{ source('transaction_db', 'orders') }} o 
    ON ol.ORDER_ID = o.ORDER_ID

INNER JOIN {{ ref('G5_dim_customer') }} cust 
    ON o.CUSTOMER_ID = cust.customer_ID
    
INNER JOIN {{ ref('G5_dim_campaign') }} camp 
    ON ol.CAMPAIGN_ID = camp.campaign_id

INNER JOIN {{ ref('G5_dim_product') }} prod 
    ON ol.PRODUCT_ID = prod.product_id

INNER JOIN {{ ref('G5_dim_date') }} d 
    ON d.date_day = DATE(o.ORDER_TIMESTAMP)