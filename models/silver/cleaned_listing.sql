{{ config(materialized='table') }}

select
    CAST(id AS integer) AS id,
    CAST(host_id AS integer) as host_id,
    current_date - host_since::date as days_as_host,
    lower(property_type) as property_type,
    TO_DECIMAL(review_scores_rating, 5, 2) as review_scores_rating,
    TO_DECIMAL(REPLACE(REPLACE(price, '$', ''), ',', ''), 10, 2) as price,
    neighbourhood_cleansed as neighbourhood,
    bedrooms,
    beds,
    bathrooms,
    amenities
from {{ ref('listing') }}
where price is not null
and review_scores_rating is not null
and host_id is not null
