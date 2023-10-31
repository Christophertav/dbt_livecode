with 

source as (

    select * from {{ source('data_circle', 'cc_parcel_product') }}

),

renamed as (

    select
        parcel_id,
        model_mame as model_name,
        quantity

    from source

)

select * from renamed
