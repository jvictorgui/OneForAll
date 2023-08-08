-- Álbuns produzidos por Elis Regina
-- Seleciona o nome da pessoa artista (Elis Regina) e o nome do álbum.
SELECT
    a.artist_name AS artista,
    alb.albun_name AS album
-- Faz um INNER JOIN com as tabelas artists e albuns usando a chave artist_id para obter os álbuns produzidos por Elis Regina.
FROM
    artists a
        INNER JOIN
    albuns alb ON a.artist_id = alb.artist_id
-- Utiliza a cláusula WHERE para filtrar os resultados apenas para a pessoa artista Elis Regina.
WHERE
    a.artist_name = 'Elis Regina'
-- Ordena os resultados pelo nome do álbum em ordem alfabética.
ORDER BY
    alb.albun_name;
