CREATE INDEX review_index ON customer USING hash (review);

Explain ANALYZE
SELECT review
FROM customer
WHERE review = '%cake%';

/*
  There was a significant difference between sequential scan and index scan. index scan was faster.
*/
