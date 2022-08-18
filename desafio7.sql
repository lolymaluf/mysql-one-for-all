SELECT art.artista_nome AS artista,
alb.album_name AS album,
COUNT(seg.usuario_id) AS seguidores
FROM SpotifyClone.seguindo AS seg
JOIN SpotifyClone.artistas AS art
ON seg.artista_id = art.artista_id
JOIN SpotifyClone.albuns AS alb
ON alb.artista_id = art.artista_id
GROUP BY art.artista_nome, alb.album_name
ORDER BY seguidores DESC, artista, album;