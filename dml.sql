--Obtiene todos los pilotos con su respectivo equipo, fabricante de motos y su pais de origen
SELECT Pilotos.Nombre AS Piloto,
        Equipos.Nombre AS Equipo,
        Fabricantes.Nombre AS Fabricante,
        Pais.Nombre AS Pais
FROM Pilotos
JOIN Equipo ON Pilotos.ID = Equipo.PilotosID
JOIN Fabricante ON Equipo.FabricantesID = Fabricantes.ID
JOIN Pais ON Piloto.PaisID = Paises.ID;

-- Obtiene el nombre de todas las motos con sus respectivos fabricantes, modelos y su velocidad final
SELECT Motos.ID AS MotoID,
        Fabricantes.Nombre AS Fabricante,
        Modelos.Nombre AS Modelo,
        Motos.Velocidad AS VelocidadMaxima
FROM Motos
JOIN Fabricantes ON Motos.FabricanteID = Fabricantes.ID
JOIN Modelos ON Motos.ModeloID = Modelos.ID;

-- Obtiene cuantos pilotos hay por pais 
SELECT Paises.Nombre AS Pais, COUNT(Pilotos.ID) AS CantidadPilotos
FROM Pilotos
JOIN Paises ON Pilotos.PaisID = Paises.ID
GROUP BY Paises.Nombre;

-- obtiene todas las victorias en total de un pais en especifico 
SELECT Paises.Nombre AS Pais, SUM(Pilotos.Victorias) AS VictoriasTotales
FROM pilotos 
JOIN Paises ON Pilotos.ID = Paises.ID
WHERE Paises.Nombre = 'Espana'
GROUP BY Paises.Nombre;

-- Obtiene y lista todas las carreras echas en un clima 
SELECT Carreras.Nombre AS Carrera,
        Climas.Nombre AS Clima,
        Carreras.Fecha 
FROM Carreras 
JOIN Climas ON Carreras.ClimaID = Climas.ID
WHERE Climas.Nombre = 'Desértico Caliente';

-- Obtiene los ressultados de una carrera en espesifica por su nombre 
SELECT Carreras.Nombre AS Carrera,
        Pilotos.Nombre AS piloto,
        Posiciones.Nombre AS posicion,
        Resultado.Tiempo
From Carreras
JOIN Resultados ON Carreras.ResutadoID = Resutados.ID
JOIN Pilotos ON Resultados.PilotoID = pilotos.ID
JOIN Posiciones ON Resultados.PosicionID = Posiciones.ID
WHERE Carreras.Nombre = 'Nombre de la carrera'

-- obtiene el numero total de carreras que a ganado un piloto en especifico 
SELECT Pilotos.Nombre AS Piloto, COUNT(Resultados.ID) AS VictoriasTotales
FROM Pilotos
JOIN Resultados ON Pilotos.ID = Resultados.PilotoID
JOIN Posiciones ON Resultados.PosicionID = Posiciones.ID
WHERE Posiciones.Nombre = '1º'
AND Pilotos.Nombre = 'Nombre del piloto';

-- Obtiene informacion de un circuito con la ubicaion y el pais
SELECT Circuito.Nombre AS Circuito, 
       Ubicaciones.Nombre AS Ubicacion, 
       Paises.Nombre AS Pais, 
       Circuito.Longitud, 
       Circuito.Record, 
       Circuito.AnoApertura
FROM Circuito
JOIN Ubicaciones ON Circuito.UbicacionID = Ubicaciones.ID
JOIN Paises ON Ubicaciones.PaisID = Paises.ID;

-- Obtiene el nombre de las motos que tienen una velocidad superior a 320 km
SELECT Motos.ID AS MotoID, 
       Fabricantes.Nombre AS Fabricante, 
       Modelos.Nombre AS Modelo, 
       Motos.Velocidad AS VelocidadMaxima
FROM Motos
JOIN Fabricantes ON Motos.FabricanteID = Fabricantes.ID
JOIN Modelos ON Motos.ModeloID = Modelos.ID
WHERE Motos.Velocidad > 320;

--Obtiene los pilotos que pertenecen a un quipo especifico 
SELECT Pilotos.Nombre AS Piloto, 
       Pilotos.Apellido AS Apellido, 
       Equipos.Nombre AS Equipo
FROM Pilotos
JOIN Equipos ON Pilotos.ID = Equipos.PilotoID
WHERE Equipos.Nombre = 'Skyre';

-- Obtiene el numero de victorias de un equipo 
SELECT Equipos.Nombre AS Equipo, 
       SUM(Pilotos.Victorias) AS VictoriasTotales
