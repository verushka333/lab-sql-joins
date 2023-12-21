Use Sakila

-- solution_1
select category.name, count(*) as  'number of movies'
from film
join film_category ON film.film_id=film_category.film_id
join category on category.category_id=film_category.category_id
Group by name;

-- solution_2
select store.store_ID, address.address_id, city.city, country.country from address
join store ON address.address_id=store.address_id
join city ON address.city_id=city.city_id
join country ON city.country_id=country.country_id;

-- solution_3
select store.store_id, sum(payment.amount) from payment
join staff ON payment.staff_id=staff.staff_id
join store ON staff.store_id=store.store_id
group by store_id;

-- solution_4
select category.name, avg(film.length) as `running time`
from film
join film_category ON film.film_id=film_category.film_id
join category on category.category_id=film_category.category_id
Group by name;

-- bonus_5
select category.name, avg(film.length) as `running time`
from film
join film_category ON film.film_id=film_category.film_id
join category on category.category_id=film_category.category_id
Group by name
order by `running time` desc limit 1;

-- bonus_6
select film.title, count(*) as `frequency rented`   
from film
join inventory ON inventory.film_id=film.film_id
join rental ON rental.inventory_id=inventory.inventory_id
group by title
order by `frequency rented` desc limit 10;

-- bonus_7
select count(*) from film 
join inventory ON inventory.film_id=film.film_id
join rental ON rental.inventory_id=inventory.inventory_id
where title = 'Academy Dinosaur' and store_id = 1;

-- bonus_8
select title,
IF(inventory_id is null, 'Not available', 'Available') as 'Availability',
CASE WHEN inventory_id is null then 'not availible' else 'Available' END,
IFNULL(Inventory_id,'not available')
from inventory 
right join film on inventory.film_id=film.film_id
order by inventory_id;



