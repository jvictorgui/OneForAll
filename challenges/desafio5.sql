SELECT
    s.song_name AS cancao,
    COUNT(sp.song_id) AS reproducoes
FROM
    songs s
        INNER JOIN
    songs_playback sp ON s.song_id = sp.song_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
