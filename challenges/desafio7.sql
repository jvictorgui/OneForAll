--  Álbuns produzidos por cada pessoa artista
-- Seleciona o nome da pessoa artista, o nome do álbum e a contagem de pessoas seguidoras para cada álbum.
SELECT
    a.artist_name AS artista,
    alb.albun_name AS album,
    -- Utiliza a função de agregação COUNT para contar o número de ocorrências de user_id, representando as pessoas seguidoras.
    COUNT(fr.user_id) AS pessoas_seguidoras
-- Faz um LEFT JOIN com as tabelas artists, albuns e following_relationships para obter as informações necessárias.
FROM
    artists a
        LEFT JOIN
    albuns alb ON a.artist_id = alb.artist_id
        LEFT JOIN
    following_relationships fr ON a.artist_id = fr.artist_id
-- Agrupa os resultados pelo nome da pessoa artista e pelo nome do álbum.
GROUP BY
    a.artist_name,
    alb.albun_name
-- Ordena os resultados em ordem decrescente baseando-se na contagem de pessoas seguidoras, e em caso de empate, pelo nome da pessoa artista e pelo nome do álbum.
ORDER BY
    COUNT(fr.user_id) DESC,
    a.artist_name,
    alb.albun_name;
