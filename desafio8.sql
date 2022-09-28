SELECT artista, album FROM SpotifyClone.album
INNER JOIN SpotifyClone.artista ON album.artista_id_artista=3 AND artista = 'Elis Regina'
GROUP BY artista, album;
