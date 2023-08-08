
SELECT
    -- Seleciona o menor preço de plano existente (faturamento mínimo), arredondando o valor para duas casas decimais.
    ROUND(MIN(sub.subscription_price), 2) AS faturamento_minimo,
    -- Seleciona o maior preço de plano existente (faturamento máximo), arredondando o valor para duas casas decimais.
    ROUND(MAX(sub.subscription_price), 2) AS faturamento_maximo,
    -- Seleciona a média dos preços de planos existentes (faturamento médio), arredondando o valor para duas casas decimais.
    ROUND(AVG(sub.subscription_price), 2) AS faturamento_medio,
    -- Seleciona a soma total dos preços de planos existentes (faturamento total), arredondando o valor para duas casas decimais.
    ROUND(SUM(sub.subscription_price), 2) AS faturamento_total
-- Faz um INNER JOIN com a tabela subscription_plans usando a coluna subscription_id para relacionar as informações de planos com as informações de pessoas usuárias.
FROM
    subscription_plans sub
        INNER JOIN
    user_data ud ON sub.subscription_id = ud.subscription_id;
