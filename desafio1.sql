DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.planos(
      plano_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
      tipo_plano VARCHAR(20) NOT NULL,
      valor_plano DECIMAL(4,2) NOT NULL,
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.usuarios(
      usuario_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
      usuario_nome VARCHAR(45) NOT NULL,
      idade INTEGER NOT NULL,
      plano_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
      data_assinatura DATE NOT NULL,
      FOREIGN KEY (plano_id) REFERENCES SpotifyClone.planos(plano_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.artistas(
      artista_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
      artista_nome VARCHAR(30) NOT NULL,
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.albuns(
      album_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
      album_name VARCHAR(50) NOT NULL,
      ano_lancamento YEAR NOT NULL,
      artista_id INTEGER NOT NULL,
      FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(artista_id),
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.musicas(
      musica_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
      musica_nome VARCHAR(50) NOT NULL,
      duração_musica INTEGER NOT NULL,
      album_id INTEGER NOT NULL,
      FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns(album_id),
  ) engine = InnoDB;

      CREATE TABLE SpotifyClone.seguindo(
        id_usuario INTEGER NOT NULL,
        id_artista INTEGER NOT NULL,
        PRIMARY KEY (id_usuario, id_artista),
        FOREIGN KEY (id_usuario) REFERENCES SpotifyClone.usuarios(usuario_id),
        FOREIGN KEY (id_artista) REFERENCES SpotifyClone.artistas(artista_id),
  ) engine = InnoDB;

      CREATE TABLE SpotifyClone.historico(
        usuario_id INTEGER NOT NULL,
        canção_id INTEGER NOT NULL,
        data_reprodução DATETIME NOT NULL,
        PRIMARY KEY (usuario_id, canção_id),
        FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios(usuario_id),
        FOREIGN KEY (canção_id) REFERENCES SpotifyClone.musicas(musica_id),
  ) engine = InnoDB;


  INSERT INTO SpotifyClone.planos (plano_id, tipo_plano, valor_plano)
  VALUES
    (1, 'gratuito', 0.00),
    (2, 'familiar', 7.99),
    (3, 'universitario', 5.99),
    (4, 'pessoal', 6.99);

  INSERT INTO SpotifyClone.usuarios (usuario_id, usuario_nome, plano_id, data_assinatura)
  VALUES
    (1, 'Barbara Liskov', 1, '2019-10-20'),
    (2, 'Robert Cecil Martin', 1, '2017-01-06'),
    (3, 'Ada Lovelace', 2, '2017-12-30'),
    (4, 'Martin Fowler', 2, '2017-01-17'),
    (5, 'Sandi Metz', 2, '2018-04-29'),
    (6, 'Paulo Freire', 3, '2018-02-14'),
    (7, 'Bell Hooks', 3, '2018-01-05'),
    (8, 'Christopher Alexander', 4, '2019-06-05'),
    (9, 'Judith Butler', 4, '2020-05-13'),
    (10, 'Jorge Amado', 4, '2017-02-17');

      INSERT INTO SpotifyClone.artistas (artista_id, artista_nome)
  VALUES
    (1, 'Beyoncé'),
    (2, 'Queen'),
    (3, 'Elis Regina'),
    (4, 'Baco Exu do Blues'),
    (5, 'Blind Guardian'),
    (6, 'Nina Simone');

      INSERT INTO SpotifyClone.albuns (album_id, album_name, ano_lancamento, artista_id)
  VALUES
    (1, 'Renaissance', 2022, 1),
    (2, 'Jazz', 1978, 2),
    (3, 'Hot Space', 1982, 2),
    (4, 'Falso Brilhante', 1998, 3),
    (5, 'Vento de Maio', 2001, 3),
    (6, 'QVVJFA?', 2003, 4),
    (7, 'Somewhere Far Beyond', 2007, 5),
    (8, 'Put A Spell On You', 2012, 6);

      INSERT INTO SpotifyClone.musicas (musica_id, musica_nome, duração_musica, album_id)
  VALUES
    (1, 'BREAK MY SOUL', 279, 1),
    (2, 'VIRGO’S GROOVE', 369, 1),
    (3, 'ALIEN SUPERSTAR', 116, 1),
    (4, 'Don’t Stop Me Now', 203, 2),
    (5, 'Under Pressure', 152, 2),
    (6, 'Como Nossos Pais', 105, 3),
    (7, 'O Medo de Amar é o Medo de Ser Livre', 207, 3),
    (8, 'Samba em Paris', 267, 4),
    (9, 'The Bard’s Song', 244, 5),
    (10, 'Feeling Good', 100, 6);


      INSERT INTO SpotifyClone.seguindo (id_usuario, id_artista)
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

      INSERT INTO SpotifyClone.historico (usuario_id, canção_id, data_reprodução)
  VALUES
    (1, 8, "2022-02-28 10:45:55"),
    (1, 2, "2020-05-02 05:30:35"),
    (1, 10, "2020-03-06 11:22:33"),
    (2, 10, "2022-08-05 08:05:17"),
    (2, 7, "2020-01-02 07:40:33"),
    (3, 10, "2020-11-13 16:55:13"),
    (3, 2, "2020-12-05 18:38:30"),
    (4, 8, "2021-08-15 17:10:10"),
    (5, 8, "2022-01-09 01:44:33"),
    (5, 5, "2020-08-06 15:23:43"),
    (6, 7, "2017-01-24 00:31:17"),
    (6, 1, "2017-10-12 12:35:20"),
    (7, 4, "2011-12-15 22:30:49"),
    (8, 4, "2012-03-17 14:56:41"),
    (9, 9, "2022-02-24 21:14:22"),
    (10, 3, "2015-12-13 08:30:22"); 