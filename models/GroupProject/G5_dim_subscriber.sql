
{{ config(
	database='GROUP5_ECOESSENTIALS',
    materialized='table',
    schema='dw_eco_essentials'
) }}

SELECT DISTINCT
    subscriberid AS subscriber_key,
    subscriberid AS subscriber_id,
    subscriberemail AS subscriber_email,
    subscriberfirstname AS subscriber_first_name,
    subscriberlastname AS subscriber_last_name
FROM
    {{ source('email_events', 'ecoessential_email_events') }}
