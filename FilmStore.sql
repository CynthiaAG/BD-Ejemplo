drop database if exists filmStore;

CREATE DATABASE filmStore charset='latin1' collate='latin1_spanish_ci';

USE filmStore;


CREATE TABLE  clientes (
 dniCliente CHAR(9) NOT NULL,
 nombre VARCHAR(40) NOT NULL,
 direccion VARCHAR(40) NULL,
 municipio VARCHAR(40) NULL DEFAULT 'Las Palmas',
 codigoPostal INT NULL,
 fechaNac DATE NULL,
 primary key(dniCliente)
);



CREATE TABLE directores (
 codDirector int NOT NULL auto_increment primary key,
 nombre VARCHAR(40) NOT NULL,
 fechaNac DATE NULL);

CREATE TABLE peliculas (
 codPelicula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(40) NOT NULL,
 fechaAlta DATE NULL,
 codDirector int,
 stock TINYINT NULL,
 precio DOUBLE NOT NULL check(precio<=999.99),
 FOREIGN KEY (codDirector) REFERENCES directores(codDirector));

CREATE TABLE compras (
 codPelicula INT NOT NULL,
 dniCliente CHAR(9) NOT NULL,
 fechaCompra DATETIME NOT NULL,
 PRIMARY KEY (codPelicula, dniCliente, fechaCompra),
 FOREIGN KEY (codPelicula) REFERENCES peliculas (codPelicula)
	on delete restrict
	on update cascade,
  FOREIGN KEY(dniCliente) REFERENCES clientes(dniCliente)
	on update cascade
	on delete cascade);

INSERT INTO clientes VALUES ('78535540Q', 'Cynthia', 'C/Ana Luisa Benítez, 15' , 'Las Palmas de Gran Canaria' , '35014', '1995-11-29');
INSERT INTO clientes VALUES ('43535545C', 'Manuel', null , 'Telde' , '35200', '1985-10-01');
INSERT INTO clientes VALUES ('45525540A', 'Raquel', 'C/Los Almendros, 15' , 'Agüimes' , '35118', '2001-02-02');
INSERT INTO clientes VALUES ('48532544T', 'Kiko', 'C/Los Matorrales, 15' , 'Las Palmas de Gran Canaria' , '35012', '1965-07-07');
INSERT INTO clientes VALUES ('56987412X', 'Paco', 'C/La Calva, 25' , 'Arucas' , '35412', '1959-08-25');

INSERT INTO directores VALUES (default, 'Martin Scorsese', '1942-11-17');
INSERT INTO directores VALUES (default,'Quentin Tarantino', '1963-03-27');
INSERT INTO directores VALUES (default,'Francis Ford Coppola', '1939-04-07');
INSERT INTO directores VALUES (default,'George Lucas', '1944-05-14');
INSERT INTO directores VALUES (default,'Tim Burton', '1958-08-25');
INSERT INTO directores VALUES (default,'Chris Columbus', '1958-09-10');
INSERT INTO directores VALUES (default,'Lana Wachowski', '1965-06-21');
INSERT INTO directores VALUES (default,'Isabel Coixet', '1960-04-09');

