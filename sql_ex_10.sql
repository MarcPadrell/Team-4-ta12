create database futbol;

use futbol;

CREATE TABLE jugador (
    dorsal int NOT NULL,
    nom varchar(20),
    posicio varchar(20),
    PRIMARY KEY (dorsal)
);

CREATE TABLE partit (
    jornada int auto_increment NOT NULL,
    resultat varchar(20),
    PRIMARY KEY (jornada)
);

CREATE TABLE camp (
    ubicacio varchar(20),
    capacitat int not null default 20000,
    PRIMARY KEY (ubicacio)
);

CREATE TABLE lliga (
    nom_lliga varchar(20),
    divisio varchar(20),
    PRIMARY KEY (nom_lliga)
);

CREATE TABLE entrenador (
    alies varchar(20),
    edat int not null,
    experiencia_anys int not null default 0,
    PRIMARY KEY (alies)
);

CREATE TABLE equip (
    nom_club varchar(20),
    antiguitat int NOT NULL,
    ubicacio varchar(20),
    nom_lliga varchar(20),
    alies varchar(20),
    PRIMARY KEY (nom_club),
    FOREIGN KEY (ubicacio) REFERENCES camp(ubicacio)
    On delete cascade on update cascade, 
    FOREIGN KEY (nom_lliga) REFERENCES lliga(nom_lliga)
    On delete cascade on update cascade,
    FOREIGN KEY (alies) REFERENCES entrenador (alies)
    On delete cascade on update cascade 
);

CREATE TABLE jugar (
    dorsal int NOT NULL,
    jornada int NOT NULL,
    nom_club varchar(20),
    PRIMARY KEY (dorsal, jornada),
    FOREIGN KEY (dorsal) REFERENCES jugador(dorsal)
    On delete cascade on update cascade ,
    FOREIGN KEY (jornada) REFERENCES partit(jornada)
    On delete cascade on update cascade ,
    FOREIGN KEY (nom_club) REFERENCES equip(nom_club)
    On delete cascade on update cascade 
);


