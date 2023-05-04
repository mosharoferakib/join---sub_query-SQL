
-- 1. List all customers who live in Texas.(Use join)
SELECT count(district)
FROM address
WHERE district = 'Texas';
-- 5 customers lives in Texas
SELECT first_name, last_name, district
FROM address AS a
JOIN customer AS c 
ON a.address_id = c.customer_id
WHERE district = 'Texas';

--Dorothy	Taylor	Texas
--Thelma	Murray	Texas
--Daniel	Cabral	Texas
--Leonard	Schofield	Texas
--Alfredo	Mcadams	Texas





--2. Get all payments above $6.99 with the Customer's Full
--Name
SELECT CONCAT (first_name,' ', last_name) AS full_name, amount
FROM customer
JOIN payment
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;



--3. Show all customers names who have made payments over $175(use
--subqueries)
SELECT first_name, last_name, customer_id
FROM customer
WHERE customer_id IN (
	SELECT customer_id 
	FROM payment
	GROUP BY customer_id
	HAVING sum(amount) > 175
);

--Rhonda Kennedy 137
--Clara	Shaw	 144
--Eleanor Hunt	 148
--Marion Snyder	 178
--Tommy	Collazo	 459
--Karl	Seal	 526



--4. List all customers that live in Nepal (use the city
--table)
SELECT CONCAT(first_name, ' ',last_name) AS full_name
FROM city
JOIN address AS a
ON city.city_id = a.city_id
JOIN customer AS c
ON a.address_id = c.address_id
WHERE city.country_id = 66; 
--Kevin Schuler



--5. Which staff member had the most
--transactions?
SELECT staff.first_name, staff.last_name, COUNT(payment.payment_id)
FROM staff
JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.first_name, staff.last_name
ORDER BY count(payment.payment_id) DESC;
--Jon Stephens	7304
--Mike Hillyer	7292





--6. How many movies of each rating are
--there?
SELECT DISTINCT rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;
--PG-13	223
--NC-17	210
--R	    195
--PG	194
--G	    178



--7.Show all customers who have made a single payment
--above $6.99 (Use Subqueries)
SELECT DISTINCT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer_id
);


--8. How many free rentals did our stores give away?
SELECT COUNT(rental.rental_id)
FROM rental
JOIN payment
ON rental.rental_id = payment.rental_id
WHERE payment.amount <= 0;
--24



