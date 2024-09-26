CREATE DATABASE IF NOT EXISTS MotoGp;

USE MotoGp;

CREATE TABLE IF NOT EXISTS Fabricantes(
	ID INT PRIMARY KEY,
	Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Modelos(
	ID INT PRIMARY KEY,
	Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Motos(
	ID INT PRIMARY KEY,
	FabricanteID INT NOT NULL,
	ModeloID INT NOT NULL,
	FOREIGN KEY (FabricanteID) REFERENCES Fabricantes(ID),
	FOREIGN KEY (ModeloID) REFERENCES Modelos(ID),
	Velocidad INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Motos_Modelo(
	ID INT PRIMARY KEY,
	ModeloID INT NOT NULL,
	MotoID INT NOT NULL,
	FOREIGN KEY (ModeloID) REFERENCES Modelos(ID),
	FOREIGN KEY (MotoID) REFERENCES Motos(ID),
	Ano DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Paises(
	ID INT PRIMARY KEY,
	Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Pilotos(
	ID INT PRIMARY KEY,
	Nombre VARCHAR(100),
	Apellido VARCHAR(100),
	FechaNacimiento DATE,
	Victorias INT NOT NULL,
	PaisID INT NOT NULL,
	FOREIGN KEY (PaisID) REFERENCES Paises(ID)
);

CREATE TABLE IF NOT EXISTS Equipos(
	ID INT PRIMARY KEY,
	Nombre VARCHAR(100) NOT NULL UNIQUE,
	PaisID INT NOT NULL,
	FabricanteID INT NOT NULL,
	PilotoID INT NOT NULL,
	FOREIGN KEY (PaisID) REFERENCES Paises(ID),
	FOREIGN KEY (FabricanteID) REFERENCES Fabricantes(ID),
	FOREIGN KEY (PilotoID) REFERENCES Pilotos(ID)
);

CREATE TABLE IF NOT EXISTS Climas(
	ID INT PRIMARY KEY,
	Nombre VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Categorias(
	ID INT PRIMARY KEY,
	Nombre VARCHAR(100) UNIQUE NOT NULL,
	Cilindraje INT NOT NULL
);


CREATE TABLE IF NOT EXISTS Ubicaciones(
	ID INT PRIMARY KEY,
	Nombre VARCHAR(100) NOT NULL,
	PaisID INT NOT NULL,
	FOREIGN KEY (PaisID) REFERENCES Paises(ID)
);

CREATE TABLE IF NOT EXISTS Posiciones(
	ID INT PRIMARY KEY,
	Nombre VARCHAR(255) UNIQUE NOT NULL,
	Puntos INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Resultados(
	ID INT PRIMARY KEY,
	PosicionID INT NOT NULL,
	PilotoID INT NOT NULL,
	Tiempo TIME NOT NULL,
	FOREIGN KEY (PosicionID) REFERENCES Posiciones(ID),
	FOREIGN KEY (PilotoID) REFERENCES Pilotos(ID)
);

CREATE TABLE IF NOT EXISTS Carreras(
	ID INT PRIMARY KEY,
	Nombre VARCHAR(100) NOT NULL,
	Fecha DATE NOT NULL,
	ClimaID INT NOT NULL,
	CategoriaID INT NOT NULL,
	ResultadoID INT NOT NULL,
	UbicacionID INT NOT NULL,
	FOREIGN KEY (ClimaID) REFERENCES Climas(ID),
	FOREIGN KEY (CategoriaID) REFERENCES Categorias(ID),
	FOREIGN KEY (ResultadoID) REFERENCES Resultados(ID),
	FOREIGN KEY (UbicacionID) REFERENCES Ubicaciones(ID)
);

CREATE TABLE IF NOT EXISTS Equipo_Carreras(
	EquipoID INT NOT NULL,
	CarreraID INT NOT NULL,
	FOREIGN KEY (EquipoID) REFERENCES Equipos(ID),
	FOREIGN KEY (CarreraID) REFERENCES Carreras(ID)
);

CREATE TABLE IF NOT EXISTS Circuito(
	ID INT  PRIMARY KEY,
	Nombre VARCHAR(100) UNIQUE NOT NULL,
	Longitud INT NOT NULL,
	UbicacionID INT NOT NULL,
	Record INT NOT NULL,
	AnoApertura DATE NOT NULL
);

-- Inserciones de Fabricantes
INSERT INTO Fabricantes (ID,Nombre) VALUES 
(1, 'Yamaha'),
(2, 'Honda'),
(3, 'Ducati'),
(4, 'Suzuki'),
(5, 'KTM'),
(6, 'Aprilia'),
(7, 'BMW'),
(8, 'Kawasaki'),
(9, 'Cagiva'),
(10, 'Norton'),
(11, 'MV Agusta'),
(12, 'Bimota'),
(13, 'Gilera'),
(14, 'Morbidelli'),
(15, 'AJS'),
(16, 'LCR Honda'),
(17, 'Pramac Racing'),
(18, 'Tech3 KTM'),
(19, 'Petronas Yamaha'),
(20, 'Gresini Racing');

-- Inserciones de Modelos 
INSERT INTO Modelos (ID,Nombre) VALUES
(1, 'YZR-M1'),
(2, 'RC213V'),
(3, 'Desmosedici GP'),
(4, 'GSX-RR'),
(5, 'RC16'),
(6, 'RS-GP'),
(7, 'M1-GP'),
(8, 'ZX-RR'),
(9, 'Mito125-GP'),
(10, 'Rotary'),
(11, 'F4-GP'),
(12, 'YB4-Gp'),
(13, '7R-GP'),
(14, 'RC213V-s'),
(15, 'GP21-P'),
(16, 'RC16-T'),
(17, 'YZR-M1-P'),
(18,'GP21-G'),
(19, 'XTY-3'),
(20, 'RTX-2090');

-- Inserciones para Motos
INSERT INTO Motos (ID,FabricanteID,ModeloID,Velocidad) VALUES 
(1,1,1,350),
(2,2,2,350),
(3,3,3,360),
(4,4,4,340),
(5,5,5,340),
(6,6,6,340),
(7,7,7,320),
(8,8,8,340),
(9,9,9,200),
(10,10,10,320),
(11,11,11,320),
(12,12,12,300),
(13,13,13,200),
(14,14,14,250),
(15,15,15,350),
(16,16,16,360),
(17,17,17,340),
(18,18,18,350),
(19,19,19,360),
(20,20,20,300);

-- Inserciones para Paise
INSERT INTO Paises (ID, Nombre) VALUES
(1, 'Colombia'),
(2, 'España'),
(3, 'Argentina'),
(4, 'México'),
(5, 'Chile'),
(6, 'Perú'),
(7, 'Venezuela'),
(8, 'Ecuador'),
(9, 'Uruguay'),
(10, 'Paraguay'),
(11, 'Bolivia'),
(12, 'Cuba'),
(13, 'República Dominicana'),
(14, 'Honduras'),
(15, 'Guatemala'),
(16, 'Costa Rica'),
(17, 'El Salvador'),
(18, 'Nicaragua'),
(19, 'Panamá'),
(20, 'Puerto Rico');

--Inserciones para Pilotos
INSERT INTO Pilotos (ID, Nombre, FechaNacimiento, Victorias, PaisID) VALUES
(101, 'Nicolas', '2005-11-15', 59, 2),
(102, 'JuanKis', '1987-05-12', 34, 2),
(103, 'Haider', '2006-10-05', 25, 2),
(104, 'Carlos', '1990-03-20', 42, 1),
(105, 'Miguel', '1985-07-15', 37, 3),
(106, 'Sofia', '1993-09-10', 21, 1),
(107, 'Isabel', '1995-04-25', 15, 4),
(108, 'Lucia', '1988-08-30', 30, 2),
(109, 'Pedro', '1992-12-22', 18, 3),
(110, 'Alberto', '1980-06-05', 60, 5),
(111, 'Mariana', '1999-01-17', 8, 2),
(112, 'Antonio', '1984-11-11', 26, 4),
(113, 'Claudia', '1991-10-29', 29, 1),
(114, 'Fernando', '1996-02-14', 19, 2),
(115, 'Valentina', '2000-07-21', 22, 3),
(116, 'Ricardo', '1989-05-18', 50, 5),
(117, 'Gabriel', '2003-04-03', 10, 1),
(118, 'Victoria', '1986-09-23', 45, 2),
(119, 'Julian', '1994-03-15', 14, 4),
(120, 'Raul', '1998-12-30', 12, 3);

-- Inserciones para Equipos
INSERT INTO Equipos (ID, Nombre, PaisID, FabricanteID, PilotoID) VALUES 
(1, 'Skyre', 3, 4, 1),
(2, 'ThunderBolt', 2, 1, 2),
(3, 'AeroX', 5, 3, 3),
(4, 'RacingPro', 1, 2, 4),
(5, 'SpeedFreak', 4, 5, 5),
(6, 'Velocity', 6, 1, 6),
(7, 'RapidFire', 7, 3, 7),
(8, 'Dragster', 8, 4, 8),
(9, 'Overdrive', 9, 2, 9),
(10, 'NitroX', 10, 5, 10),
(11, 'Adrenaline', 11, 1, 11),
(12, 'TorqueMaster', 12, 3, 12),
(13, 'PaceSetter', 13, 4, 13),
(14, 'FusionRacing', 14, 2, 14),
(15, 'RaceCraft', 15, 5, 15),
(16, 'HighGear', 16, 1, 16),
(17, 'G-Force', 17, 3, 17),
(18, 'Stealth', 18, 4, 18),
(19, 'PowerLine', 19, 2, 19),
(20, 'TrailBlazer', 20, 5, 20);

-- Inserciones para Climas
INSERT INTO Climas (ID, Nombre) VALUES
(1, 'Tropical Húmedo'),
(2, 'Desértico Caliente'),
(3, 'Templado Continental'),
(4, 'Mediterráneo'),
(5, 'Ártico'),
(6, 'Subtropical Húmedo'),
(7, 'Tundra'),
(8, 'Clima de Montaña'),
(9, 'Marítimo'),
(10, 'Semiárido'),
(11, 'Desértico Frío'),
(12, 'Tropical Seco'),
(13, 'Cálido Oceánico'),
(14, 'Frío Continental'),
(15, 'Clima de Sabana'),
(16, 'Clima de Pradera'),
(17, 'Monzónico'),
(18, 'Húmedo Continental'),
(19, 'Clima Alpino'),
(20, 'Clima Subártico');

-- Inserciones para Categorias
INSERT INTO Categorias (ID, Nombre, Cilindraje) VALUES
(1, 'MotoGP', 1000),
(2, 'Moto2', 765),
(3, 'Moto3', 250),
(4, 'MotoE', 0),
(5, 'Superbike', 2000),
(6, 'Supersport', 600),
(7, 'Junior GP', 280),
(8, 'European Talent Cup', 230),
(9, 'PreMoto3', 220),
(10, 'Copa de España de Velocidad', 120),
(11, 'Copa Nacional de Velocidad', 370),
(12, 'TrialGP', 10),
(13, 'EnduroGP', 50),
(14, 'Cross Country', 40),
(15, 'Motocross', 350),
(16, 'Flat Track', 750),
(17, 'Street Bike', 360),
(18, 'Adventure Touring', 900),
(19, 'Naked Bike', 500),
(20, 'Cafe Racer', 800);

-- Inserciones para Ubicaciones 
INSERT INTO Ubicaciones (ID, Nombre, PaisID) VALUES
(1, 'Bogotá', 1),       -- Colombia
(2, 'Medellín', 1),     -- Colombia
(3, 'Cali', 1),         -- Colombia
(4, 'Cartagena', 1),    -- Colombia
(5, 'Barcelona', 2),    -- España
(6, 'Madrid', 2),       -- España
(7, 'Valencia', 2),     -- España
(8, 'Sevilla', 2),      -- España
(9, 'Buenos Aires', 3), -- Argentina
(10, 'Córdoba', 3),     -- Argentina
(11, 'Rosario', 3),     -- Argentina
(12, 'La Plata', 3),    -- Argentina
(13, 'Ciudad de México', 4),  -- México
(14, 'Guadalajara', 4),  -- México
(15, 'Monterrey', 4),    -- México
(16, 'Santiago', 5),     -- Chile
(17, 'Valparaíso', 5),   -- Chile
(18, 'Lima', 6),         -- Perú
(19, 'Caracas', 7),      -- Venezuela
(20, 'Quito', 8);        -- Ecuador

-- Inserciones para Posiciones
INSERT INTO Posiciones (ID, Nombre, Puntos) VALUES
(1, 'Posición 1', 25),  
(2, 'Posición 2', 20),   
(3, 'Posición 3', 16),   
(4, 'Posición 4', 13),   
(5, 'Posición 5', 11),   
(6, 'Posición 6', 10),   
(7, 'Posición 7', 9),   
(8, 'Posición 8', 8),   
(9, 'Posición 9', 7),   
(10, 'Posición 10', 6),  
(11, 'Posición 11', 5),  
(12, 'Posición 12', 4),  
(13, 'Posición 13', 3),  
(14, 'Posición 14', 2),  
(15, 'Posición 15', 1),  
(16, 'Posición 16', 0),  
(17, 'Posición 17', 0),  
(18, 'Posición 18', 0),  
(19, 'Posición 19', 0),  
(20, 'Posición 20', 0),
(21, 'DNF', 0);

-- Inserciones para Resultados
INSERT INTO Resultados (ID, PosicionID, PilotoID, Tiempo) VALUES
(1, 1, 101, '01:32:15'),  
(2, 2, 102, '01:33:20'),  
(3, 3, 103, '01:34:30'),  
(4, 4, 104, '01:35:45'),  
(5, 5, 105, '01:36:10'),  
(6, 6, 106, '01:37:25'),  
(7, 7, 107, '01:38:40'),  
(8, 8, 108, '01:39:55'),  
(9, 9, 109, '01:41:05'),  
(10, 10, 110, '01:42:15'),  
(11, 11, 111, '01:33:50'),  
(12, 12, 112, '01:34:25'),  
(13, 13, 113, '01:35:00'),  
(14, 14, 114, '01:36:35'),  
(15, 15, 115, '01:37:10'),  
(16, 16, 116, '01:38:45'),  
(17, 17, 117, '01:39:20'),  
(18, 18, 118, '01:40:55'),  
(19, 19, 119, '01:42:30'),  
(20, 20, 120, '01:43:05');

-- Inserciones para Carreras
INSERT INTO Carreras (ID, Nombre, Fecha, ClimaID, CategoriaID, ResultadoID, UbicacionID) VALUES
(1, 'Gran Premio de Bogotá', '2024-03-15', 1, 1, 1, 1),
(2, 'Gran Premio de Medellín', '2024-04-10', 2, 1, 2, 2),
(3, 'Gran Premio de Cali', '2024-05-05', 3, 2, 3, 3),
(4, 'Gran Premio de Cartagena', '2024-06-01', 1, 2, 4, 4), 
(5, 'Gran Premio de Barcelona', '2024-07-15', 2, 3, 5, 5),  
(6, 'Gran Premio de Madrid', '2024-08-20', 3, 3, 6, 6),  
(7, 'Gran Premio de Valencia', '2024-09-12', 1, 4, 7, 7),  
(8, 'Gran Premio de Sevilla', '2024-10-08', 2, 4, 8, 8),  
(9, 'Gran Premio de Buenos Aires', '2024-11-03', 3, 1, 9, 9),  
(10, 'Gran Premio de Córdoba', '2024-12-05', 1, 2, 10, 10),  
(11, 'Gran Premio de Rosario', '2025-01-15', 2, 3, 11, 11),  
(12, 'Gran Premio de La Plata', '2025-02-19', 3, 4, 12, 12),  
(13, 'Gran Premio de Ciudad de México', '2025-03-10', 1, 1, 13, 13),  
(14, 'Gran Premio de Guadalajara', '2025-04-07', 2, 2, 14, 14),  
(15, 'Gran Premio de Monterrey', '2025-05-15', 3, 3, 15, 15),  
(16, 'Gran Premio de Santiago', '2025-06-18', 1, 4, 16, 16),  
(17, 'Gran Premio de Valparaíso', '2025-07-22', 2, 1, 17, 17),  
(18, 'Gran Premio de Lima', '2025-08-10', 3, 2, 18, 18),  
(19, 'Gran Premio de Caracas', '2025-09-12', 1, 3, 19, 19),  
(20, 'Gran Premio de Quito', '2025-10-08', 2, 4, 20, 20);  