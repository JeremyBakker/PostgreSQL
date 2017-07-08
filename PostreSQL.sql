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

















