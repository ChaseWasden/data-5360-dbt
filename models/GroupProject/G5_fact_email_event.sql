{{ config(
    database='GROUP5_ECOESSENTIALS',
    materialized = 'table',
    schema = 'dw_eco_essentials'
) }}

SELECT 
et.event_key,
s.subscriber_key,
cust.customer_key,
cam.campaign_key,
em.email_key,
d.date_key,
t.time_key


FROM {{ source('email_events', 'ecoessential_email_events') }} events


INNER JOIN {{ ref('G5_dim_event_type')}} et on et.email_event_id = events.emaileventid
INNER JOIN {{ ref("G5_dim_subscriber")}} s on s.subscriber_id = events.subscriberid
INNER JOIN {{ ref('G5_dim_customer')}} cust on cust.customer_first_name = events.subscriberfirstname and cust.customer_last_name = events.subscriberlastname
INNER JOIN {{ ref("G5_dim_campaign")}} cam on cam.campaign_id = events.campaignid
INNER JOIN {{ ref("G5_dim_email")}} em on em.email_id = events.emailid
INNER JOIN {{ ref('G5_dim_date') }} d ON d.date_day = DATE(events.eventtimestamp)
INNER JOIN {{ ref('G5_dim_time') }} t ON TO_TIME(LPAD(t.time_key::TEXT, 6, '0'), 'HH24MISS') = TO_TIME(events.eventtimestamp)