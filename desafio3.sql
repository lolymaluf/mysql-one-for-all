SELECT usr.usuario_nome AS usuario,COUNT(hist.musica_id)AS qt_de_musicas_ouvidas,
ROUND(SUM(msc.tempo_musica/60),2) AS total_minutos 
FROM SpotifyClone.usuarios AS usr 
JOIN SpotifyClone.historico AS hist
ON usr.usuario_id = hist.usuario_id 
JOIN SpotifyClone.musicas AS msc 
ON hist.musica_id = msc.musica_id
GROUP BY usr.usuario_nome
ORDER BY usr.usuario_nome;