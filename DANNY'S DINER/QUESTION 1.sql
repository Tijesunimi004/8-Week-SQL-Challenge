select sales.customer_id, sum(menu.price) as "Amount Spent"
from sales
inner join menu on sales.product_id = menu.product_id
group by sales.customer_id