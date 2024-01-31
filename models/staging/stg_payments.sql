select 
    id as payment_id,
    orderid as order_id,
    paymentmethod as method,
    status='success' as success,
    (amount / 100.0) as amount

from {{ source("stripe","payment") }}
