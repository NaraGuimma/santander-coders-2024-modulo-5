{{ config(materialized='table') }}

select
    CAST(id AS integer) AS id,
    lower(property_type) as property_type,
    TO_DECIMAL(REPLACE(REPLACE(price, '$', ''), ',', ''), 10, 2) as price,
    neighbourhood_cleansed as neighbourhood,
    bedrooms,
    beds,
    bathrooms,
    amenities
from {{ ref('listing') }}
where price is not null
