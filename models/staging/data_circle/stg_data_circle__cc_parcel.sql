with 

source as (

    select * from {{ source('data_circle', 'cc_parcel') }}

),

renamed as (

    select
        parcel_id,
        parcel_tracking,
        transporter,
        priority,
        PARSE_DATE("%B %d, %Y",date_purchase) as date_purchase,
        PARSE_DATE("%B %d, %Y",date_shipping) as date_shipping,
        PARSE_DATE("%B %d, %Y",date_delivery) as date_delivery,
        PARSE_DATE("%B %d, %Y",datecancelled) as date_cancelled

    from source

)

select * from renamed
