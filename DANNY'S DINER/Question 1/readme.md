<h1>Solution to Question 1</h1>
<font size = "+1.5">Question: What is the total amount each customer spent at the restaurant?</font>

````sql
select sales.customer_id, sum(menu.price) as "Amount Spent"
from sales
inner join menu on sales.product_id = menu.product_id
group by sales.customer_id
````

<img src = "danny_1.png" alt = "Answer" width = "450" height = "300">