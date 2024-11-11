{{ config(materialized='table') }}

select 
    CAST(listing_id as integer) as listing_id,
    CAST(id as integer) as id,
    CAST(date as date) as review_date,
    CAST(reviewer_id as integer) as reviewer_id,
    REPLACE(comments, '<br/>', '') as comments
from {{ ref('reviews') }}
where reviewer_id is not null
and listing_id is not null
and date is not null
and (comments is not null and len(comments) > 1)