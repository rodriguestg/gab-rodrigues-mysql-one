DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  -- -----------------------------------------------------
  -- Table `SpotifyClone`.`plano`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plano` (
  `id_plano` INT NOT NULL AUTO_INCREMENT,
  `plano` VARCHAR(45) NOT NULL,
  `valor_plano` VARCHAR(45) NULL,
  PRIMARY KEY (`id_plano`),
  UNIQUE INDEX `plano_UNIQUE` (`plano` ASC) VISIBLE
  ) ENGINE = InnoDB;
  

  -- -----------------------------------------------------
  -- Table `SpotifyClone`.`usuario`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `idade` VARCHAR(45) NULL,
  `data_assinatura` VARCHAR(45) NULL,
  `plano_id_plano` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_usuario_plano_idx` (`plano_id_plano` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_plano`
    FOREIGN KEY (`plano_id_plano`)
    REFERENCES `SpotifyClone`.`plano` (`id_plano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ) ENGINE = InnoDB;


  -- -----------------------------------------------------
  -- Table `SpotifyClone`.`artista`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artista` (
  `id_artista` INT NOT NULL AUTO_INCREMENT,
  `artista` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_artista`),
  UNIQUE INDEX `artista_UNIQUE` (`artista` ASC) VISIBLE
  ) ENGINE = InnoDB;


  -- -----------------------------------------------------
  -- Table `SpotifyClone`.`album`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `SpotifyClone`.`album` (
  `id_album` INT NOT NULL AUTO_INCREMENT,
  `album` VARCHAR(45) NOT NULL,
  `artista_id_artista` INT NOT NULL,
  PRIMARY KEY (`id_album`),
  UNIQUE INDEX `album_UNIQUE` (`album` ASC) VISIBLE,
  INDEX `fk_album_artista1_idx` (`artista_id_artista` ASC) VISIBLE,
  CONSTRAINT `fk_album_artista1`
    FOREIGN KEY (`artista_id_artista`)
    REFERENCES `SpotifyClone`.`artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ) ENGINE = InnoDB;


  -- -----------------------------------------------------
  -- Table `SpotifyClone`.`cancoes`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `SpotifyClone`.`cancoes` (
  `id_cancoes` INT NOT NULL AUTO_INCREMENT,
  `cancoes` VARCHAR(45) NOT NULL,
  `duracao_segundos` VARCHAR(45) NULL,
  `ano_lancamento` VARCHAR(45) NULL,
  `album_id_album` INT NOT NULL,
  PRIMARY KEY (`id_cancoes`),
  INDEX `fk_cancoes_album1_idx` (`album_id_album` ASC) VISIBLE,
  CONSTRAINT `fk_cancoes_album1`
    FOREIGN KEY (`album_id_album`)
    REFERENCES `SpotifyClone`.`album` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ) ENGINE = InnoDB;


  -- -----------------------------------------------------
  -- Table `SpotifyClone`.`reproducao`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `SpotifyClone`.`reproducao` (
  `id_reproducao` INT NOT NULL AUTO_INCREMENT,
  `data_reproducao` VARCHAR(45) NULL,
  `cancoes_id_cancoes` INT NOT NULL,
  `usuario_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_reproducao`, `usuario_id_usuario`),
  INDEX `fk_reproducao_cancoes1_idx` (`cancoes_id_cancoes` ASC) VISIBLE,
  INDEX `fk_reproducao_usuario1_idx` (`usuario_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_reproducao_cancoes1`
    FOREIGN KEY (`cancoes_id_cancoes`)
    REFERENCES `SpotifyClone`.`cancoes` (`id_cancoes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reproducao_usuario1`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `SpotifyClone`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ) ENGINE = InnoDB;


  -- -----------------------------------------------------
  -- Table `SpotifyClone`.`seguindo_artistas`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguindo_artistas` (
  `id_seguindo_artistas` INT NOT NULL,
  `usuario_id_usuario` INT NOT NULL,
  `artista_id_artista` INT NOT NULL,
  PRIMARY KEY (`id_seguindo_artistas`),
  INDEX `fk_seguindo_artistas_usuario1_idx` (`usuario_id_usuario` ASC) VISIBLE,
  INDEX `fk_seguindo_artistas_artista1_idx` (`artista_id_artista` ASC) VISIBLE,
  CONSTRAINT `fk_seguindo_artistas_usuario1`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `SpotifyClone`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seguindo_artistas_artista1`
    FOREIGN KEY (`artista_id_artista`)
    REFERENCES `SpotifyClone`.`artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

  INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
  VALUES
    ('exemplo de dados 1', 'exemplo de dados A'),
    ('exemplo de dados 2', 'exemplo de dados B'),
    ('exemplo de dados 3', 'exemplo de dados C');

  INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
  VALUES
    ('exemplo de dados 1', 'exemplo de dados X'),
    ('exemplo de dados 2', 'exemplo de dados Y');
