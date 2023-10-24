with Ranked_Join as(
		select	members.customer_id, 
		menu.product_name, 
		sales.order_date,
		members.join_date,
		datediff(day, sales.order_date, members.join_date) as "Day Difference",
		dense_rank() over (partition by members.customer_id
		order by datediff(day, sales.order_date, members.join_date)) as "Day Rank"
from sales
inner join menu on sales.product_id = menu.product_id
inner join members on sales.customer_id = members.customer_id
where sales.order_date <= members.join_date
)

select customer_id, product_name, join_date, order_date, "Day Difference"
from Ranked_Join
where "Day Rank" = 1