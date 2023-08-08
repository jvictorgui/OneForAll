-- Seleciona o nome da pessoa usuária e define o status com base na data mais recente de reprodução.
SELECT
    ud.user_name AS pessoa_usuaria,
    IF(YEAR(MAX(sp.playback_date)) >= 2021, 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM
    user_data ud
        INNER JOIN
    songs_playback sp ON ud.user_id = sp.user_id
-- Agrupa os resultados pelo nome da pessoa usuária.
GROUP BY pessoa_usuaria
-- Ordena os resultados em ordem alfabética pelo nome da pessoa usuária.
ORDER BY pessoa_usuaria;
