select CAST(order_id as string) order_id, 
  CAST(customer_id as string) customer_id,
  CAST(order_status as string) order_status,
  order_date,
  required_date,
  CASE WHEN shipped_date = 'NULL' THEN null ELSE shipped_date END AS shipped_date,
  CAST(store_id as string) store_id, 
  CAST(staff_id as string) staff_id, 
from {{ source('local_bike', 'orders') }}