CREATE DATABASE IF NOT EXISTS MotoGp;

USE MotoGp;

CREATE TABLE IF NOT EXISTS Paises (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Fabricantes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Modelos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    FabricanteID INT NOT NULL,
    FOREIGN KEY (FabricanteID) REFERENCES Fabricantes(ID)
);

CREATE TABLE IF NOT EXISTS Motos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Velocidad INT,
    Ano DATE
);

-- Pilotos y Equipos

CREATE TABLE IF NOT EXISTS Pilotos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    FechaNacimiento DATE,
    Victorias INT,
    PaisID INT NOT NULL,
    FOREIGN KEY (PaisID) REFERENCES Paises(ID)
);

CREATE TABLE IF NOT EXISTS Equipos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    PaisID INT NOT NULL,
    FabricanteID INT NOT NULL,
    PilotoID INT, -- Opcional si un piloto pertenece a un equipo específico
    FOREIGN KEY (PaisID) REFERENCES Paises(ID),
    FOREIGN KEY (FabricanteID) REFERENCES Fabricantes(ID),
    FOREIGN KEY (PilotoID) REFERENCES Pilotos(ID)
);

-- Carreras y Circuitos

CREATE TABLE IF NOT EXISTS Ubicaciones (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Circuito (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Longitud INT,
    UbicacionID INT NOT NULL,
    Record INT,
    AnoApertura DATE,
    FOREIGN KEY (UbicacionID) REFERENCES Ubicaciones(ID)
);

CREATE TABLE IF NOT EXISTS Climas (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Categorias (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Cilindraje INT
);

CREATE TABLE IF NOT EXISTS Posiciones (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(25) NOT NULL,
    Puntos INT
);

CREATE TABLE IF NOT EXISTS Resultados (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    PosicionID INT NOT NULL,
    PilotoID INT NOT NULL,
    Tiempo TIME,
    FOREIGN KEY (PosicionID) REFERENCES Posiciones(ID),
    FOREIGN KEY (PilotoID) REFERENCES Pilotos(ID)
);

CREATE TABLE IF NOT EXISTS Carreras (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Fecha DATE,
    ClimaID INT NOT NULL,
    CategoriaID INT NOT NULL,
    ResultadoID INT,
    UbicacionID INT NOT NULL,
    FOREIGN KEY (ClimaID) REFERENCES Climas(ID),
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(ID),
    FOREIGN KEY (ResultadoID) REFERENCES Resultados(ID),
    FOREIGN KEY (UbicacionID) REFERENCES Ubicaciones(ID)
);

CREATE TABLE IF NOT EXISTS Equipo_Carrera (
    EquipoID INT NOT NULL,
    CarreraID INT NOT NULL,
    PRIMARY KEY (EquipoID, CarreraID),
    FOREIGN KEY (EquipoID) REFERENCES Equipos(ID),
    FOREIGN KEY (CarreraID) REFERENCES Carreras(ID)
);

-- Relaciones adicionales entre Motos y Carreras

CREATE TABLE IF NOT EXISTS Motos_Modelos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ModeloID INT NOT NULL,
    MotoID INT NOT NULL,
    Ano DATE,
    FOREIGN KEY (ModeloID) REFERENCES Modelos(ID),
    FOREIGN KEY (MotoID) REFERENCES Motos(ID)
);


-- Inserciones
-- Paises
INSERT INTO Paises (Nombre) VALUES 
    ('España'), ('Reino Unido'), ('Italia'), ('Francia'), ('Estados Unidos'),
    ('Australia'), ('Japón'), ('Alemania'), ('Brasil'), ('Argentina'),
    ('Portugal'), ('México'), ('Canadá'), ('Nueva Zelanda'), ('Sudáfrica'),
    ('India'), ('China'), ('Rusia'), ('Corea del Sur'), ('Tailandia');

-- Fabricantes
INSERT INTO Fabricantes (Nombre) VALUES
    ('Yamaha'), ('Ducati'), ('Honda'), ('Suzuki'), ('Kawasaki'),
    ('Aprilia'), ('KTM'), ('MV Agusta'), ('BMW'), ('Triumph'),
    ('Harley-Davidson'), ('Indian'), ('Husqvarna'), ('Bajaj'), ('Royal Enfield'),
    ('Hero'), ('TVS'), ('Vespa'), ('Benelli'), ('Moto Guzzi');

-- Modelos
INSERT INTO Modelos (Nombre, FabricanteID) VALUES
    ('YZR-M1', 1), ('Desmosedici GP', 2), ('RC213V', 3), ('GSX-RR', 4),
    ('Ninja ZX-RR', 5), ('RS-GP', 6), ('RC16', 7), ('F4', 8),
    ('S1000RR', 9), ('Street Triple', 10), ('Sportster', 11), ('Scout', 12),
    ('Vitpilen', 13), ('Pulsar', 14), ('Interceptor 650', 15), 
    ('Splendor', 16), ('Apache', 17), ('GTS Super', 18), ('Leoncino', 19),
    ('V7', 20);

-- Motos
INSERT INTO Motos (Velocidad, Ano) VALUES
    (355, '2022-01-01'), (345, '2021-01-01'), (340, '2020-01-01'), (338, '2019-01-01'),
    (330, '2018-01-01'), (328, '2017-01-01'), (320, '2016-01-01'), (315, '2015-01-01'),
    (310, '2014-01-01'), (305, '2013-01-01'), (300, '2012-01-01'), (295, '2011-01-01'),
    (290, '2010-01-01'), (285, '2009-01-01'), (280, '2008-01-01'), (275, '2007-01-01'),
    (270, '2006-01-01'), (265, '2005-01-01'), (260, '2004-01-01'), (255, '2003-01-01');

-- Pilotos
INSERT INTO Pilotos (Nombre, Apellido, FechaNacimiento, Victorias, PaisID) VALUES
    ('Marc', 'Márquez', '1993-02-17', 85, 1), ('Valentino', 'Rossi', '1979-02-16', 115, 3),
    ('Fabio', 'Quartararo', '1999-04-20', 10, 4), ('Joan', 'Mir', '1997-09-01', 12, 1),
    ('Jack', 'Miller', '1995-01-18', 5, 6), ('Takaaki', 'Nakagami', '1992-02-09', 1, 7),
    ('Brad', 'Binder', '1995-08-11', 3, 6), ('Franco', 'Morbidelli', '1994-12-04', 3, 3),
    ('Pol', 'Espargaro', '1991-06-10', 1, 1), ('Miguel', 'Oliveira', '1995-01-04', 2, 9),
    ('Andrea', 'Dovizioso', '1986-03-23', 24, 3), ('Danilo', 'Petrucci', '1990-10-24', 2, 3),
    ('Jorge', 'Lorenzo', '1987-05-04', 47, 1), ('Maverick', 'Viñales', '1995-01-12', 9, 1),
    ('Johann', 'Zarco', '1990-07-16', 2, 4), ('Enea', 'Bastianini', '1997-12-30', 1, 3),
    ('Alex', 'Rins', '1995-12-08', 3, 1), ('Aleix', 'Espargaro', '1989-07-30', 1, 1),
    ('Francesco', 'Bagnaia', '1997-01-14', 6, 3), ('Luca', 'Marini', '1997-08-10', 0, 3);

-- Equipos
INSERT INTO Equipos (Nombre, PaisID, FabricanteID, PilotoID) VALUES
    ('Repsol Honda', 1, 3, 1), ('Monster Yamaha', 1, 1, 1), 
    ('Ducati Corse', 3, 2, 2), ('Team Suzuki Ecstar', 1, 4, 4),
    ('Aprilia Racing Team', 3, 6, 2), ('Red Bull KTM Factory Racing', 6, 7, 6),
    ('LCR Honda', 7, 3, 5), ('Petronas Yamaha', 9, 1, 8),
    ('Pramac Racing', 4, 2, 15), ('Gresini Racing', 3, 6, 18),
    ('Tech3 KTM Factory Racing', 9, 7, 6), ('VR46 Racing', 3, 2, 20),
    ('WithU Yamaha RNF', 4, 1, 10), ('Mooney VR46 Racing Team', 3, 2, 19),
    ('Esponsorama Racing', 1, 8, 2), ('Marc VDS Racing Team', 4, 2, 3),
    ('Pons Racing', 3, 6, 1), ('GRT Yamaha', 9, 1, 7),
    ('HRC Test Team', 7, 3, 2), ('Avintia Racing', 3, 2, 11);

-- Inserciones en la tabla Ubicaciones
INSERT INTO Ubicaciones (Nombre) VALUES 
('Circuito de Jerez'),
('Silverstone'),
('Mugello'),
('Le Mans'),
('Circuit of the Americas'),
('Phillip Island'),
('Sachsenring'),
('Termas de Río Hondo'),
('Sepang International Circuit'),
('Losail International Circuit'),
('Red Bull Ring'),
('Misano World Circuit'),
('Catalunya Circuit'),
('Assen'),
('Brno Circuit'),
('Circuito Ricardo Tormo'),
('Estoril Circuit'),
('Zandvoort Circuit'),
('KymiRing'),
('Suzuka International Circuit');

-- Inserciones en la tabla Circuito
INSERT INTO Circuito (Nombre, Longitud, UbicacionID, Record, AnoApertura) VALUES
('Circuito de Jerez', 4423, 1, 120, '1985-01-01'),
('Silverstone', 5891, 2, 118, '1948-01-01'),
('Mugello', 5245, 3, 119, '1974-01-01'),
('Le Mans', 4185, 4, 121, '1923-01-01'),
('Circuit of the Americas', 5513, 5, 122, '2012-01-01'),
('Phillip Island', 4448, 6, 119, '1956-01-01'),
('Sachsenring', 3671, 7, 125, '1927-01-01'),
('Termas de Río Hondo', 4806, 8, 124, '2008-01-01'),
('Sepang International Circuit', 5543, 9, 123, '1999-01-01'),
('Losail International Circuit', 5380, 10, 124, '2004-01-01'),
('Red Bull Ring', 4318, 11, 125, '1969-01-01'),
('Misano World Circuit', 4226, 12, 123, '1972-01-01'),
('Catalunya Circuit', 4655, 13, 124, '1991-01-01'),
('Assen', 4542, 14, 126, '1949-01-01'),
('Brno Circuit', 5403, 15, 127, '1930-01-01'),
('Circuito Ricardo Tormo', 4005, 16, 128, '1999-01-01'),
('Estoril Circuit', 4360, 17, 127, '1972-01-01'),
('Zandvoort Circuit', 4307, 18, 126, '1948-01-01'),
('KymiRing', 4620, 19, 129, '2019-01-01'),
('Suzuka International Circuit', 5807, 20, 128, '1962-01-01');

-- Inserciones en la tabla Climas
INSERT INTO Climas (Nombre) VALUES
('Soleado'),
('Nublado'),
('Lluvioso'),
('Ventoso'),
('Tormentoso'),
('Nevado'),
('Húmedo'),
('Caluroso'),
('Frío'),
('Despejado'),
('Brumoso'),
('Neblinoso'),
('Relampagueante'),
('Granizo'),
('Tempestuoso'),
('Cálido'),
('Invernal'),
('Tropical'),
('Monzón'),
('Seco');

-- Inserciones en la tabla Posiciones
INSERT INTO Posiciones (Nombre, Puntos) VALUES
('Primero', 25),
('Segundo', 20),
('Tercero', 16),
('Cuarto', 13),
('Quinto', 11),
('Sexto', 10),
('Séptimo', 9),
('Octavo', 8),
('Noveno', 7),
('Décimo', 6),
('Undécimo', 5),
('Duodécimo', 4),
('Décimo Tercero', 3),
('Décimo Cuarto', 2),
('Décimo Quinto', 1),
('Décimo Sexto', 0),
('Décimo Séptimo', 0),
('Décimo Octavo', 0),
('Décimo Noveno', 0),
('Vigésimo', 0);

-- Inserciones en la tabla Resultados
INSERT INTO Resultados (PosicionID, PilotoID, Tiempo) VALUES
(1, 1, '00:42:15'),
(2, 2, '00:42:17'),
(3, 3, '00:42:19'),
(4, 4, '00:42:22'),
(5, 5, '00:42:25'),
(6, 6, '00:42:30'),
(7, 7, '00:42:33'),
(8, 8, '00:42:35'),
(9, 9, '00:42:38'),
(10, 10, '00:42:40'),
(1, 11, '00:42:20'),
(2, 12, '00:42:23'),
(3, 13, '00:42:25'),
(4, 14, '00:42:28'),
(5, 15, '00:42:31'),
(6, 16, '00:42:33'),
(7, 17, '00:42:36'),
(8, 18, '00:42:38'),
(9, 19, '00:42:41'),
(10, 20, '00:42:43');


-- Inserciones en la tabla Categorias
INSERT INTO Categorias (Nombre, Cilindraje) VALUES
('MotoGP', 1000),
('Moto2', 765),
('Moto3', 250),
('Superbike', 1000),
('Supersport', 600),
('MotoE', 0),
('MotoClassic', 1000),
('Scooter', 150),
('Enduro', 450),
('MotoCross', 450),
('Touring', 1200),
('Naked', 900),
('Adventure', 1250),
('Cruiser', 1800),
('Sport', 750),
('Track', 600),
('Supermoto', 450),
('Drag', 1000),
('Street', 900),
('Electric', 0);

-- Inserciones en la tabla Carreras
INSERT INTO Carreras (Nombre, Fecha, ClimaID, CategoriaID, ResultadoID, UbicacionID) VALUES
('Gran Premio de Jerez', '2024-05-02', 1, 1, 1, 1),
('Gran Premio de Silverstone', '2024-07-15', 2, 2, 2, 2),
('Gran Premio de Mugello', '2024-06-01', 3, 1, 3, 3),
('Gran Premio de Le Mans', '2024-05-16', 4, 3, 4, 4),
('Gran Premio de las Américas', '2024-04-09', 1, 1, 5, 5),
('Gran Premio de Phillip Island', '2024-10-29', 2, 2, 6, 6),
('Gran Premio de Sachsenring', '2024-06-22', 3, 1, 7, 7),
('Gran Premio de Argentina', '2024-04-01', 1, 2, 8, 8),
('Gran Premio de Malasia', '2024-11-10', 4, 1, 9, 9),
('Gran Premio de Qatar', '2024-03-16', 5, 3, 10, 10),
('Gran Premio de Austria', '2024-08-13', 6, 2, 11, 11),
('Gran Premio de Misano', '2024-09-05', 1, 1, 12, 12),
('Gran Premio de Catalunya', '2024-06-08', 3, 2, 13, 13),
('Gran Premio de Assen', '2024-07-04', 2, 3, 14, 14),
('Gran Premio de Brno', '2024-08-20', 5, 1, 15, 15),
('Gran Premio de Valencia', '2024-11-24', 4, 2, 16, 16),
('Gran Premio de Portugal', '2024-03-28', 1, 3, 17, 17),
('Gran Premio de Holanda', '2024-06-29', 2, 2, 18, 18),
('Gran Premio de Finlandia', '2024-07-22', 6, 1, 19, 19),
('Gran Premio de Japón', '2024-10-08', 1, 2, 20, 20);


-- Inserciones en la tabla Equipo_Carrera
INSERT INTO Equipo_Carrera (EquipoID, CarreraID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(1, 11),
(2, 12),
(3, 13),
(4, 14),
(5, 15),
(6, 16),
(7, 17),
(8, 18),
(9, 19),
(10, 20);

-- Inserciones en la tabla Motos_Modelos
INSERT INTO Motos_Modelos (ModeloID, MotoID, Ano) VALUES
(1, 1, '2022-01-01'),
(2, 2, '2021-01-01'),
(3, 3, '2020-01-01'),
(4, 4, '2019-01-01'),
(5, 5, '2018-01-01'),
(6, 6, '2017-01-01'),
(7, 7, '2016-01-01'),
(8, 8, '2015-01-01'),
(1, 9, '2022-01-01'),
(2, 10, '2021-01-01'),
(3, 11, '2020-01-01'),
(4, 12, '2019-01-01'),
(5, 13, '2018-01-01'),
(6, 14, '2017-01-01'),
(7, 15, '2016-01-01'),
(8, 16, '2015-01-01'),
(1, 17, '2022-01-01'),
(2, 18, '2021-01-01'),
(3, 19, '2020-01-01'),
(4, 20, '2019-01-01');