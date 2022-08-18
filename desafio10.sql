SELECT
msc.musica_nome AS nome,
COUNT(hist.usuario_id) AS reproducoes
FROM SpotifyClone.historico AS hist
JOIN SpotifyClone.usuarios AS usr
ON usr.usuario_id = hist.usuario_id
JOIN SpotifyClone.musicas AS msc
ON msc.musica_id = hist.musica_id
WHERE usr.plano_id IN (1, 4)
GROUP BY msc.musica_nome
ORDER BY msc.musica_nome;