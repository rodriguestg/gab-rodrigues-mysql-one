SELECT cancoes AS cancao, COUNT(cancoes_id_cancoes) AS reproducoes FROM SpotifyClone.cancoes
INNER JOIN SpotifyClone.reproducao ON cancoes_id_cancoes=id_cancoes
GROUP BY cancoes
ORDER BY reproducoes LIMIT 10 OFFSET 7;
