-- Desafio 7 - Álbuns produzidos por cada pessoa artista
SELECT
    a.artist_name AS artista,
    alb.albun_name AS album,
    COUNT(fr.user_id) AS pessoas_seguidoras
FROM
    artists a
        LEFT JOIN
    albuns alb ON a.artist_id = alb.artist_id
        LEFT JOIN
    following_relationships fr ON a.artist_id = fr.artist_id
GROUP BY
    a.artist_name,
    alb.albun_name
ORDER BY
    COUNT(fr.user_id) DESC,
    a.artist_name,
    alb.albun_name;
