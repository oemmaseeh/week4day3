--Week 5 - Wednesday Questions

--1. List all customers who live in Texas (use JOINs)
5 Ian, Brian,Ricahrd, Kim, Jennifer
SELECT *
FROM CUSTOMER 
INNER JOIN ADDRESS 
ON customer.address_id = address.address_id;
--2. Get all payments above $6.99 with the Customer's Full Name
Douglas Graf, Mary Smith, Alfredo Mcadams, Harold Martino, peter menard, alvin deloach
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE AMOUNT > 6.99;
--3. Show all customers names who have made payments over $175(use subqueries)
Douglas Graf, Mary Smith
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE AMOUNT > 175;
--4. List all customers that live in Nepal (use the city table)
Kevin Schuler
SELECT first_name,last_name, country
FROM customer
INNER JOIN address
on customer.address_id = address.address_id
INNER JOIN city 
on address.city_id = city.city_id
Inner Join country
on city.country_id = country.country_id
where country = 'Nepal';
--5. Which staff member had the most transactions?
staff_id 1 mike
SELECT staff_id, COUNT(rental_id) AS rental_count
FROM rental
GROUP BY staff_id
ORDER BY rental_count DESC;
--6. How many movies of each rating are there?
nc-17=209,g=178,pg-13=224,pg=194,r=196
SELECT rating, COUNT(film_id) AS film_count
FROM film
GROUP BY rating;
--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
Mary,Peter,Harold,Douglas,Alvin,Alfredo
SELECT customer.first_name, customer.last_name
FROM customer 
WHERE customer.customer_id IN (
    SELECT payment.customer_id
    FROM payment 
    WHERE payment.amount > 6.99
);
--8. How many free rentals did our stores give away?
14564
SELECT count (*)
FROM payment
Where amount < 0
