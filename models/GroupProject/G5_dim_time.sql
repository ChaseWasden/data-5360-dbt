{% raw %}
{{ config(
    database='GROUP5_ECOESSENTIALS',
    materialized='table',
    schema='dw_eco_essentials'
) }}

SELECT DISTINCT
    CAST(
        CONCAT(
            LPAD(EXTRACT(HOUR FROM eventtimestamp), 2, '0'),
            LPAD(EXTRACT(MINUTE FROM eventtimestamp), 2, '0'),
            LPAD(EXTRACT(SECOND FROM eventtimestamp), 2, '0')
        )
        AS INTEGER
    ) AS time_key,
    
    EXTRACT(HOUR FROM eventtimestamp) AS hour,
    EXTRACT(MINUTE FROM eventtimestamp) AS minute,
    EXTRACT(SECOND FROM eventtimestamp) AS second
FROM
    {{ source('email_events', 'ecoessential_email_events') }}
{% endraw %}