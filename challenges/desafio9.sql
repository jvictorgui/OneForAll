-- Quantidade de músicas no histórico de reprodução de Barbara Liskov
-- Seleciona a contagem total de músicas no histórico de reprodução.
SELECT
    COUNT(*) AS musicas_no_historico
-- Faz um INNER JOIN com as tabelas user_data e songs_playback usando a chave user_id para obter o histórico de reprodução de Barbara Liskov.
FROM
    user_data us
        INNER JOIN
    songs_playback sp ON us.user_id = sp.user_id
-- Utiliza a cláusula WHERE para filtrar os resultados apenas para a pessoa usuária Barbara Liskov.
WHERE
    us.user_name = 'Barbara Liskov';
