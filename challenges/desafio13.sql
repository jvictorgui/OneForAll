-- Relação da quantidade total de pessoas usuárias e favoritadas por faixa etária
-- Utiliza a cláusula CASE para definir a faixa etária com base na idade das pessoas usuárias.
-- A coluna resultante é nomeada como faixa_etaria.
SELECT CASE
           WHEN user_age <= 30 THEN 'Até 30 anos'
           WHEN user_age <= 60 THEN 'Entre 31 e 60 anos'
           ELSE 'Maior de 60 anos'
       END AS faixa_etaria,
       -- Conta o número total de pessoas usuárias na faixa etária especificada.
       COUNT(DISTINCT ud.user_id) AS total_pessoas_usuarias,
       -- Conta o número total de músicas favoritadas por pessoas usuárias na faixa etária especificada.
       COUNT(fs.song_id) AS total_favoritadas
-- Realiza um LEFT JOIN entre as tabelas user_data e favorite_songs, usando a chave user_id para contar as músicas favoritadas.
FROM user_data ud
    LEFT JOIN favorite_songs fs ON ud.user_id = fs.user_id
-- Realiza um GROUP BY pela faixa etária para agrupar as contagens por faixa etária.
GROUP BY faixa_etaria
-- Ordena os resultados com base na sequência das faixas etárias definidas na cláusula CASE.
ORDER BY
    CASE faixa_etaria
        WHEN 'Até 30 anos' THEN 1
        WHEN 'Entre 31 e 60 anos' THEN 2
        ELSE 3
    END;
