CREATE TABLE cuenta (
    usuario VARCHAR(25) NOT NULL,
    password VARCHAR(25) NOT NULL,
    PRIMARY KEY (usuario)
);

insert into cuenta values('usuario1', 'contra');
insert into cuenta values('usuario2', 'pass');


CREATE TABLE autor (
    codigo int NOT NULL,
    porcentaje_beneficio float(2),
    PRIMARY KEY (codigo)
);

insert into autor values(123, 30);
insert into autor values(456, 15);
insert into autor values(789, 50.5);
insert into autor values(012, 90);

CREATE TABLE libro (
    ISBN VARCHAR(13) NOT NULL,
    titulo varchar(100),
    portada varchar(100),
    fecha_publicacion DATE,
    precio float(2),
	nif_autor_principal varchar(9),
	propietario VARCHAR(25) NOT NULL,
    PRIMARY KEY (ISBN),
	FOREIGN KEY (propietario) REFERENCES cuenta(usuario) on delete cascade on update restrict
);

insert into libro values('8422616335', 'The Lord of the rings', 'imagenes/8422616335.jpg', '1954-07-09', 7.40, '27668390B', 'usuario1');
insert into libro values('3456789234', 'La sangre de los elfos', 'imagenes/3456789234.jpg', '1994-03-01', 23.50, '12345678A', 'usuario1');
insert into libro values('7563910245', 'La espada del destino', 'imagenes/7563910245.jpg', '1992-12-13', 35.90, '37574747S', 'usuario2');
insert into libro values('2341352345', 'El imperio final', 'imagenes/2341352345.jpg', '2006-07-17', 19.90, '14328984F', 'usuario1');

CREATE TABLE escribe (
    ISBN VARCHAR(13),
	codigo_autor int,
	numero int,
	beneficio_autor float(2),    
	FOREIGN KEY (ISBN) REFERENCES libro(ISBN) on delete cascade on update restrict,
	FOREIGN KEY (codigo_autor) REFERENCES autor(codigo) on delete cascade on update restrict, 
	PRIMARY KEY (ISBN, codigo_autor, numero) 
);

insert into escribe values('8422616335', 123, 1, 0);
insert into escribe values ('8422616335', 456, 2, 0);
insert into escribe values('3456789234', 012, 1, 0);
insert into escribe values('7563910245', 789, 1, 0);
insert into escribe values('7563910245', 456, 2, 0);
insert into escribe values('2341352345', 012, 1, 0);

update escribe set beneficio_autor = ((select porcentaje_beneficio from autor where codigo = escribe.codigo_autor) * (select precio from libro where isbn = escribe.isbn)) / 100
;


