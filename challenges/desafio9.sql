-- Quantidade de músicas no histórico de reprodução de Barbara Liskov
SELECT
    COUNT(*) AS musicas_no_historico
FROM
    user_data us
        INNER JOIN
    songs_playback sp ON us.user_id = sp.user_id
WHERE
    us.user_name = 'Barbara Liskov';
