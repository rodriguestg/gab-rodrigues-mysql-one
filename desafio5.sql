SELECT cancoes AS cancao, COUNT(cancoes_id_cancoes) AS reproducoes FROM SpotifyClone.cancoes
INNER JOIN SpotifyClone.reproducao ON cancoes_id_cancoes=id_cancoes
INNER JOIN SpotifyClone.artista ON cancoes.artista_id_artista=id_artista
GROUP BY cancoes
ORDER BY reproducoes DESC LIMIT 2;
