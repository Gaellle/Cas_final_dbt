

select o.order_id
      ,o.customer_id
      ,o.order_status
      ,o.order_date
      ,o.required_date
      ,o.shipped_date
      ,store_id
      ,staff_id
      ,COUNT(DISTINCT(product_id)) distinct_products_ordered
      ,SUM(item_quantity) total_item_quantity
      ,ROUND(SUM(total_order_item_amount),2) total_order_amount
      ,ROUND(AVG(discount),2) average_discount
from {{ref("int_local_bike__order_items")}} o
group by o.order_id
      ,o.customer_id
      ,o.order_status
      ,o.order_date
      ,o.required_date
      ,o.shipped_date
      ,store_id
      ,staff_id
