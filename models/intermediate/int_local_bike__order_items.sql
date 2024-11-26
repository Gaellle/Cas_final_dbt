SELECT order_item_id
      ,oi.order_id
      ,oi.item_id
      ,o.customer_id
      ,o.order_status
      ,o.order_date
      ,o.required_date
      ,o.shipped_date
      ,o.store_id
      ,o.staff_id
      ,oi.product_id
      ,oi.item_quantity
      ,oi.item_price
      ,oi.discount
      ,oi.total_order_item_amount
FROM {{ref("stg_local_bike__order_items")}} oi
LEFT JOIN {{ref("stg_local_bike__orders")}} o ON oi.order_id = o.order_id 