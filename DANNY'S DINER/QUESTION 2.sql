select customer_id, count(distinct(order_date)) as "Total Days by each customer" from sales
group by customer_id
