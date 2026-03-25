create database project_p1;
use project_p1;
create table retail_sales(
transactions_id int primary key,
	sale_date date,
	sale_time time,
	customer_id int,
	gender varchar(10),
	age int,
	category varchar(20),
	quantiy int,
	price_per_unit float,
	cogs float,
	total_sale float

);

select * from retail_sales limit 10;
-- how to count the number of rows
select count(*)
from retail_sales;

-- how to find the null values
select * from retail_sales where transactions_id is null;

-- how to check the null values fro all columns in one time
select * from retail_sales where 
transactions_id	is null
or
sale_date is null
or
sale_time is null
or
customer_id is null 
or
gender is null 
or	
age	is null 
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null ;


-- how to delete the null values from the multiple columns in one at a time
delete from retail_sales where 
transactions_id	is null
or
sale_date is null
or
sale_time is null
or
customer_id is null 
or
gender is null 
or	
age	is null 
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null ;

-- DATA Exploration
-- how many sales we have
select count(*) as total_sales from retail_sales;


-- HOW many customer we have
select count(customer_id) as total_sales from retail_sales;

-- how many unique customer we have
select count(distinct customer_id) as total_sales from retail_sales;

select * from retail_sales;
select distinct category from retail_sales;




-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)



-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from retail_sales ;
select * from retail_sales where sale_date="2022-11-05";

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
select * from retail_sales
where category="clothing"
AND
TO_CHAR(sale_date,"YYYY-MM")="2022-11"
AND
quantity >= 4; 	

SELECT *
FROM transactions
WHERE category = 'Clothing'
  AND quantity > 10
  AND transaction_date >= '2022-11-01'
  AND transaction_date < '2022-12-01';


-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select * from retail_sales;

select category,sum(total_sale) as net_sale,count(*) as total_orders
from retail_sales 
group by category ;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select round(avg(age),2) as avg_age,category 
from retail_sales
where category="beauty";


-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * 
from retail_sales
where total_sale >1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select category,gender,
count(*) as total_transaction
from retail_sales
group by category,gender
order by 1;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
select * from retail_sales;

select 		
extract(year from sale_date) as year,
extract(month from sale_date) as month,
round(avg(total_sale),2) as avg_sale
from retail_sales
group by
extract(year from sale_date),
extract(month from sale_date)
order by year desc,month  desc;	

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
select 	customer_id,
sum(total_sale) as total_sales
from retail_sales
group by customer_id
order by total_sales desc
limit 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select * from retail_sales;
select category,
count( distinct customer_id) as count_unique_cust
from retail_sales
group by category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
select 
case
when extract(hour from sale_time)< 12  then "morning"
when extract(hour from sale_time) between 12 and 17 then"afternoon"
else "evening"
end as shift,
count(*) as number_of_orders
from retail_sales
group by shift
order by shift;


-- END OF THE PROJECT --