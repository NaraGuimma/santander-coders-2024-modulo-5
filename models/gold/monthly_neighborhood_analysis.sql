{{ config(materialized='view') }}

with monthly_price as (
    select distinct 
        l.neighbourhood,
        l.PROPERTY_TYPE,
        REVIEW_SCORES_RATING,
        DATE_TRUNC('MONTH', c.calendar_date) as calendar_month,
        sum(c.price) as price
    from {{ref('cleaned_listing')}} l
    join {{ ref('cleaned_calendar') }} c  on l.id = c.listing_id
    where c.available = 'f'
    group by 1,2,3,4
)
select distinct
    neighbourhood,
    PROPERTY_TYPE,
    calendar_month,
    round(avg(price), 2) as avg_price,
    round(avg(REVIEW_SCORES_RATING), 2) as avg_rating
from monthly_price
group by 1,2,3