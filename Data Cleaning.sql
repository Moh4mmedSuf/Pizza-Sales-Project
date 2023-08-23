
---------- Data Cleaning

set autocommit = Off;

rollback;

commit;

set sql_safe_updates = 0;

SET SQL_MODE = '';

select * from pizza_sales;

describe pizza_sales;


---------- uniting the date format 


update pizza_sales
set order_date = case 
	when order_date like '%/%' then date_format(str_to_date(order_date, '%m/%d/%Y'), '%Y-%m-%d')
    else null
end;


---------- Changing data types & Deleting extra columns


alter table pizza_sales
modify column  pizza_name_id varchar(50);

alter table pizza_sales
modify column  pizza_size varchar(50);

alter table pizza_sales
modify column  pizza_category varchar(50);

alter table pizza_sales
modify column  pizza_ingredients varchar(50);

alter table pizza_sales
modify column  pizza_name varchar(50);

alter table pizza_sales
modify column  order_time time;

alter table pizza_sales
modify column  unit_price float;

alter table pizza_sales
modify column  total_price float;

alter table pizza_sales
drop column  column1;

alter table pizza_sales
drop column  column2;

