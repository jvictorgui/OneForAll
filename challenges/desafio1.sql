DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE if not exists SpotifyClone;
USE SpotifyClone;
CREATE TABLE artists (
artist_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
artist_name VARCHAR(100) NOT NULL
) engine = InnoDB; 

CREATE TABLE subscription_plans (
subscription_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
subscription_plan VARCHAR(100) NOT NULL,
subscription_price DECIMAL(10, 2) UNSIGNED NOT NULL
) engine = InnoDB; 

CREATE TABLE user_data (
  user_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
  user_name VARCHAR(100) NOT NULL,
  user_age INT UNSIGNED not NULL,
  subscription_id INT UNSIGNED not NULL,
  subscription_date DATE not NULL,
  FOREIGN KEY (subscription_id) REFERENCES subscription_plans(subscription_id)
) ENGINE = InnoDB;

CREATE TABLE albuns (
  albun_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
  albun_name VARCHAR(100) NOT NULL,
  release_year INT UNSIGNED,
  artist_id INT UNSIGNED,
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) ENGINE = InnoDB;

CREATE TABLE songs (
  song_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
  song_name VARCHAR(100) NOT NULL,
  song_duration INT UNSIGNED NOT NULL,
  albun_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (albun_id) REFERENCES albuns(albun_id)
) ENGINE = InnoDB;

-- CREATE TABLE following_relationships (
--   user_id INT UNSIGNED NOT NULL,
--   artist_id INT UNSIGNED  NOT NULL,
--   FOREIGN KEY (user_id) REFERENCES user_data(user_id),
--   FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
--   PRIMARY KEY (artist_id, user_id)
-- ) ENGINE = InnoDB;

-- CREATE TABLE songs_playback (
--   user_id INT UNSIGNED NOT NULL,
--   song_id INT UNSIGNED NOT NULL,
--   playback_date DATETIME NOT NULL,
--   FOREIGN KEY (user_id) REFERENCES user_data(user_id),
--   FOREIGN KEY (song_id) REFERENCES songs(song_id),
--   PRIMARY KEY(user_id, song_id)
-- ) ENGINE = InnoDB;

CREATE TABLE songs_playback (
  user_id INT UNSIGNED NOT NULL,
  song_id INT UNSIGNED NOT NULL,
  playback_date DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY (user_id, song_id, playback_date), 
  FOREIGN KEY (user_id) REFERENCES user_data(user_id),
  FOREIGN KEY (song_id) REFERENCES songs(song_id)
  
) ENGINE = InnoDB;

