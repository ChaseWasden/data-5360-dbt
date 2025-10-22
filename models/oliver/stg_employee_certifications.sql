{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

select
    employee_id,
    PARSE_JSON(certification_json):certification_name::string            as certification_name,
    PARSE_JSON(certification_json):certification_cost::number(10,2)      as certification_cost,
    to_date(PARSE_JSON(certification_json):certification_awarded_date::string) as certification_awarded_date
from {{ source('oliver_landing', 'employee_certifications') }}
