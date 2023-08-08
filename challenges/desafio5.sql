-- Seleciona o nome da música (canção) e conta o número de reproduções dessa música.
SELECT
    s.song_name AS cancao,
    COUNT(sp.song_id) AS reproducoes
FROM
    songs s
        INNER JOIN
    songs_playback sp ON s.song_id = sp.song_id
-- Agrupa os resultados pelo nome da música (canção).
GROUP BY cancao
-- Ordena os resultados em ordem decrescente pelo número de reproduções e, em caso de empate, em ordem alfabética pelo nome da música.
ORDER BY reproducoes DESC, cancao
-- Limita o resultado a apenas duas linhas (top 2).
LIMIT 2;