FROM Equipos
JOIN Pilotos ON Equipos.PilotoID = Pilotos.ID
GROUP BY Equipos.Nombre;

-- Lista los pilotos con mas de 20 victorias
SELECT Nombre, Apellido, Victorias
FROM Pilotos
WHERE Victorias > 20;

-- Lista las categorias que existen y el numero total de carreras en cada categoria 
SELECT Categorias.Nombre AS Categoria, 
       COUNT(Carreras.ID) AS TotalCarreras
FROM Carreras
JOIN Categorias ON Carreras.CategoriaID = Categorias.ID
GROUP BY Categorias.Nombre;

-- Obtiene el equipo con mas carreras ganadas
SELECT Equipos.Nombre AS Equipo, 
       COUNT(Equipo_Carreras.CarreraID) AS CarrerasGanadas
FROM Equipo_Carreras
JOIN Equipos ON Equipo_Carreras.EquipoID = Equipos.ID
GROUP BY Equipos.Nombre
ORDER BY CarrerasGanadas DESC
LIMIT 1;

-- Lista los circuitos que tiene de record un tiempo menor que 1:30:00
SELECT Circuito.Nombre AS Circuito, 
       Circuito.Record
FROM Circuito
WHERE Circuito.Record < TIME '01:30:00';

-- Lista todas las categorias de motos con cilindraje mayor a 1000cc.
SELECT Categorias.Nombre AS Categoria, 
       Categorias.Cilindraje
FROM Categorias
WHERE Categorias.Cilindraje > 990;

-- Lista los pilotos que han competido en carreras bajo condiciones climaticas extremas "Artico o Decierto caliente"
SELECT Pilotos.Nombre AS Piloto, 
       Carreras.Nombre AS Carrera, 
       Climas.Nombre AS Clima
FROM Carreras
JOIN Climas ON Carreras.ClimaID = Climas.ID
JOIN Resultados ON Carreras.ResultadoID = Resultados.ID
JOIN Pilotos ON Resultados.PilotoID = Pilotos.ID
WHERE Climas.Nombre IN ('Ártico', 'Desértico Caliente');

-- Lista los resultados de las carreras ordenandolos por el tiempo mas rapido
SELECT Carreras.Nombre AS Carrera, 
       Pilotos.Nombre AS Piloto, 
       Resultados.Tiempo
FROM Carreras
JOIN Resultados ON Carreras.ResultadoID = Resultados.ID
JOIN Pilotos ON Resultados.PilotoID = Pilotos.ID
ORDER BY Resultados.Tiempo ASC;

-- Obtiene el equipo con mayor cantidad de pilotos
SELECT Equipos.Nombre AS Equipo, 
       COUNT(Pilotos.ID) AS CantidadPilotos
FROM Equipos
JOIN Pilotos ON Equipos.PilotoID = Pilotos.ID
GROUP BY Equipos.Nombre
ORDER BY CantidadPilotos DESC
LIMIT 1;

-- Obtiene el numero total de victorias por piloto y pais
SELECT Pilotos.Nombre AS Piloto, 
       Paises.Nombre AS Pais, 
       Pilotos.Victorias
FROM Pilotos
JOIN Paises ON Pilotos.PaisID = Paises.ID;

-- Lista los circuitos mas largos que son mayores a 5000 metros
SELECT Circuito.Nombre AS Circuito, 
       Circuito.Longitud
FROM Circuito
WHERE Circuito.Longitud > 5000;

-- obtine los equipos que han participado en mas de 5 carreras
SELECT Equipos.Nombre AS Equipo, 
       COUNT(Equipo_Carreras.CarreraID) AS TotalCarreras
FROM Equipo_Carreras
JOIN Equipos ON Equipo_Carreras.EquipoID = Equipos.ID
GROUP BY Equipos.Nombre
HAVING COUNT(Equipo_Carreras.CarreraID) > 5;

-- Lista a los pilotos que han ganado al menos una vez en el clima "tropical humedo"
SELECT Pilotos.Nombre AS Piloto, 
       Carreras.Nombre AS Carrera, 
       Climas.Nombre AS Clima
FROM Resultados
JOIN Pilotos ON Resultados.PilotoID = Pilotos.ID
JOIN Carreras ON Carreras.ResultadoID = Resultados.ID
JOIN Climas ON Carreras.ClimaID = Climas.ID
JOIN Posiciones ON Resultados.PosicionID = Posiciones.ID
WHERE Climas.Nombre = 'Tropical Húmedo'
AND Posiciones.Nombre = '1º';

