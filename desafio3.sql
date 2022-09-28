SELECT usuario, COUNT(id_usuario) AS qt_de_musicas_ouvidas, ROUND(SUM(cancoes.duracao_segundos / 60), 2) AS total_minutos FROM SpotifyClone.usuario
INNER JOIN SpotifyClone.reproducao ON usuario_id_usuario=id_usuario
INNER JOIN SpotifyClone.cancoes ON cancoes_id_cancoes=id_cancoes
GROUP BY usuario
ORDER BY usuario;