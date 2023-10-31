with idktable as(
    select
        parcel_id,
        sum(quantity) as quantity,
        count(distinct model_name) as model_count
    from {{ref("stg_data_circle__cc_parcel_product")}}
    group by parcel_id
)
select 
    *
    ,EXTRACT(MONTH FROM date_purchase) AS month_purchase
from {{ref("stg_data_circle__cc_parcel")}} as parcel
join idktable as idk using(parcel_id)
