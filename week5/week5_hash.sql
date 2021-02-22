CREATE INDEX review_index ON customer USING hash (review);

Explain ANALYZE
SELECT review
FROM customer
WHERE review = '%cake%';