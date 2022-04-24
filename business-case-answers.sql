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
    marketing_channel.channel_category,
    channel_spend.country,
    ( 
          SUM(channel_spend.spend_euros) 
        / COUNT(DISTINCT marketing_channel.customer_id)
    ) AS customer_acquisition_cost
FROM channel_spend
    JOIN marketing_channel
    ON channel_spend.channel_id = marketing_channel.channel_id
WHERE EXTRACT(
        YEAR
        FROM marketing_channel.conversion_timestamp
    ) = 2019 AND channel_spend.year = 2019
GROUP BY
    marketing_channel.channel_category,
    channel_spend.country 
    
    -- 3. Get a list of all customers who had a transaction in the last 2 weeks. For those customers, show the number of transactions they did up to now. (In 1 SQL statement).

SELECT
    transactions_past_two_weeks.customer_id,
    COUNT(transactions_history.transaction_id) AS all_transactions
FROM (
    SELECT customer_id
    FROM transaction
    WHERE created_at >= CURRENT_DATE - 14
) transactions_past_two_weeks
LEFT JOIN transaction transactions_history
ON transactions_history.customer_id = transactions_past_two_weeks.customer_id
GROUP BY
    transactions_past_two_weeks.customer_id 
    
    -- 4. How many customers have had at least 2 different products?

SELECT COUNT(customers_subscriptions.customer_id) as customers_at_least_two_subscriptions
FROM (
    SELECT
        customer_id,
        COUNT(distinct product_id) AS subscription_products
    FROM subscription_product
    GROUP BY customer_id
) customers_subscriptions
WHERE
    customers_subscriptions.subscription_products >= 2  
    
    -- 5. From those customers who had at least 2 different products, list the ones who are currently metal and how much time took for them to start the metal subscription (time to upsell)

SELECT
    customers_subscriptions.customer_id,
    date_part('day',
          customers_metal_subscriptions.created_at:: TIMESTAMP 
        - MIN(customers_not_metal_subscriptions.created_at:: TIMESTAMP)
    ) AS time_to_upsell
FROM (
    SELECT customer_id, COUNT(distinct product_id) AS subscription_products
    FROM subscription_product
    GROUP BY customer_id
) customers_subscriptions
JOIN (
    SELECT customer_id, created_at
    FROM subscription_product
    WHERE product_name = 'metal' AND is_current_subscription = TRUE
) customers_metal_subscriptions 
ON customers_metal_subscriptions.customer_id = customers_subscriptions.customer_id
JOIN (
    SELECT customer_id, created_at
    FROM subscription_product
    WHERE product_name != 'metal' AND is_current_subscription != TRUE
) customers_not_metal_subscriptions
ON customers_metal_subscriptions.customer_id = customers_not_metal_subscriptions.customer_id
WHERE customers_subscriptions.subscription_products >= 2
GROUP BY customers_subscriptions.customer_id, customers_metal_subscriptions.created_at
