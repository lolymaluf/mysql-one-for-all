SELECT usr.usuario_nome AS usuario,
IF(YEAR(MAX(hist.data_reprodução)) > 2020,
'Usuário ativo',
'Usuário inativo')
AS status_usuario
FROM SpotifyClone.usuarios AS usr
JOIN SpotifyClone.historico AS hist
ON usr.usuario_id = hist.usuario_id
GROUP BY usr.usuario_id
ORDER BY usr.usuario_nome;