-- Contar cuantas carreras se han corrido en cada tipo de clima
SELECT Climas.Nombre AS Clima, 
       COUNT(Carreras.ID) AS TotalCarreras
FROM Carreras
JOIN Climas ON Carreras.ClimaID = Climas.ID
GROUP BY Climas.Nombre;

-- Obtiene el total de puntos ganados por un piloto en todas las carreras
SELECT Pilotos.Nombre AS Piloto, 
       SUM(Posiciones.Puntos) AS TotalPuntos
FROM Resultados
JOIN Pilotos ON Resultados.PilotoID = Pilotos.ID
JOIN Posiciones ON Resultados.PosicionID = Posiciones.ID
GROUP BY Pilotos.Nombre;

-- listar las motos que mas han sido utilizado en carreras
SELECT Motos.ID, 
       Modelos.Nombre AS Modelo, 
       COUNT(Carreras.ID) AS TotalCarreras
FROM Motos
JOIN Motos_Modelo ON Motos.ID = Motos_Modelo.MotoID
JOIN Carreras ON Carreras.ID = Motos_Modelo.ID
GROUP BY Motos.ID, Modelos.Nombre
HAVING COUNT(Carreras.ID) > 1;

-- Obtiene el piloto que ha consegido mas victorias con una misma moto "ducati"
SELECT Pilotos.Nombre AS Piloto, 
       Fabricantes.Nombre AS Fabricante, 
       COUNT(Resultados.ID) AS TotalVictorias
FROM Pilotos
JOIN Resultados ON Pilotos.ID = Resultados.PilotoID
JOIN Motos ON Motos.ID = Pilotos.ID
JOIN Fabricantes ON Motos.FabricanteID = Fabricantes.ID
JOIN Posiciones ON Resultados.PosicionID = Posiciones.ID
WHERE Fabricantes.Nombre = 'Ducati' AND Posiciones.Nombre = '1º'
GROUP BY Pilotos.Nombre, Fabricantes.Nombre
ORDER BY TotalVictorias DESC
LIMIT 1;

-- Obtiene el promedio de la velocidad de todas las motos que compiten en motoGp
SELECT AVG(Motos.Velocidad) AS VelocidadPromedio
FROM Motos
JOIN Motos_Modelo ON Motos.ID = Motos_Modelo.MotoID
JOIN Carreras ON Motos_Modelo.ID = Carreras.ID
JOIN Categorias ON Carreras.CategoriaID = Categorias.ID
WHERE Categorias.Nombre = 'MotoGP';

-- Obtiene los resultados mas lentos de todas las carreras
SELECT Motos.ID, 
       Modelos.Nombre AS Modelo, 
       Resultados.Tiempo
FROM Motos
JOIN Resultados ON Motos.ID = Resultados.PilotoID
JOIN Modelos ON Motos.ModeloID = Modelos.ID
ORDER BY Resultados.Tiempo DESC;

-- lista las motos que han batido record en algun circuito 
SELECT Circuito.Nombre AS Circuito, 
       Modelos.Nombre AS Modelo, 
       Circuito.Record AS VelocidadRecord
FROM Circuito
JOIN Motos ON Circuito.Record = Motos.Velocidad
JOIN Modelos ON Motos.ModeloID = Modelos.ID;

-- Obtiene los tiempos más rápidos registrados por cada piloto utilizando una sola moto
SELECT Pilotos.Nombre AS Piloto, 
       Modelos.Nombre AS Modelo, 
       MIN(Resultados.Tiempo) AS MejorTiempo
FROM Resultados
JOIN Pilotos ON Resultados.PilotoID = Pilotos.ID
JOIN Motos ON Pilotos.ID = Motos.ID
JOIN Modelos ON Motos.ModeloID = Modelos.ID
GROUP BY Pilotos.Nombre, Modelos.Nombre;

-- Obtiene la moto que a logrado el mayor numero de victorias en la catergoria "moto2"
SELECT Modelos.Nombre AS Modelo, 
       COUNT(Resultados.ID) AS TotalVictorias
FROM Motos
JOIN Modelos ON Motos.ModeloID = Modelos.ID
JOIN Resultados ON Motos.ID = Resultados.PilotoID
JOIN Carreras ON Resultados.ID = Carreras.ResultadoID
JOIN Categorias ON Carreras.CategoriaID = Categorias.ID
JOIN Posiciones ON Resultados.PosicionID = Posiciones.ID
WHERE Categorias.Nombre = 'Moto2'
AND Posiciones.Nombre = '1º'
GROUP BY Modelos.Nombre
ORDER BY TotalVictorias DESC
LIMIT 1;
