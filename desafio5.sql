SELECT msc.musica_nome AS cancao,
COUNT(hist.musica_id) AS reproducoes
FROM SpotifyClone.musicas AS msc
JOIN SpotifyClone.historico AS hist 
ON hist.musica_id = msc.musica_id
GROUP BY msc.musica_id
ORDER BY reproducoes DESC, msc.musica_nome
LIMIT 2;