# Relacional-Vistas-Disparadores

## Consultas:

a. select c.name as categoria, sum(p.amount) as venta_total from payment p inner join rental r on r.rental_id = p.rental_id inner join inventory i on i.inventory_id = r.inventory_id inner join film_category fc on fc.film_id = i.film_id inner join category c on c.category_id = fc.category_id group by categoria order by venta_total desc;  

b. select sum(p.amount) as ventas_por_tienda, concat(city, ',', country) as Ciudad_Pais, concat(st.first_name, ' ', st.last_name) as nombre_encargado from store s inner join address a on s.address_id = a.address_id inner join city c on a.city_id = c.city_id inner join country co on c.country_id = co.country_id inner join staff st on s.manager_staff_id = st.staff_id inner join customer cu on s.store_id = cu.store_id inner join payment p on cu.customer_id = p.customer_id group by c.city_id, co.country_id, st.staff_id;  

c. select f.film_id as identificador, title as titulo, description as descripcion, c.name as categoria, rental_rate as precio, length as duracion, rating as clasificacion, string_agg(concat(first_name, ' ', last_name), ', ') as actores from film f inner join film_category fc on f.film_id = fc.film_id inner join category c on fc.category_id = c.category_id inner join film_actor fa on f.film_id = fa.film_id inner join actor a on a.actor_id = fa.actor_id group by f.film_id, c.name;  

d. select a.first_name as nombre, a.last_name as appellido, concat(c.name, ':', f.title) as categoria_pelicula from actor a inner join film_actor fa on a.actor_id = fa.actor_id inner join film f on fa.film_id = f.film_id inner join film_category fc on fa.film_id = fc.film_id inner join category c on fc.category_id = c.category_id;  
