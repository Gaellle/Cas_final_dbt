-- annual turnover

SELECT EXTRACT(YEAR FROM order_date) year
  ,round(SUM(total_order_amount),2) annual_turnover
  ,count(distinct(store_id)) as total_stores
  ,count(distinct(staff_id)) as total_staffs
  ,count(total_item_quantity) as annual_items_quantity_ordered
  ,count(distinct(customer_id)) as total_unique_customers

FROM {{ ref("int_local_bike__orders") }}
group by 1
order by year