{% raw %}

{{ config(
	database='GROUP5_ECOESSENTIALS',
    materialized='table',
    schema='dw_eco_essentials'
) }}

SELECT DISTINCT
    emailid AS email_key,
    emailid AS email_id,
    emailname AS email_name,
    sendtimestamp AS send_time_stamp
FROM
    {{ source('email_events', 'ecoessential_email_events') }}
{% endraw %}
