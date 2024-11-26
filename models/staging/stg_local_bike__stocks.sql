select 
    CAST(store_id as string) store_id,
    CAST(product_id as string) product_id,
    CONCAT(store_id,'-',product_id) stock_id,
    quantity AS stock_quantity
from {{ source('local_bike', 'stocks') }}