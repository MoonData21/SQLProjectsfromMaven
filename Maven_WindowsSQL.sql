-- View the table
select * from baby_names;

-- Order by popularity
select * from baby_names
order by total desc;

-- Add a popularity column
-- Row() is the function and Over clause() is the window
select gender, name, total,
	row_number() over(order by total desc) as Popularity,
    rank() over(order by total desc) as Popularity_R,
    dense_rank() over(order by total desc) as Popularity_DR
from baby_names;
-- Try Different windows functions
/* The Over clause specifies the window portion of the window function
   And the window is essentially the view of the table that I want when I am applying the row # function.*/
select gender, name, total,
	row_number() over(partition by gender order by total desc) as Popularity
from baby_names;

-- What are the top 3 most popular names for each gender using a sub-query?
select * from 
(select gender, name, total,
	row_number() over(order by total desc) as Popularity
from baby_names) as pop
where popularity <= 3;
