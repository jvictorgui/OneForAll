SELECT
  ud.user_name AS pessoa_usuaria,
  COUNT(sp.song_id) AS musicas_ouvidas,
  ROUND(SUM(s.song_duration) / 60, 2) AS total_minutos
FROM
  user_data ud
INNER JOIN
  songs_playback sp ON ud.user_id = sp.user_id
INNER JOIN
  songs s ON sp.song_id = s.song_id
GROUP BY
  ud.user_name
ORDER BY
  ud.user_name;
