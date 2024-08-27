select * from swiggy

--01
select count(Distinct restaurant_name) as Count_raitng
from swiggy where rating > 4.5

--02
Select top 1 city , count(city) as cnt from swiggy
group by city order by cnt desc

--03
select count(distinct restaurant_name) as cnt from swiggy where restaurant_name like '%pizza%'

--04
select top 1 cuisine , count(cuisine) as cnt from swiggy
group by cuisine order by cnt desc

--05
select city, avg(rating) as avg_rating from swiggy group by city

--06
select restaurant_name,  max(price)as max_price from swiggy where menu_category = 'recommended'
group by restaurant_name

--07
Select distinct top 5 restaurant_name, cost_per_person from swiggy where cuisine not like '%Indian%'
order by cost_per_person desc

--08
select distinct restaurant_name, cost_per_person
from swiggy where cost_per_person >(select avg(cost_per_person) from swiggy)

--09
select Distinct s1.restaurant_name, s1.city, s2.city
from swiggy s1 inner join swiggy s2
on s1.restaurant_name = s2.restaurant_name and s1.city<> s2.city

--10
select restaurant_name, menu_category, count(*) as cnt from swiggy where menu_category = 'Main Course'
group by restaurant_name, menu_category order by cnt desc

--11

select restaurant_name, (count(case when veg_or_nonveg = 'Veg' then 1 end)/count(*))*100 as percentage_ from swiggy
group by restaurant_name having (count(case when veg_or_nonveg = 'Veg' then 1 end)/count(*))*100 = 100
order by restaurant_name asc

--or

SELECT restaurant_name, percentage_
FROM (
    SELECT 
        restaurant_name, 
        (COUNT(CASE WHEN veg_or_nonveg = 'Veg' THEN 1 END) * 100.0 / COUNT(*)) AS percentage_
    FROM swiggy
    GROUP BY restaurant_name
) AS subquery
WHERE percentage_ = 100
ORDER BY restaurant_name ASC;


--12
select restaurant_name, avg(price) as avg_price from swiggy
group by restaurant_name
order by avg_price 
-- didnt work

SELECT restaurant_name, AVG(CONVERT(DECIMAL(10, 2), price)) AS avg_price 
FROM swiggy
GROUP BY restaurant_name
ORDER BY avg_price;
-- didnt work

/* What TRY_CONVERT Does:
Functionality: TRY_CONVERT is a function introduced in SQL Server 2012. 
It attempts to convert an expression from one data type to another.
Graceful Failure: If the conversion is successful, it returns the converted value. 
If the conversion fails (because the data cannot be converted), it returns NULL instead of raising an error.
*/

SELECT restaurant_name, 
       AVG(TRY_CONVERT(DECIMAL(10, 2), price)) AS avg_price 
FROM swiggy
WHERE TRY_CONVERT(DECIMAL(10, 2), price) IS NOT NULL
GROUP BY restaurant_name
ORDER BY avg_price;


--13
select restaurant_name, count(distinct menu_category) as cnt from swiggy
group by restaurant_name
order by cnt desc

--14
select Top 1 restaurant_name, (count(case when veg_or_nonveg = 'Non-veg' then 1 end)/count(*) * 100) as non_veg_percentage
from swiggy 
group by restaurant_name order by non_veg_percentage desc













