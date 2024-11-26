select CAST(category_id as string) category_id,
    category_name
from {{ source('local_bike', 'categories') }}