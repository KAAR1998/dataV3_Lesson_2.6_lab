USE sakila; 
SHOW FULL TABLES;

-- In the table actor, which are the actors whose last names are not repeated?
SELECT DISTINCT(last_name) FROM sakila.actor;

-- Which last names appear more than once?
SELECT last_name FROM sakila.actor HAVING count(*) > 1;

-- Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id, count(*) as by_employee FROM sakila.rental GROUP BY staff_id;

-- Using the film table, find out how many films were released each year.
SELECT release_year, count(*) as releases_per_year FROM sakila.film GROUP BY release_year;

-- Using the film table, find out for each rating how many films were there.
SELECT rating, count(*) as number_of_ratings FROM sakila.film GROUP BY rating;

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT rating, round(AVG(length), 2) as mean_length FROM sakila.film GROUP BY rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, (round(AVG(length), 2) > 120) as more_than_two_hours FROM sakila.film GROUP BY rating;

-- Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT count(*) FROM sakila.film
WHERE length = NULL OR '0';

SELECT title, length,
RANK() OVER ( ORDER BY (length) DESC) as 'rank'
FROM sakila.film;

