SELECT 
art.artista_nome AS artista,
alb.album_name AS album
FROM SpotifyClone.artistas AS art
JOIN SpotifyClone.albuns AS alb
ON art.artista_id = alb.artista_id
WHERE art.artista_nome = 'Elis Regina'
ORDER BY alb.album_name