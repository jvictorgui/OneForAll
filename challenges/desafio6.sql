SELECT
    ROUND(MIN(sub.subscription_price), 2) AS faturamento_minimo,
    ROUND(MAX(sub.subscription_price), 2) AS faturamento_maximo,
    ROUND(AVG(sub.subscription_price), 2) AS faturamento_medio,
    ROUND(SUM(sub.subscription_price), 2) AS faturamento_total
FROM
    subscription_plans sub
        INNER JOIN
    user_data ud ON sub.subscription_id = ud.subscription_id;
