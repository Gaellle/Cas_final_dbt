SELECT customer_id
      ,c.city as customer_city
      ,c.state as customer_state
      ,total_orders
      ,pending_orders
      ,first_order_date
      ,last_order_date
      ,favorite_store_id
      ,s.city as favorite_store_city
      ,s.state as favorite_store_state
      ,distinct_products_ordered
      ,total_item_quantity
      ,total_order_amount
      ,average_discount
   

FROM {{ref("int_local_bike__customers")}} c
LEFT JOIN {{ref("stg_local_bike__stores")}} s on c.favorite_store_id = s.store_id