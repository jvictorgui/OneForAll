-- Top 3 de álbuns com as músicas mais favoritadas
-- Seleciona o nome do álbum (alias album) e a contagem total de músicas favoritadas (alias favoritadas).
SELECT a.albun_name AS album, COUNT(fs.song_id) AS favoritadas
-- Faz um INNER JOIN entre as tabelas albuns e songs usando a chave albun_id para relacionar os álbuns com as músicas.
-- Também faz um LEFT JOIN com a tabela favorite_songs usando a chave song_id para contar as músicas favoritadas.
FROM albuns a
    INNER JOIN songs s ON a.albun_id = s.albun_id
    LEFT JOIN favorite_songs fs ON s.song_id = fs.song_id
-- Realiza um GROUP BY pelo nome do álbum para agrupar as músicas pelo álbum correspondente.
GROUP BY album
-- Ordena os resultados de forma decrescente pelo número de músicas favoritadas e, em caso de empate, pelo nome do álbum em ordem alfabética.
ORDER BY favoritadas DESC, album
-- Limita o resultado a apenas três linhas, correspondendo aos três álbuns mais favoritados.
LIMIT 3;
