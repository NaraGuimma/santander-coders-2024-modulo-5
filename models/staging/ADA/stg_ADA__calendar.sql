with 

source as (

    select * from {{ source('ADA', 'calendar') }}

),

renamed as (

    select
        listing_id,
        date,
        available,
        price,
        adjusted_price,
        minimum_nights,
        maximum_nights

    from source

)

select * from renamed
