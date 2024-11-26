-- monthly turnover

SELECT EXTRACT(YEAR FROM order_date) year
  ,EXTRACT(MONTH FROM order_date) month
  ,round(SUM(total_order_amount),2) month_turnover
  ,count(distinct(store_id)) as total_stores
  ,count(distinct(staff_id)) as total_staffs
  ,count(distinct(order_id)) as total_orders
  ,count(distinct(total_item_quantity)) as month_items_quantity_ordered
  ,count(distinct(customer_id)) as total_unique_customers_per_month

FROM {{ ref("int_local_bike__orders") }}
group by 1,2
order by year,month