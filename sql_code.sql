SELECT 
    *
FROM
    order_analysis.orders;

SELECT DATABASE();
show tables;
desc orders;

-- find top 10 highest reveue generating products
SELECT 
    product_id, SUM(sales_price) AS total_revenue
FROM
    orders
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 10; 


-- find top 5 highest selling products in each region
with cte as (
select region,product_id,sum(sales_price) as sales
from orders
group by region,product_id)
select * from (
select *
, row_number() over(partition by region order by sales desc) as rn
from cte) A
where rn<=5;


-- find month over month growth comparison for 2022 and 2023 sales eg : jan 2022 vs jan 2023
with cte as (
select year(order_date) as order_year,month(order_date) as order_month,
sum(sales_price) as sales
from orders
group by year(order_date),month(order_date)
-- order by year(order_date),month(order_date)
	)
select order_month
, sum(case when order_year=2022 then sales else 0 end) as sales_2022
, sum(case when order_year=2023 then sales else 0 end) as sales_2023
from cte 
group by order_month
order by order_month;


-- for each category which month had highest sales 
with cte as (
select category,format(order_date,'yyyyMM') as order_year_month
, sum(sales_price) as sales 
from orders
group by category,format(order_date,'yyyyMM')
-- order by category,format(order_date,'yyyyMM')
)
select * from (
select *,
row_number() over(partition by category order by sales desc) as rn
from cte
) a
where rn=1;


-- which sub category had highest growth by profit in 2023 compare to 2022
with cte as (
select sub_category,year(order_date) as order_year,
sum(sales_price) as sales
from orders
group by sub_category,year(order_date)
-- order by year(order_date),month(order_date)
	)
, cte2 as (
select sub_category
, sum(case when order_year=2022 then sales else 0 end) as sales_2022
, sum(case when order_year=2023 then sales else 0 end) as sales_2023
from cte 
group by sub_category
)
select *
,(sales_2023-sales_2022)
from  cte2
order by (sales_2023-sales_2022) desc limit 1;

