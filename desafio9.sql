SELECT COUNT(hist.musica_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.historico AS hist
JOIN SpotifyClone.usuarios AS usr
ON usr.usuario_id = hist.usuario_id
WHERE usr.usuario_nome = 'Barbara Liskov';