CREATE OR REPLACE FUNCTION retrievecustomers(id1 integer,id2 integer)
RETURNS TABLE(first_name VARCHAR(45), last_name VARCHAR(45)) AS
$$
BEGIN
IF id1 < 1 OR id1 > 600 OR id2 < 1 OR id2 >600 THEN
RAISE EXCEPTION 'invalide arguments'
USING HINT = 'Check that arguments are positive and no more than 600';
END IF;
FOR counter IN id1..id2
LOOP
RETURN QUERY
SELECT customer.first_name, customer.last_name
FROM customer
WHERE customer.address_id = counter;
END LOOP;
END; $$

LANGUAGE plpgsql;


SELECT retrievecustomers(10,40);