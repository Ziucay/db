/* Task 1, query 1*/
SELECT country_id, country, last_update
	FROM country
	ORDER BY country_id ASC
	LIMIT 6 OFFSET 11; 
/* Task 1, query 2*/
with a_city AS (
SELECT city, city_id
	FROM city
	WHERE UPPER(city) LIKE 'A%')
SELECT *
	FROM address
	WHERE EXISTS(SELECT 1 FROM a_city WHERE address.city_id = a_city.city_id);

/* Task 1, query 3*/

SELECT first_name, last_name, c.city
FROM customer
	LEFT JOIN address a ON customer.address_id = a.address_id
	LEFT JOIN city c on a.city_id = c.city_id;
	
/* Task 1, query 4*/
SELECT *
FROM customer
	LEFT JOIN payment p ON customer.customer_id = p.customer_id
WHERE p.amount >= 11;

/* Task 1, query 5*/
SELECT first_name
FROM customer
GROUP BY first_name
HAVING count(*) > 1;
	
/* Task 2, view 1*/
/* cities which start from A*/
CREATE OR REPLACE VIEW ACity AS
SELECT city, city_id
	FROM city
	WHERE UPPER(city) LIKE 'A%';

/* films released in 21 century*/
CREATE OR REPLACE VIEW NewCenturyFilm AS
SELECT * FROM film
WHERE release_year >= 2000;

/* Task 2, implement one of the views into a query*/
SELECT *
	FROM address
	WHERE EXISTS(SELECT 1 FROM Acity WHERE address.city_id = Acity.city_id);
/* Task 2, creating a trigger */

CREATE OR REPLACE FUNCTION debug_msg() RETURNS trigger AS $emp_stamp$
    BEGIN
		RAISE NOTICE 'Trigger activated!';
        RETURN NULL;
    END;
$emp_stamp$ LANGUAGE plpgsql;


CREATE TRIGGER t_actor
AFTER INSERT ON actor
FOR EACH STATEMENT
EXECUTE PROCEDURE debug_msg();
--Query to check trigger
INSERT INTO actor (first_name,last_name)
VALUES ('John','Smith')

	
