SELECT
    ud.user_name AS pessoa_usuaria,
    IF(YEAR(MAX(sp.playback_date)) >= 2021, 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM
    user_data ud
        INNER JOIN
    songs_playback sp ON ud.user_id = sp.user_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;
