use sakila;

-- Task-1
select concat( first_name,' ' ,last_name ) as "Full_Name" from actor ;

-- Task-2
select first_name, count(first_name) as "frequency" from actor group by first_name order by frequency desc;

-- Task-2.2
select distinct first_name, count(first_name) as "frequency" from actor group by first_name  having frequency = 1 order by frequency desc;

-- Task-3.1

select last_name, count(last_name) as "frequency" from actor group by last_name order by frequency desc;
-- Task-3.2
select last_name, count(last_name) as "Unique_Last_names" from actor  group by last_name having count(last_name) = 1 order by last_name;

-- Task-4.1
select * from film where rating = "R" ;

-- Task-4.2
select * from film where rating != "R" ;

-- Task-4.3
select * from film where rating in ("G", "PG-13","PG");

-- Task-5.1
select film_id, title, replacement_cost from film where replacement_cost<=11;

-- Task-5.2
select film_id, title, replacement_cost from film where replacement_cost between 11 and 20;

-- Task-5.3
select * from film order by replacement_cost desc;

-- Task-6
select  film.film_id, title , count(actor.actor_id) as "Number_of_actors" from actor join film  
join film_actor on actor.actor_id=film_actor.actor_id and film.film_id=film_actor.film_id 
group by film_id order by Number_of_actors desc limit 3;

-- Task-7
select title from film where title like "K%" or title like "Q%";

-- Task-8
select  concat(first_name,"",last_name) as "Name_of_actors" from actor join film  
join film_actor on actor.actor_id=film_actor.actor_id and film.film_id=film_actor.film_id 
where title = "Agent Truman";

-- Task-9
select category.name, film.title  from category join film_category join film on film.film_id=film_category.film_id and 
film_category.category_id=category.category_id where category.name="family";

-- Task-10.1
select rating, max(rental_rate) as "Maximum_rental_rate", min(rental_rate) as "Minimum_rental_rate" , 
avg(rental_rate) as "Average_rental_rate" from film group by rating order by Average_rental_rate desc;

-- Task-10.2
select film.title as "Title", count(rental_id) as "Rental_frequency" from film join inventory join rental 
on film.film_id=inventory.film_id and inventory.inventory_id=rental.inventory_id 
group by film.title order by Rental_frequency desc;

-- Task-11
select category.name, avg(replacement_cost) , avg(rental_rate),(avg(replacement_cost) - avg(rental_rate)) as "Difference"   from film
join film_category join category on film.film_id=film_category.film_id and film_category.category_id=category.category_id
group by category.name having Difference > 15;

-- Task-12
select category.name, count(film.film_id) as "Number_of_Movies" from film join film_category join category 
on film.film_id=film_category.film_id and film_category.category_id=category.category_id
group by category.name having Number_of_Movies >70;














































