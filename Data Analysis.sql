use pizza;

Select * from pizza_sales;

------------- Data Analysis -------------



----------- total revenue


Select round(sum(total_price)) 
	as Total_Revenue 
from pizza_sales;


----------- average order value


Select  round(sum(total_price) / count(distinct order_id)) 
	as avg_order_value
from pizza_sales;


----------- total pizzas sold


select sum(quantity) 
	as pizza_sold
from pizza_sales;


----------- total orders


select count(distinct order_id) 
	as total_orders
from pizza_sales;


----------- average pizzas per order


select cast(sum(quantity) / count(distinct Order_id)  as decimal(10,2)) 
	as Avg_pizza_per_order
from pizza_sales;




------------ Charts------------



----------- breakdown by day


Select  dayname(order_date) as order_day,
	count(distinct order_id) as total_daily_orders
from pizza_sales
group by dayname(order_date)
order by dayofweek(order_date);


----------- breakdown by month


Select  monthname(order_date) as order_month,
	count(distinct order_id) as total_monthly_orders
from pizza_sales
group by monthname(order_date)
order by month(order_date);


----------- breakdown by category


select pizza_category, round(sum(total_price)) as Total_sales,
round(sum(total_price) * 100 / (select sum(total_price) from pizza_sales)) as Percentage
from pizza_sales
Group by Pizza_category;



----------- breakdown by size


select pizza_size, round(sum(total_price)) as Total_sales,
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales)as decimal(10,2)) as Percentage
from pizza_sales
Group by Pizza_size
order by percentage desc;



----------- top 5 best selling pizzas


select pizza_name, 
	count(distinct order_id) as total_orders,
	sum(quantity) as quantity,
	round(sum(total_price)) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue desc
limit 5;


----------- bottom 5 selling pizzas


select pizza_name, 
	round(sum(total_price)) as total_revenue,
	count(distinct order_id) as total_orders,
	sum(quantity) as quantity
from pizza_sales
group by pizza_name
order by total_revenue
limit 5;


------------ 



















