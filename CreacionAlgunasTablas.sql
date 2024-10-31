


CREATE DATABASE DBTableTennisUNI


CREATE TABLE Clubes(
Club_ID INT PRIMARY KEY IDENTITY(1,1),
Nombre Varchar(50),
Pais Varchar(50), -- creo q esto se cambiara--
Ciudad Varchar(50) -- creo q esto se cambiara--
)


CREATE TABLE Jugadores(
Jugador_ID INT PRIMARY KEY IDENTITY(1,1),
Nombre Varchar(50) NOT NULL,
Apellido Varchar(50) NOT NULL,
Edad INT NOT NULL,
Cedula Varchar(50) NULL DEFAULT 'Sin identificacion',
Categoria Varchar NOT NULL, --Posiblemente se cambie el tipo de dato--
)


CREATE TABLE Jugadores_Club(
Jugadores_Club INT PRIMARY KEY IDENTITY(1,1),
Club_ID INT FOREIGN KEY REFERENCES Clubes(Club_ID),
Jugador_ID INT FOREIGN KEY REFERENCES Jugadores(Jugador_ID)
)



CREATE TABLE Tipo_Torneos(
Tipo_Torneo_ID INT PRIMARY KEY IDENTITY(1,1),
Nombre Varchar(50) NOT NULL
)

CREATE TABLE Formato_Torneos(
Formato_Torneo_ID INT PRIMARY KEY IDENTITY(1,1),
Nombre Varchar(50) NOT NULL 
)

CREATE TABLE Torneos(
Torneo_ID INT PRIMARY KEY IDENTITY(1,1),
Tipo_Torneo_ID INT FOREIGN KEY REFERENCES Tipo_Torneos(Tipo_Torneo_ID),
Formato_Torneo_ID INT FOREIGN KEY REFERENCES Formato_Torneos(Formato_Torneo_ID),
Nombre Varchar(50) NOT NULL,
Fecha_Inicio DateTime NOT NULL,
Fecha_Cierre DateTime NOT NULL
)


CREATE TABLE Equipos(
Equipo_ID INT PRIMARY KEY IDENTITY(1,1),
Nombre Varchar(50) NOT NULL
)

Create table Equipo_Jugador
(
Equipo_Jugador_ID INT PRIMARY KEY IDENTITY(1,1),
Equipo_ID INT FOREIGN KEY REFERENCES Equipos(Equipo_ID),
Jugador_ID INT FOREIGN KEY REFERENCES Jugadores(Jugador_ID)
)

CREATE TABLE Partidas(
Partida_ID INT PRIMARY KEY IDENTITY(1,1),
Torneo_ID INT FOREIGN KEY REFERENCES Torneos(Torneo_ID),
Jugador1_ID INT FOREIGN KEY REFERENCES Jugadores(Jugador_ID), 
Jugador2_ID INT FOREIGN KEY REFERENCES Jugadores(Jugador_ID),
)

CREATE TABLE PartidasDobles(
PartidasDobles_ID INT PRIMARY KEY IDENTITY(1,1),
--En caso de que el formato sea dobles--
Equipo1_ID INT FOREIGN KEY REFERENCES Equipos(Equipo_ID),
Equipo2_ID INT FOREIGN KEY REFERENCES Equipos(Equipo_ID)
)

CREATE TABLE Resultados_Partidas(
Resultados_Partidas_ID INT PRIMARY KEY IDENTITY(1,1),
Partida_ID INT FOREIGN KEY REFERENCES Partidas(Partida_ID),
Numero_Sets INT NULL Default '', 
Puntaje_Jugador1 INT NULL Default '', 
Puntaje_Jugador2 INT NULL Default '' 
)

