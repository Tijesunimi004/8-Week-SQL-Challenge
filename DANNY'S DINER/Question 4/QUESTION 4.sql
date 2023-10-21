select  top 1 product_name, count(sales.product_id) as 'Food Count'
from menu
inner join sales on menu.product_id = sales.product_id
group by product_name
order by 'Food Count' desc