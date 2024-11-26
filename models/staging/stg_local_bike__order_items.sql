select CAST(order_id as string) order_id,
    CONCAT(order_id,'-',item_id) order_item_id,
    CAST(item_id as string) item_id,
    CAST(product_id as string) product_id,
    quantity AS item_quantity,
    list_price as item_price,
    discount,
    quantity * (list_price*(1-discount)) as total_order_item_amount
from {{ source('local_bike', 'order_items') }}