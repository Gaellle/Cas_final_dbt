WITH pending_orders_by_customer AS 
(SELECT customer_id,count(distinct(order_id)) as pending_order
FROM {{ ref("stg_local_bike__orders") }}
WHERE order_status != '4'
GROUP BY 1
)



SELECT c.customer_id
      ,first_name
      ,last_name
      ,phone
      ,email
      ,street
      ,city
      ,state
      ,COUNT(DISTINCT(order_id)) as total_orders
      ,COALESCE(po.pending_order,0) AS pending_orders
      ,MIN(o.order_date) as first_order_date
      ,MAX(o.order_date) as last_order_date
      ,s.favorite_store_id
      ,COUNT(DISTINCT(o.product_id)) distinct_products_ordered
      ,SUM(o.item_quantity) total_item_quantity
      ,ROUND(SUM(o.total_order_item_amount),2) total_order_amount
      ,ROUND(AVG(o.discount),2) average_discount


FROM {{ ref("stg_local_bike__customers") }} c
LEFT JOIN pending_orders_by_customer as po ON c.customer_id = po.customer_id
LEFT JOIN {{ ref("int_local_bike__favorite_store") }} as s ON c.customer_id = s.customer_id
LEFT JOIN {{ ref("int_local_bike__order_items") }} as o ON c.customer_id = o.customer_id

GROUP BY c.customer_id
      ,first_name
      ,last_name
      ,phone
      ,email
      ,street
      ,city
      ,state
      ,po.pending_order
      ,s.favorite_store_id
