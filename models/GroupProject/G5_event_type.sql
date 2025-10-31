{{ config(
    database='GROUP5_ECOESSENTIALS',
    materialized='table',
    schema='dw_eco_essentials'
) }}

SELECT DISTINCT
    emaileventid AS event_key,
    emaileventid AS email_event_id,
    eventtype AS event_type
FROM
    {{ source('email_events', 'ecoessential_email_events') }}
