select
    id as order_id,
    user_id as customer_id,
    order_date,
    status

from {{ source('jaffle_shop', 'orders') }}

{{ limit_the_data('order_date',2000) }}
-- {{ limit_the_data('order_date') }}
-- {{ limit_the_data(column_name='order_date',days_you_want=2000) }}