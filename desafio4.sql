SELECT usuario, IF (MAX(YEAR(data_reproducao)) > '2020', 'Usuário ativo', 'Usuário inativo') AS status_usuario FROM SpotifyClone.reproducao
INNER JOIN SpotifyClone.usuario ON id_usuario=usuario_id_usuario
GROUP BY usuario
ORDER BY usuario;
