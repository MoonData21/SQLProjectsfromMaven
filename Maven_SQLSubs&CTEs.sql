select * from menu_items;

-- How many categories have a maximum price below $15?
-- a. What's the max price for each category?
select category, max(price) as max_price
from menu_items
group by category;
-- b. How many max prices are less than $15?

-- Subquery
select * from
(select category, max(price) as max_price
from menu_items
group by category) as mp
where max_price < 15;

-- CTE
WITH mp as (select category, max(price) as max_price
			from menu_items
			group by category)
select * from mp
where max_price < 15;
-- Or use count(*) which would provide the count instead of a list of categories

-- CTE: Multiple references (referencing one CTE multiple times)
WITH mp as (select category, max(price) as max_price
			from menu_items
			group by category)
select count(*)
from mp
where max_price < (select avg(max_price) from mp);

-- CTE: Multiples tables
WITH mp as (select category, max(price) as max_price
			from menu_items
			group by category),
	 ci as (select * 
     from menu_items
	 where item_name like '%Chicken%')
select * 
from ci left join mp on ci.category = mp.category;

-- Recursive CTEs
