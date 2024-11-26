SELECT customer_id
        ,store_id AS favorite_store_id
FROM {{ ref("stg_local_bike__orders") }}
GROUP BY
customer_id,
store_id
QUALIFY ROW_NUMBER() OVER (
  PARTITION BY customer_id
  ORDER BY COUNT(order_id) DESC
) = 1