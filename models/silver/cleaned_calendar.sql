{{ config(materialized='table') }}

select
    CAST(listing_id as integer) as listing_id,
    CAST(date as date) as calendar_date,
    available,
    TO_DECIMAL(REPLACE(REPLACE(price, '$', ''), ',', ''), 10, 2) as price,
    CAST(minimum_nights as integer) as minimum_nights,
    CAST(maximum_nights as integer) as maximum_nights
from {{ ref('calendar') }}
where price is not null