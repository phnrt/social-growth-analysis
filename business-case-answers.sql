-- Part 1 of Business Case N26

-- 1. For the customer with the email address ‘anaberlin83@hotmail.com’, show all the merchant names the customer has transacted with in March 2019.


SELECT DISTINCT merchant_name
FROM transaction AS t
    JOIN customer c
    ON c.customer_id = t.customer_id
WHERE
    c.email = 'anaberlin83@hotmail.com' AND
    t.created_at BETWEEN '2019-03-01 00:00:00' AND '2019-03-31 23:59:59' 
    
    
    -- 2. For every channel category, calculate the average level CACs, per country for conversions in 2019.


SELECT
    c1.channel_category,
    cs.country,
    SUM(cs.spend_euros) / COUNT(DISTINCT c1.customer_id) AS customer_acquisition_cost
FROM channel_spend cs
    JOIN marketing_channel c1
    ON cs.channel_id = c1.channel_id
WHERE EXTRACT(
        YEAR
        FROM c1.conversion_timestamp
    ) = 2019 ANDcs.year = 2019
GROUP BY
    c1.channel_category,
    cs.country 
    
    -- 3. Get a list of all customers who had a transaction in the last 2 weeks. For those customers, show the number of transactions they did up to now. (In 1 SQL statement).


SELECT
    t2.customer_id,
    COUNT(t1.transaction_id) AS transactions_ever
FROM (
    SELECT customer_id
    FROM transaction
    WHERE created_at >= CURRENT_DATE - 14
) t2
LEFT JOIN transaction t1
ON t1.customer_id = t2.customer_id
GROUP BY
    t2.customer_id 
    
    -- 4. How many customers have had at least 2 different products?
    -- Assumption: the question wants to know customers from all database that had at least 2 products
    -- REVIEWED: DONE / RESULT IS CORRECT

SELECT COUNT(customer_id)
FROM (
    SELECT
        s.customer_id,
        COUNT(s.product_id) AS subscription_product_unique
    FROM subscription_product s
    GROUP BY customer_id
) sub1
WHERE
    subscription_product_unique >= 2 
    
    -- 5. From those customers who had at least 2 different products, list the ones who are currently metal and how much time took for them to start the metal subscription (time to upsell)


SELECT
    s.customer_id,
    date_part(
        'day',
        s1.created_at:: TIMESTAMP - MIN(s2.created_at:: TIMESTAMP)
    ) AS time_to_upsell
FROM (
    SELECT
        customer_id,
        COUNT(product_id) AS subscription_product_unique
    FROM subscription_product
    GROUP BY customer_id
) s
JOIN (
    SELECT *
    FROM subscription_product
    WHERE
        product_name = 'metal' AND
        is_current_subscription = TRUE
) s1
ON s1.customer_id = s.customer_id
JOIN (
    SELECT *
    FROM subscription_product
    WHERE
        product_name != 'metal' AND
        is_current_subscription != TRUE
) s2
ON s1.customer_id = s2.customer_id
WHERE subscription_product_unique >= 2
GROUP BY s.customer_id, s1.created_at