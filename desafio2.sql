SELECT COUNT(id_cancoes) AS cancoes, COUNT(DISTINCT id_artista) AS artistas, COUNT(DISTINCT id_album) AS albuns FROM SpotifyClone.cancoes
INNER JOIN SpotifyClone.album ON album_id_album=id_album
INNER JOIN SpotifyClone.artista ON artista_id_artista=id_artista;
