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

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 200;

SELECT store_id, COUNT(customer_id)
FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300;

SELECT rating, AVG(rental_rate) 
FROM film
WHERE rating IN ('R', 'G', 'PG')
GROUP BY rating
HAVING AVG(rental_rate) < 3.00;

SELECT customer_id, COUNT(payment_id)
FROM payment
GROUP BY customer_id
HAVING COUNT(payment_id) >= 40;

SELECT rating, AVG(rental_duration)
FROM film
GROUP BY rating
HAVING AVG(rental_duration) > 5;

SELECT customer_id, SUM(AMOUNT)
FROM payment
WHERE staff_id = 2 and SUM(AMOUNT) >= 110;

SELECT customer_id, SUM(AMOUNT)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(AMOUNT) >= 110;

SELECT COUNT(*)
FROM film
WHERE title
LIKE 'J%'

SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;

SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id;

SELECT customer.customer_id, first_name, last_name, email, amount, payment_date
FROM customer
INNER JOIN payment ON payment.customer_id = customer.customer_id
ORDER BY customer.customer_id;

SELECT payment_id, amount, first_name, last_name
FROM payment
INNER JOIN staff ON payment.staff_id = staff.staff_id;

SELECT title, COUNT(title) AS copies_at_store_1
FROM inventory
JOIN film ON inventory.film_id = film.film_id
WHERE store_id = 1
GROUP BY title
ORDER BY title;

SELECT title, name movie_language
FROM film
JOIN language lan on lan.language_id = film.language_id;

SELECT film.film_id, film.title, inventory.inventory_id
FROM film
LEFT JOIN inventory
ON inventory.film_id = film.film_id
WHERE inventory.inventory_id IS NULL
ORDER BY film.title;

-- UNION combines two tables: need same number of columns with same data type

SELECT SUM(amount) AS total, extract(month from payment_date) AS month
FROM payment
GROUP BY month
ORDER BY total DESC
LIMIT 1;

SELECT first_name || ' ' || last_name AS full_name
FROM customer;

SELECT upper(first_name), char_length(first_name)
FROM customer;

SELECT film_id, title, rental_rate 
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);

SELECT film_id, title
FROM film
WHERE film_id IN
(SELECT inventory.film_id
FROM rental
JOIN inventory
ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30');

SELECT e1.employee_name
FROM employee AS e1, employee AS e2
WHERE
e1.employee_location = e2.employee_location
AND e2.employee_name = 'Joe';

SELECT a.customer_id, a.first_name, a.last_name, b.customer_id, b.first_name, b.last_name
FROM customer AS a, customer AS b
WHERE a.first_name = b.last_name
ORDER BY a.customer_id;

SELECT name, monthlymaintenance
FROM cd. facilities;

SELECT name, membercost
FROM cd. facilities
WHERE membercost > 0;

SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost < monthlymaintenance/50;

SELECT *
FROM cd.facilities
WHERE name 
LIKE '%Tennis%';

SELECT memid, surname, firstname, joindate
FROM cd.members
WHERE joindate >= '2012-09-01';

SELECT DISTINCT(surname)
FROM cd.members
ORDER BY surname
LIMIT 10;

SELECT surname
FROM cd.members
ORDER BY joindate DESC
LIMIT 1;

SELECT COUNT(*)
FROM cd.facilities
WHERE guestcost > 10;

SELECT COUNT(slots)
FROM cd.bookings
GROUP BY facid
ORDER BY COUNT(slots) DESC;

SELECT starttime
FROM cd.bookings
WHERE facid 
IN (SELECT facid FROM cd.facilities WHERE name LIKE 'Tennis%');

SELECT starttime
FROM cd.bookings
WHERE memid 
IN (SELECT memid FROM cd.members WHERE firstname = 'David' AND surname = 'Farrell');

SELECT DISTINCT e.emp_id AS 'mng_id', e.emp_name AS 'mng_name'
FROM employees e, employees m WHERE e.emp_id = m.mng_id;

SELECT e1.employee_name 
FROM employee e1, employee e2
WHERE e1.employee_location = e2.employee_location
And e2.employee_name = "Joe";