with orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }} 

),

final as (

    select
        ANY_VALUE(customer_id) as CUSTOMER_ID, orders.order_id, sum(payments.amount) as amount from orders 
            inner join payments on orders.order_id = payments.order_id where status = 'completed' group by orders.order_id
            
)

select * from final