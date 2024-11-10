{{ config(materialized='view') }}

with host_filter as (
    select distinct
        l.host_id,
        l.neighbourhood,
        DATE_TRUNC('MONTH', c.calendar_date) as calendar_month,
        sum(c.price) as price
    from {{ref('cleaned_listing')}} l
    join {{ ref('cleaned_calendar') }} c  on l.id = c.listing_id
    where c.available = 't'
    group by 1,2,3
)
select distinct  
    calendar_month, 
    neighbourhood,
    round(sum(price)/count(host_id),2) as avg_revenue_per_host
from host_filter
group by 1,2