INSERT INTO peliculas VALUES (default, 'El Irlandés', '2020-04-22', 1 , 10 , 31.95);
INSERT INTO peliculas VALUES (default, 'Shutter Island', '2011-06-14', 1 , 5 , 28.65);
INSERT INTO peliculas VALUES (default, 'El Lobo de Wall Street', '2014-08-01', 1, 15 , 20.99);
INSERT INTO peliculas VALUES (default, 'Gangs of New York', '2004-03-21', 1, 12, 19.95);
INSERT INTO peliculas VALUES (default, 'Pulp Fiction', '1995-06-02', 2 , 4 , 35.95);
INSERT INTO peliculas VALUES (default, 'Kill Bill Vol. 1', '2004-10-02', 2 , 7 , 31.99);
INSERT INTO peliculas VALUES (default, 'Kill Bill Vol. 2', '2005-12-23', 2 , 6 , 29.95);
INSERT INTO peliculas VALUES (default, 'Death Proof', '2007-02-23', 2 , 2, 40.55);
INSERT INTO peliculas VALUES (default, 'El Padrino', '1990-01-23', 3 , 2, 45.55);
INSERT INTO peliculas VALUES (default, 'El Padrino II ', '1995-08-23', 3 , 1, 40.55);
INSERT INTO peliculas VALUES (default, 'Star Wars: Episodio IV', '1990-10-25', 4 , 2, 39.95);
INSERT INTO peliculas VALUES (default, 'Star Wars: Episodio V', '1990-10-25', 4 , 1, 42.95);
INSERT INTO peliculas VALUES (default, 'Star Wars: Episodio VI', '1990-10-25', 4 , 2, 39.80);
INSERT INTO peliculas VALUES (default, 'Jurassic Park', '1994-10-12', 4 , 9, 39.95);
INSERT INTO peliculas VALUES (default, 'Pesadillas antes de Navidad', '1994-12-12', 5 , 6, 38.95);
INSERT INTO peliculas VALUES (default, 'Beetlejuice', '1990-09-12', 5 , 3, 29.95);
INSERT INTO peliculas VALUES (default, 'Big Fish', '2004-12-02', 5 , 2, 37.95);
INSERT INTO peliculas VALUES (default, 'Alicia en el País de las Maravillas', '2011-08-12', 5 , 4, 27.95);
INSERT INTO peliculas VALUES (default, 'Solo en Casa', '1991-11-12', 6 , 10, 29.95);
INSERT INTO peliculas VALUES (default, 'Señora Doubtfire', '1995-08-06', 6 , 7, 20.95);
INSERT INTO peliculas VALUES (default, 'Solo en Casa 2', '1993-12-12', 6 , 12, 31.95);
INSERT INTO peliculas VALUES (default, 'Harry Potter y la Piedra Filosofal', '2002-03-21', 6 , 15 , 25.55);
INSERT INTO peliculas VALUES (default, 'Harry Potter y la Cámara Secreta', '2003-02-01', 6 , 11, 29.95);
INSERT INTO peliculas VALUES (default, 'Percy Jackson y el Ladrón del Rayo', '2011-05-28', 6 , 10, 29.95);
INSERT INTO peliculas VALUES (default, 'Matrix', '2000-01-28', 7 , 10, 38.9);
INSERT INTO peliculas VALUES (default, 'Matrix Reloaded', '2004-01-01', 7 , 10, 38.9);
INSERT INTO peliculas VALUES (default, 'Matrix Revolution', '2005-01-01', 7 , 10, 38.9);

INSERT INTO compras VALUES (2, '78535540Q', '2011-05-28');
INSERT INTO compras VALUES (5, '78535540Q', '2012-06-14');
INSERT INTO compras VALUES (10, '78535540Q', '2015-10-28');
INSERT INTO compras VALUES (15, '78535540Q', '2018-11-29');
INSERT INTO compras VALUES (16, '78535540Q', '2022-07-07');
INSERT INTO compras VALUES (1, '78535540Q', '2022-07-07');
INSERT INTO compras VALUES (20, '78535540Q', '2023-02-01');
INSERT INTO compras VALUES (20, '43535545C', '2023-02-01');
INSERT INTO compras VALUES (22, '43535545C', '2023-01-01');
INSERT INTO compras VALUES (19, '43535545C', '2005-05-10');
INSERT INTO compras VALUES (11, '43535545C', '2013-08-06');
INSERT INTO compras VALUES (1, '45525540A', '2005-08-06');
INSERT INTO compras VALUES (7, '45525540A', '2017-09-07');
INSERT INTO compras VALUES (13, '45525540A', '2022-08-06');
INSERT INTO compras VALUES (15, '45525540A', '2023-01-06');
INSERT INTO compras VALUES (4, '48532544T', '2001-01-06');
INSERT INTO compras VALUES (13,'48532544T', '2003-01-06');
INSERT INTO compras VALUES (6, '48532544T', '2004-07-06');
INSERT INTO compras VALUES (9, '48532544T', '2005-09-17');
INSERT INTO compras VALUES (17,'48532544T', '2021-05-15');


CREATE TABLE peliculasRetro (
 codPelicula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(40) NOT NULL,
 precio DOUBLE NOT NULL check(precio<=999.99),
 stock TINYINT NULL,
 codDirector int,
 nombreDirector varchar(40));
 

INSERT INTO peliculasRetro
 SELECT peliculas.codPelicula, peliculas.nombre, peliculas.precio, peliculas.stock, directores.codDirector, directores.nombre from peliculas
	inner join directores on peliculas.codDirector=directores.codDirector
    where year(peliculas.fechaAlta)<1995;
    
    select * from peliculasRetro;