select 
    CAST(product_id as string) product_id,
    product_name,
    CAST(brand_id as string) brand_id,
    CAST(category_id as string) category_id,
    model_year,
    list_price
from {{ source('local_bike', 'products') }}