CREATE TABLE following_relationships (
  user_id INT UNSIGNED NOT NULL,
  artist_id INT UNSIGNED  NOT NULL,
  CONSTRAINT PRIMARY KEY (user_id, artist_id), 
  FOREIGN KEY (user_id) REFERENCES user_data(user_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) ENGINE = InnoDB;



-- Dados dos artistas
INSERT INTO artists (artist_id, artist_name) VALUES ('1', 'Beyoncé');
INSERT INTO artists (artist_id, artist_name) VALUES ('2', 'Queen');
INSERT INTO artists (artist_id, artist_name) VALUES ('3', 'Elis Regina');
INSERT INTO artists (artist_id, artist_name) VALUES ('4', 'Baco Exu do Blues');
INSERT INTO artists (artist_id, artist_name) VALUES ('5', 'Blind Guardian');
INSERT INTO artists (artist_id, artist_name) VALUES ('6', 'Nina Simone');
-- Dados dos planos
INSERT INTO subscription_plans (subscription_id, subscription_plan, subscription_price) VALUES ('1', 'gratuito', '0');
INSERT INTO subscription_plans (subscription_id, subscription_plan, subscription_price) VALUES ('2', 'familiar', '7.99');
INSERT INTO subscription_plans (subscription_id, subscription_plan, subscription_price) VALUES ('3', 'universitário', '5.99');
INSERT INTO subscription_plans (subscription_id, subscription_plan, subscription_price) VALUES ('4', 'pessoal', '6.99');
-- Dados dos usuarios
INSERT INTO user_data (user_id, user_name, user_age, subscription_id, subscription_date) VALUES (1, 'Barbara Liskov', '82', '1', '2019-10-20');
INSERT INTO user_data (user_id, user_name, user_age, subscription_id, subscription_date) VALUES (2, 'Robert Cecil Martin', '58', '1', '2017-01-06');
INSERT INTO user_data (user_id, user_name, user_age, subscription_id, subscription_date) VALUES (3, 'Ada Lovelace', '37', '2', '2017-12-30');
INSERT INTO user_data (user_id, user_name, user_age, subscription_id, subscription_date) VALUES (4, 'Martin Fowler', '46', '2', '2017-01-17');
INSERT INTO user_data (user_id, user_name, user_age, subscription_id, subscription_date) VALUES (5, 'Sandi Metz', '58', '2', '2018-04-29');
INSERT INTO user_data (user_id, user_name, user_age, subscription_id, subscription_date) VALUES (6, 'Paulo Freire', '19', '3', '2018-02-14');
INSERT INTO user_data (user_id, user_name, user_age, subscription_id, subscription_date) VALUES (7, 'Bell Hooks', '26', '3', '2018-01-05');
INSERT INTO user_data (user_id, user_name, user_age, subscription_id, subscription_date) VALUES (8, 'Christopher Alexander', '85', '4', '2019-06-05');
INSERT INTO user_data (user_id, user_name, user_age, subscription_id, subscription_date) VALUES (9, 'Judith Butler', '45', '4', '2020-05-13');
INSERT INTO user_data (user_id, user_name, user_age, subscription_id, subscription_date) VALUES (10, 'Jorge Amado', '58', '4', '2017-02-17');
-- Dados dos albuns
INSERT INTO albuns (albun_id, albun_name, release_year, artist_id) VALUES ('1', 'Renaissance', '2022', '1');
INSERT INTO albuns (albun_id, albun_name, release_year, artist_id) VALUES ('2', 'Jazz', '1978', '2');
INSERT INTO albuns (albun_id, albun_name, release_year, artist_id) VALUES ('3', 'Hot Space', '1982', '2');
INSERT INTO albuns (albun_id, albun_name, release_year, artist_id) VALUES ('4', 'Falso Brilhante', '1998', '3');
INSERT INTO albuns (albun_id, albun_name, release_year, artist_id) VALUES ('5', 'Vento de Maio', '2001', '3');
INSERT INTO albuns (albun_id, albun_name, release_year, artist_id) VALUES ('6', 'QVVJFA?', '2003', '4');
INSERT INTO albuns (albun_id, albun_name, release_year, artist_id) VALUES ('7', 'Somewhere Far Beyond', '2007', '5');
INSERT INTO albuns (albun_id, albun_name, release_year, artist_id) VALUES ('8', 'I Put A Spell On You', '2012', '6');
-- Dados das musicas
INSERT INTO songs (song_id, song_name, song_duration, albun_id) VALUES ('1', "BREAK MY SOUL", '279', '1');
INSERT INTO songs (song_id, song_name, song_duration, albun_id) VALUES ('2', "VIRGO'S GROOVE", '369', '1');
INSERT INTO songs (song_id, song_name, song_duration, albun_id) VALUES ('3', "ALIEN SUPERSTAR", '116', '1');
INSERT INTO songs (song_id, song_name, song_duration, albun_id) VALUES ('4', "Don't Stop Me Now", '203', '2');
INSERT INTO songs (song_id, song_name, song_duration, albun_id) VALUES ('5', "Under Pressure", '152', '3');
INSERT INTO songs (song_id, song_name, song_duration, albun_id) VALUES ('6', "Como Nossos Pais", '105', '4');
INSERT INTO songs (song_id, song_name, song_duration, albun_id) VALUES ('7', "O Medo de Amar é o Medo de Ser Livre", '207', '5');
INSERT INTO songs (song_id, song_name, song_duration, albun_id) VALUES ('8', "Samba em Paris", '267', '6');
INSERT INTO songs (song_id, song_name, song_duration, albun_id) VALUES ('9', "The Bard's Song", '244', '7');
INSERT INTO songs (song_id, song_name, song_duration, albun_id) VALUES ('10', "Feeling Good", '100', '8');
-- Dados seguidores
INSERT INTO following_relationships (user_id, artist_id) 
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
-- Dados de reprodução
INSERT INTO songs_playback (user_id, song_id, playback_date) VALUES ('1', '8', '2022-02-28 10:45:55');
INSERT INTO songs_playback (user_id, song_id, playback_date) VALUES ('1', '2', '2020-05-02 05:30:35');
INSERT INTO songs_playback (user_id, song_id, playback_date) VALUES ('1', '10', '2020-03-06 11:22:33');
INSERT INTO songs_playback (user_id, song_id, playback_date) VALUES ('2', '10', '2022-08-05 08:05:17');
INSERT INTO songs_playback (user_id, song_id, playback_date) VALUES ('2', '7', '2020-01-02 07:40:33');
INSERT INTO songs_playback (user_id, song_id, playback_date) VALUES ('3', '10', '2020-11-13 16:55:13');
INSERT INTO songs_playback (user_id, song_id, playback_date) VALUES ('3', '2', '2020-12-05 18:38:30');
INSERT INTO songs_playback (user_id, song_id, playback_date) VALUES ('4', '8', '2021-08-15 17:10:10');
INSERT INTO songs_playback (user_id, song_id, playback_date) VALUES ('5', '8', '2022-01-09 01:44:33');
INSERT INTO songs_playback (user_id, song_id, playback_date) VALUES ('5', '5', '2020-08-06 15:23:43');
INSERT INTO songs_playback (user_id, song_id, playback_date) VALUES ('6', '7', '2017-01-24 00:31:17');
INSERT INTO songs_playback (user_id, song_id, playback_date) VALUES ('6', '1', '2017-10-12 12:35:20');
INSERT INTO songs_playback (user_id, song_id, playback_date) VALUES ('7', '4', '2011-12-15 22:30:49');
INSERT INTO songs_playback (user_id, song_id, playback_date) VALUES ('8', '4', '2012-03-17 14:56:41');
INSERT INTO songs_playback (user_id, song_id, playback_date) VALUES ('9', '9', '2022-02-24 21:14:22');
INSERT INTO songs_playback (user_id, song_id, playback_date) VALUES ('10', '3', '2015-12-13 08:30:22');

