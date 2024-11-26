-- daily turnover

SELECT  order_date
  ,EXTRACT(DAYOFWEEK FROM order_date) weekday
  ,round(SUM(total_order_amount),2) daily_turnover
  ,count(distinct(order_id)) as total_orders
  ,count(distinct(total_item_quantity)) as total_quantity_ordered
  ,count(distinct(customer_id)) as total_customers
  ,round(AVG(total_order_amount),2) daily_average_basket

FROM {{ ref("int_local_bike__orders") }}
group by 1,2