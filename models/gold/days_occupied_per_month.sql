{{ config(materialized='view') }}


select distinct
    c.listing_id,
    l.neighbourhood,
    l.property_type,
    DATE_TRUNC('MONTH', c.calendar_date) as calendar_month,
    sum(c.price) as price,
    count(distinct c.calendar_date) as days_occupied
from {{ ref('cleaned_calendar') }} c 
join {{ref('cleaned_listing')}} l on l.id = c.listing_id
where c.available = 'f'
group by 1,2,3,4