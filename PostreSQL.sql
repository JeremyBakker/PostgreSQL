SELECT DISTINCT release_year FROM film;

SELECT DISTINCT rental_rate FROM film;

SELECT DISTINCT rating FROM film;

SELECT customer_id, amount, payment_date
FROM payment
WHERE amount <= 1 OR AMOUNT >= 8;

SELECT * FROM customer
WHERE first_name = 'Jared';

SELECT * FROM payment
WHERE amount = 7.99;

SELECT * FROM payment
WHERE amount <= 4.99;

SELECT amount, payment_date FROM payment
WHERE amount != 4.99;

SELECT amount, payment_date FROM payment
WHERE amount = 4.99 OR amount = 1.99;

SELECT * FROM customer
WHERE store_id = 1 AND address_id > 5;

SELECT COUNT(DISTINCT(amount)) FROM payment;

SELECT first_name, last_name FROM customer
ORDER BY first_name DESC

SELECT first_name, last_name FROM customer
ORDER BY first_name ASC, 
last_name DESC;

-- postgresql allows sorting results based on a column not in the selection list
SELECT first_name FROM customer
ORDER BY last_name;

SELECT customer_id from payment
ORDER BY amount DESC
LIMIT 10

SELECT title 
FROM film
WHERE film_id <= 5

SELECT customer_id, amount FROM payment
WHERE amount BETWEEN 8 and 9;

SELECT amount, payment_date FROM payment
WHERE payment_date BETWEEN '2007-02-07' AND '2007-02-15';

SELECT customer_id, rental_id, return_date
FROM rental
WHERE customer_id IN (1,2)
ORDER BY return_date DESC;

SELECT first_name, last_name 
FROM customer
WHERE first_name LIKE 'Jen%';

SELECT first_name, last_name
FROM customer
WHERE first_name LIKE '_her%';

-- Search with ILIKE for case insensitive searches
SELECT first_name, last_name
FROM customer
WHERE first_name ILIKE 'BAR%';

SELECT COUNT(amount) 
FROM payment
WHERE amount > 5.00;

SELECT COUNT(first_name)
FROM actor
WHERE first_name ILIKE 'P%';

SELECT COUNT(DISTINCT(district)) FROM address;

SELECT count(*) 
FROM film
WHERE rating = 'R'
AND replacement_cost 
BETWEEN 5.00 AND 15.00;

SELECT count(*) FROM film
WHERE title LIKE'%Truman%'

SELECT ROUND(AVG(amount), 2) FROM payment;

SELECT SUM(amount) FROM payment;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

SELECT staff_id, COUNT(payment_id)
FROM payment
GROUP BY staff_id;

SELECT rating, COUNT(rating) 
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;

SELECT rating, AVG(rental_rate)
FROM film
GROUP BY rating;

SELECT staff_id, COUNT(payment_id), SUM(amount) 
FROM payment
GROUP BY staff_id;

SELECT rating, ROUND(AVG(replacement_cost), 2)
FROM film
GROUP BY rating;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;