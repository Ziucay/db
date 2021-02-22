CREATE INDEX age_index ON customer USING btree (age);

Explain ANALYZE
SELECT age
FROM customer
WHERE age>25 AND age<30;

/*
  There was a significant difference between sequential scan and index scan. index scan was faster.
*/
