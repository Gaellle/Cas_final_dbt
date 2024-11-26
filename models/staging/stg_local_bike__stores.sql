select 
    CAST(store_id as string) store_id,
    store_name,
    email,
    phone,
    street,
    city,
    state,
    CAST(zip_code AS string) zip_code
from {{ source('local_bike', 'stores') }}