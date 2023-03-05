 SELECT * 
 FROM customer
 
 
 SELECT customer_id, first_name, last_name, email 
 FROM customer
 
 SELECT * 
 FROM payment
 
 SELECT customer_id, staff_id, rental_id
 from payment
 
 SELECT *
 FROM film
 
 SELECT DISTINCT release_year
 from film
 
 Select distinct rental_rate 
 from film
 
 SELECT *
 FROM film LIMIT 4
 
  SELECT * 
 FROM customer
 
  SELECT * 
 FROM customer order by last_name Asc
 
 SELECT customer_id, amount
FROM payment
ORDER BY amount DESC
LIMIT 10;


SELECT * 
 FROM customer

SELECT last_name, first_name, email
FROM customer
WHERE first_name = ‘Jamie’;
 
 SELECT customer_id, amount, payment_date
FROM payment
WHERE amount <1 OR amount > 8;

SELECT phone
FROM address
WHERE address = ‘259 Ipoh Drive’

SELECT customer_id, amount
FROM payment
WHERE amount NOT BETWEEN 8 AND 9;

SELECT customer_id, rental_id, return_date
FROM rental
WHERE customer_id IN (1,2)
ORDER BY return_date DESC;

SELECT *
FROM payment
WHERE amount IN (7.99,8.99)

SELECT first_name, last_name
FROM customer
WHERE first_name LIKE ‘Jen%’;

SELECT first_name, last_name
FROM customer
WHERE first_name LIKE ‘%er’

SELECT first_name, last_name
FROM customer
WHERE first_name LIKE ‘_her%’;

SELECT *
FROM actor
WHERE first_name LIKE 'P%';


SELECT SUM (amount)
FROM payment;

SELECT AVG (amount)
FROM payment;

SELECT MIN (amount)
FROM payment;

SELECT MAX (amount)
FROM payment;

SELECT COUNT (*)
FROM payment;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id, 
ORDER BY SUM (amount) DESC

 SELECT staff_id, count(payment_id)
FROM payment
GROUP BY staff_id;

SELECT rating, AVG (replacement_cost)
FROM film
GROUP BY rating;

SELECT customer_id, SUM (amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) >200;


SELECT rating, AVG (rental_rate)
FROM film
WHERE rating IN (‘R’, ‘PG’, ‘G’)
GROUP BY rating;

SELECT customer_id, COUNT(amount)
FROM payment
GROUP BY customer_id
HAVING COUNT (amount) >=40;

SELECT COUNT (DISTINCT(district))
FROM address;