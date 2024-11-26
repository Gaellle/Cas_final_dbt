select 
    CAST(staff_id as string) staff_id,
    first_name,
    last_name,
    email,
    phone,
    CASE WHEN active = 1 THEN true ELSE false END AS is_active,
    CAST(store_id as string) store_id,
    CASE WHEN manager_id = 'NULL' then null ELSE manager_id END AS manager_id
from {{ source('local_bike', 'staffs') }}