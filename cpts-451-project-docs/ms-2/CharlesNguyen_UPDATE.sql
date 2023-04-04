DROP TABLE dup_business;
CREATE TABLE dup_business AS (SELECT * FROM business);
-- sum_checkins
DROP TABLE sum_checkins;
CREATE TABLE sum_checkins AS (
    SELECT business_id, sum(num_checkins)
    FROM checkin
    GROUP BY business_id
);
SELECT *
FROM dup_business AS b1, sum_checkins AS b2
WHERE b1.business_id=b2.business_id;

-- sum_reviews
DROP TABLE sum_reviews;
CREATE TABLE sum_reviews AS (
    SELECT business_id, count(review_id)
    FROM review
    GROUP BY business_id
);
SELECT *
FROM dup_business AS b1, sum_reviews AS b2
WHERE b1.business_id=b2.business_id;
