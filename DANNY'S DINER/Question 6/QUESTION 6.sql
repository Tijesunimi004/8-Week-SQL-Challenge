with Ranked_Join as(
		select	members.customer_id, 
		menu.product_name, 
		sales.order_date,
		members.join_date,
		dense_rank() over (partition by members.customer_id, members.join_date 
		order by datediff(day, members.join_date, sales.order_date) asc) as join_rank
from sales
inner join menu on sales.product_id = menu.product_id
inner join members on sales.customer_id = members.customer_id
where sales.order_date >= members.join_date
)

select customer_id, product_name, join_date, order_date
from Ranked_Join
where join_rank = 1