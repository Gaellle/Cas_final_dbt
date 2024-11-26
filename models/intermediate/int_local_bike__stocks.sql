SELECT stock_id
      ,s.store_id
      ,store.store_name as store_name
      ,store.state as store_state
      ,p.category_id
      ,p.brand_id
      ,s.product_id
      ,p.product_name
      ,s.stock_quantity    
      ,p.list_price as product_price
      ,(s.stock_quantity * p.list_price) as product_stock_value 

FROM {{ref("stg_local_bike__stocks")}} s 
LEFT JOIN {{ref("stg_local_bike__stores")}} store ON s.store_id = store.store_id
LEFT JOIN {{ref("stg_local_bike__products")}} p ON s.product_id = p.product_id