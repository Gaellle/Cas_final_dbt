select CAST(brand_id as string) brand_id,
    brand_name
from {{ source('local_bike', 'brands') }}