{% raw %}

{{ config(
    database='GROUP5_ECOESSENTIALS',
    materialized='table',
    schema='dw_eco_essentials'
) }}

SELECT
    campaign_id AS campaign_key,
    campaign_id,
    campaign_name,
    campaign_discount
FROM
    {{ source('transaction_db', 'promotional_campaign') }}
{% endraw %}
