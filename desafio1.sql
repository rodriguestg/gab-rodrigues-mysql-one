  DROP database IF EXISTS `SpotifyClone` ;
  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  -- -----------------------------------------------------
  -- Table `SpotifyClone`.`plano`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plano` (
  `id_plano` INT AUTO_INCREMENT PRIMARY KEY,
  `plano` VARCHAR(45) UNIQUE NOT NULL,
  `valor_plano` DECIMAL(5,2) NOT NULL
  ) ENGINE = InnoDB;
  
  -- -----------------------------------------------------
  -- Table `SpotifyClone`.`usuario`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `usuario` VARCHAR(45) NOT NULL,
  `idade` TINYINT NOT NULL,
  `data_assinatura` TIMESTAMP  NULL,
  `plano_id_plano` INT NOT NULL,
    FOREIGN KEY (`plano_id_plano`)
      REFERENCES `SpotifyClone`.`plano` (`id_plano`)
    ) ENGINE = InnoDB;

  -- -----------------------------------------------------
  -- Table `SpotifyClone`.`artista`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artista` (
  `id_artista` INT AUTO_INCREMENT PRIMARY KEY,
  `artista` VARCHAR(45) NOT NULL UNIQUE
  ) ENGINE = InnoDB;

  -- -----------------------------------------------------
  -- Table `SpotifyClone`.`album`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `SpotifyClone`.`album` (
  `id_album` INT AUTO_INCREMENT PRIMARY KEY,
  `album` VARCHAR(45) NOT NULL UNIQUE,
  `artista_id_artista` INT NOT NULL,
    FOREIGN KEY (`artista_id_artista`)
      REFERENCES `SpotifyClone`.`artista` (`id_artista`)
    ) ENGINE = InnoDB;


  -- -----------------------------------------------------
  -- Table `SpotifyClone`.`cancoes`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `SpotifyClone`.`cancoes` (
  `id_cancoes` INT AUTO_INCREMENT PRIMARY KEY,
  `cancoes` VARCHAR(45) NOT NULL UNIQUE,
  `duracao_segundos` INT,
  `ano_lancamento` YEAR,
  `album_id_album` INT NOT NULL,
  `artista_id_artista` INT NOT NULL,
	FOREIGN KEY (`artista_id_artista`)
	  REFERENCES `SpotifyClone`.`artista` (`id_artista`),
    FOREIGN KEY (`album_id_album`)
      REFERENCES `SpotifyClone`.`album` (`id_album`)
    ) ENGINE = InnoDB;

  -- -----------------------------------------------------
  -- Table `SpotifyClone`.`reproducao`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `SpotifyClone`.`reproducao` (
  `data_reproducao` DATETIME NOT NULL,
  `cancoes_id_cancoes` INT,
  `usuario_id_usuario` INT NOT NULL,
  CONSTRAINT `id_reproducao` PRIMARY KEY (`cancoes_id_cancoes`, `usuario_id_usuario`),
    FOREIGN KEY (`cancoes_id_cancoes`)
      REFERENCES `SpotifyClone`.`cancoes` (`id_cancoes`),
    FOREIGN KEY (`usuario_id_usuario`)
      REFERENCES `SpotifyClone`.`usuario` (`id_usuario`)
    ) ENGINE = InnoDB;

  -- -----------------------------------------------------
  -- Table `SpotifyClone`.`seguindo_artistas`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguindo_artistas` (
  `usuario_id_usuario` INT NOT NULL,
  `artista_id_artista` INT,
  CONSTRAINT `id_seguindo_artistas` PRIMARY KEY (`artista_id_artista`, `usuario_id_usuario`),
    FOREIGN KEY (`usuario_id_usuario`)
      REFERENCES `SpotifyClone`.`usuario` (`id_usuario`),
    FOREIGN KEY (`artista_id_artista`)
      REFERENCES `SpotifyClone`.`artista` (`id_artista`)
    ) ENGINE = InnoDB;

  INSERT INTO SpotifyClone.plano (plano, valor_plano)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);


  INSERT INTO SpotifyClone.usuario (usuario, idade, data_assinatura, plano_id_plano)
  VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-01-06', 1),
    ('Ada Lovelace', 37, '2017-12-30', 2),
    ('Martin Fowler', 46, '2017-01-17', 2),
    ('Sandi Metz', 58, '2018-04-29', 2),
    ('Paulo Freire', 19, '2018-02-14', 3),
    ('Bell Hooks', 26, '2018-01-05', 3),
    ('Christopher Alexander', 85, '2019-06-05', 4),
    ('Judith Butler', 45, '2020-05-13', 4),
    ('Jorge Amado', 58, '2017-02-17', 4);

  INSERT INTO SpotifyClone.artista (artista)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.album (album, artista_id_artista)
  VALUES
    ('Renaissance', 1),
    ('Jazz', 2),
    ('Hot Space', 2),
    ('Falso Brilhante', 3),
    ('Vento de Maio', 3),
    ('QVVJFA?', 4),
    ('Somewhere Far Beyond', 5),
    ('I Put A Spell On You', 6);

  INSERT INTO SpotifyClone.cancoes (cancoes, duracao_segundos, ano_lancamento, artista_id_artista, album_id_album)
  VALUES
    ('BREAK MY SOUL', 279, 2022, 1, 1),
    ('VIRGO’S GROOVE', 369, 2022, 1, 1),
    ('ALIEN SUPERSTAR', 116, 2022, 1, 1),
    ('Don’t Stop Me Now', 203, 1978, 2, 2),
    ('Under Pressure', 152, 1982, 2, 3),
    ('Como Nossos Pais', 105, 1998, 3, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 2001, 3, 5),
    ('Samba em Paris', 267, 2003, 4, 6),
    ('The Bard’s Song', 244, 2007, 5, 7),
    ('Feeling Good', 100, 2012, 6, 8);
  
  INSERT INTO SpotifyClone.reproducao (data_reproducao, cancoes_id_cancoes, usuario_id_usuario)
  VALUES
    ('2022-02-28 10:45:55', 8, 1),
    ('2020-05-02 05:30:35', 2, 1),
    ('2020-03-06 11:22:33', 10, 1),
    ('2022-08-05 08:05:17', 10, 2),
    ('2020-01-02 07:40:33', 7, 2),
    ('2020-11-13 16:55:13', 10, 3),
    ('2020-12-05 18:38:30', 2, 3),
    ('2021-08-15 17:10:10', 8, 4),
    ('2022-01-09 01:44:33', 8, 5),
    ('2022-01-09 01:44:33', 5, 5),
    ('2017-01-24 00:31:17', 7, 6),
    ('2017-10-12 12:35:20', 1, 6),
    ('2011-12-15 22:30:49', 4, 7),
    ('2012-03-17 14:56:41', 4, 8),
    ('2022-02-24 21:14:22', 9, 9),
    ('2015-12-13 08:30:22', 3, 10);

  INSERT INTO SpotifyClone.seguindo_artistas (usuario_id_usuario, artista_id_artista)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);
