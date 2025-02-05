use restaurant_db;

select * from menu_items;

select count(*) from menu_items;

-- A list of menu items ordered by the lowest price.
select * from menu_items
order by price;

-- A list of menu items ordered by the highest price.
select * from menu_items
order by price desc;

-- Finding Italian dishes on the menu
select count(*) from menu_items
where category = 'Italian';
-- Finding least expensive Italian dishes
select * from menu_items
where category = 'Italian'
order by price;
-- Finding most expensive Italian dishes
select * from menu_items
where category = 'Italian'
order by price desc;
-- How many dishes are in each category?
select category, count(*) as num_dishes from menu_items
group by category;
-- What is the average dish price?
select category, avg(price) as Avg_dish from menu_items
group by category;

-- View Order_Details Table:

select * from order_details;
-- What is the date range of the order details table. 
select min(order_date), max(order_date) from order_details;
-- How many orders were made within this date range?
select count(distinct order_id) from order_details;
-- How many items were made within this date range?
select count(*) from order_details;
-- Which orders had the most number of items?
select order_id, count(item_id) as num_items
from order_details
group by order_id
order by num_items desc;

-- How many orders had more than 12 items?
select order_id, count(item_id) as num_items
from order_details
group by order_id
having num_items > 12
order by num_items desc;
-- Get the actual number using a sub-query.
select count(*) from 
-- The sub query below.
(select order_id, count(item_id) as num_items
from order_details
group by order_id
having num_items > 12
order by num_items desc) as num_orders;

-- Analyze Customer Behavior:
-- Combine the menu_items and order_details tables into a single table with a Join.
Select * from order_details od 
left join menu_items mi
on od.item_id = mi.menu_item_id;

-- What were the least and most ordered items? What categories were they in?
select item_name, category, count(order_details_id) as num_purchases 
from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name, category
order by num_purchases desc;

-- What were the top 5 orders that spend the most money?
select order_id, sum(price) as TotalSpent 
from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id
group by order_id
order by TotalSpent desc
limit 5;

-- View details of the highest spend order
Select category, count(item_id) as num_items 
from order_details od left join menu_items mi
	on od.item_id = mi.menu_item_id
where order_id = 440
group by category;

-- View the details of the top 5 highest spend orders
Select category, count(item_id) as num_items 
from order_details od left join menu_items mi
	on od.item_id = mi.menu_item_id
where order_id IN (440, 2075, 1957, 330, 2675)
group by category;