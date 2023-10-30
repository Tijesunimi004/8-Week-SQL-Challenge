select sales.*,
	case when sales.order_date >= members.join_date then 'Y'
	else 'N' end 
	as member
from sales 
inner join menu on menu.product_id = sales.product_id
inner join members on members.customer_id = sales.customer_id