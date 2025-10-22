{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

with s as (
    select distinct
        employee_id,
        certification_name,
        certification_cost,
        certification_awarded_date
    from {{ ref('stg_employee_certifications') }}
)

select
    e.employee_key,
    d.date_key, 
    s.certification_name,
    s.certification_cost
from s
inner join {{ ref('oliver_dim_employee') }} e
    on e.employee_id = s.employee_id
inner join {{ ref('oliver_dim_date') }} d
    on d.date_key = s.certification_awarded_date