with 

source as (

    select * from {{ source('ADA', 'reviews') }}

),

renamed as (

    select
        listing_id,
        id,
        date,
        reviewer_id,
        reviewer_name,
        comments

    from source

)

select * from renamed
