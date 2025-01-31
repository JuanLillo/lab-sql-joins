#1.List the number of films per category.
use sakila;

select name
from category;

#2 Retrieve the store ID, city, and country for each store.
select *
from store;
select *
from city;
select *
from country;

SELECT store.store_id,
	   city.city,
       country.country
From store
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;

#3 Calculate the total revenue generated by each store in dollars.
select *
from payment;
select *
from rental;
select *
from store;
select *
from staff;
select *
from address;


SELECT 
    s.store_id,
    SUM(p.amount) AS total_revenue
FROM 
    payment p
JOIN 
    rental r ON p.rental_id = r.rental_id
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    store s ON i.store_id = s.store_id
GROUP BY 
    s.store_id;
    
#4 Determine the average running time of films for each category.

select *
from film;
select *
from payment;
select *
from rental;
select *
from store;
select *
from staff;
select *
from address;
select *
from category;
select *
from film_category;

SELECT 
    category.category_id,
    AVG(film.length) AS avg_running_time
    from film
join 
category on category.film_id = film.film_id
group by film.length;