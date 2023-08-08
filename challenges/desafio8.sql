-- Desafio 8 - Álbuns produzidos por Elis Regina
SELECT
    a.artist_name AS artista,
    alb.albun_name AS album
FROM
    artists a
        INNER JOIN
    albuns alb ON a.artist_id = alb.artist_id
WHERE
    a.artist_name = 'Elis Regina'
ORDER BY
    alb.albun_name;
