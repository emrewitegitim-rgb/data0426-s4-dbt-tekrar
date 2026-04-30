SELECT
    p.*
    , EXTRACT(MONTH FROM date_purchase) as month_purchase
    , CASE
        WHEN date_cancelled is not null THEN 'Cancelled'
        WHEN date_delivery is not null THEN 'Delivered'
        WHEN date_shipping is not null THEN 'Shipped'
        ELSE 'In porgress'
    END as status
FROM {{ ref("stg_raw__parcel")}} as p