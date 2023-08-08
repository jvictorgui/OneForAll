-- Mostra o nome das pessoas que ouviram músicas, junto com a quantidade de músicas que cada uma ouviu e o tempo total de reprodução em minutos.

SELECT
  ud.user_name AS pessoa_usuaria,  -- Pega o nome do usuário e chama de "pessoa_usuaria".
  COUNT(sp.song_id) AS musicas_ouvidas,  -- Conta quantas vezes cada música foi ouvida por cada usuário e chama de "musicas_ouvidas".
  ROUND(SUM(s.song_duration) / 60, 2) AS total_minutos  -- Soma a duração das músicas ouvidas por cada usuário e converte para minutos, arredondando para 2 casas decimais. Chama de "total_minutos".
  
-- De onde estamos buscando as informações.
FROM
  user_data ud  -- Pegamos os dados dos usuários e chamamos de "ud".
  
  -- Juntamos as tabelas songs_playback ( "sp") e songs ( "s") usando a coluna user_id.
  INNER JOIN songs_playback sp ON ud.user_id = sp.user_id
  INNER JOIN songs s ON sp.song_id = s.song_id

-- Agrupamos as informações por usuário
GROUP BY ud.user_name

-- Ordenamos os resultados pelo nome do usuário em ordem alfabética.
ORDER BY ud.user_name;
