DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans (
		id INT PRIMARY KEY AUTO_INCREMENT,
        name CHARACTER(100) NOT NULL,
        value DECIMAL(5,2) NOT NULL
) engine = InnoDB;

CREATE TABLE artist (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name CHARACTER(100) UNIQUE NOT NULL
) engine = InnoDB;

CREATE TABLE album (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name CHARACTER(100) NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artist (id),
    release_year YEAR NOT NULL
) engine = InnoDB;

CREATE TABLE music(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name CHARACTER(100) NOT NULL,
    album_id INT NOT NULL,
    duration_seconds INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album (id)
) engine = InnoDB;

CREATE TABLE user (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name CHARACTER(100) NOT NULL,
    age INT NOT NULL,
    plans_id INT NOT NULL,
    FOREIGN KEY (plans_id) REFERENCES plans (id),
    signature_date DATE
) engine = InnoDB;

CREATE TABLE followers (
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user (id),
    FOREIGN KEY (artist_id) REFERENCES artist (id),
    CONSTRAINT PRIMARY KEY  (user_id, artist_id)
) engine = InnoDB;

CREATE TABLE historic (
    music_id INT NOT NULL,
    user_id INT NOT NULL,
    reproduction_date DATETIME,
    FOREIGN KEY (music_id) REFERENCES music (id),
    FOREIGN KEY (user_id) REFERENCES user (id),
    CONSTRAINT PRIMARY KEY (music_id, user_id)
) engine = InnoDB;

INSERT INTO plans (name, value)
VALUE 
	('Gratuito', 0),
    ('Familiar', 7.99),
    ('Universitário', 5.99),
    ('Pessoal', 6.99);

INSERT INTO artist (name)
VALUE
	('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');
    
INSERT INTO album (name, artist_id, release_year)
VALUE
	('Renaissance', 1, 2022),
    ('Jazz', 2, 1978),
    ('Hot Space', 2, 1982),
    ('Falso Brilhante', 3, 1998),
    ('Vento de Maio', 3, 2001),
    ('QVVJFA?', 4, 2003),
    ('Somewhere Far Beyond', 5, 2007),
    ('I Put A Spell On You', 6, 2012);
    
INSERT INTO music (name, album_id, duration_seconds)
VALUE
	('Break My Soul', 1, 279),
    ("Virgo's Groove",1, 369),
    ('Alien Superstar', 1, 116),
    ("Don't Stop Me Now", 2, 203),
    ('Under Pressure', 3, 152),
    ('Como Nossos Pais', 4, 105),
    ('O Medo de Amar é o Medo de Ser Livre', 5, 207),
    ('Samba emParis', 6, 267),
    ("The Bard's Song", 7, 244),
    ('feeling Good', 8, 100);

INSERT INTO user (name, age, plans_id, signature_date)
VALUE
	('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
	('Ada Lovelace', 37, 2, '2017-12-30'),
	('Martin Fowler', 46, 2, '2017-01-17'),
	('Sandi Metz', 58, 2, '2018-04-29'),
	('Paulo Freire', 19, 3, '2018-02-14'),
	('Bell Hooks', 26,  3, '2018-01-05'),
	('Christopher Alexander', 85, 4, '2019-06-05'),
	('Judith Butler', 45, 4, '2020-05-13'),
	('Jorge Amado', 58, 4, '2017-02-17');
    
INSERT INTO followers (user_id, artist_id)
VALUE
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

INSERT INTO historic (user_id, music_id, reproduction_date)
VALUE
	(1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');