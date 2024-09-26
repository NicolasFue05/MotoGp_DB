-- Obtener el nombre de los pilotos y sus paises
SELECT Pilotos.Nombre AS Piloto, Paises.Nombre
FROM Pilotos
INNER JOIN Paises ON Pilotos.PaisID = Paises.ID;

-- Obtener todas las categorias con Cilindraje mayor a 300
SELECT Categorias.Nombre AS Categoria, Cilindraje
FROM Categorias
WHERE Cilindraje > 300;

-- Obtiene todos los pilotos con su respectivo equipo, fabricante de motos y su país de origen
SELECT p.Nombre AS NombrePiloto,
       p.Apellido AS ApellidoPiloto,
       e.Nombre AS NombreEquipo,
       f.Nombre AS Fabricante,
       pa.Nombre AS PaisOrigen
FROM Pilotos p
JOIN Equipos e ON p.ID = e.PilotoID
JOIN Fabricantes f ON e.FabricanteID = f.ID
JOIN Paises pa ON p.PaisID = pa.ID;

-- Obtiene el nombre de todas las motos con sus respectivos fabricantes, modelos y su velocidad final
SELECT m.ID AS MotoID,
       m.Velocidad AS VelocidadFinal,
       mo.Nombre AS NombreModelo,
       f.Nombre AS NombreFabricante
FROM Motos m
JOIN Motos_Modelos mm ON m.ID = mm.MotoID
JOIN Modelos mo ON mm.ModeloID = mo.ID
JOIN Fabricantes f ON mo.FabricanteID = f.ID;

-- Obtiene cuántos pilotos hay por país 
SELECT pa.Nombre AS Pais,
       COUNT(p.ID) AS NumeroDePilotos
FROM Paises pa
LEFT JOIN Pilotos p ON pa.ID = p.PaisID
GROUP BY pa.Nombre
ORDER BY NumeroDePilotos DESC;

-- Obtiene todas las victorias en total de un país en específico 
SELECT pa.Nombre AS Pais,
       SUM(p.Victorias) AS TotalVictorias
FROM Paises pa
JOIN Pilotos p ON pa.ID = p.PaisID
WHERE pa.Nombre = 'Espana' -- Reemplaza 'NombreDelPais' por el país específico que desees consultar
GROUP BY pa.Nombre;

-- Obtiene y lista todas las carreras hechas en un clima 
SELECT c.Nombre AS NombreCarrera,
       c.Fecha AS FechaCarrera,
       cl.Nombre AS Clima
FROM Carreras c
JOIN Climas cl ON c.ClimaID = cl.ID
WHERE cl.Nombre = 'Soleado';

-- Obtiene el número total de carreras que ha ganado un piloto en específico 
SELECT p.Nombre AS Piloto, 
       COUNT(r.ID) AS VictoriasTotales
FROM Pilotos p
JOIN Resultados r ON p.ID = r.PilotoID
JOIN Posiciones pos ON r.PosicionID = pos.ID
WHERE pos.Nombre = '1º'
AND p.Nombre = 'Nombre del piloto';

-- Obtiene los pilotos que pertenecen a un equipo específico 
SELECT p.Nombre AS Piloto, 
       p.Apellido AS Apellido, 
       e.Nombre AS Equipo
FROM Pilotos p
JOIN Equipos e ON p.ID = e.PilotoID
WHERE e.Nombre = 'Skyre';

-- Obtiene el número de victorias de un equipo 
SELECT e.Nombre AS Equipo, 
       SUM(p.Victorias) AS VictoriasTotales
FROM Equipos e
JOIN Pilotos p ON e.PilotoID = p.ID
GROUP BY e.Nombre;

-- Lista los pilotos con más de 20 victorias
SELECT Nombre, Apellido, Victorias
FROM Pilotos
WHERE Victorias > 20;

-- Lista las categorías que existen y el número total de carreras en cada categoría 
SELECT c.Nombre AS Categoria, 
       COUNT(ca.ID) AS TotalCarreras
FROM Carreras ca
JOIN Categorias c ON ca.CategoriaID = c.ID
GROUP BY c.Nombre;

-- Lista los circuitos que tienen de récord un tiempo menor que 1:30:00
SELECT c.Nombre AS Circuito, 
       c.Record
FROM Circuito c
WHERE c.Record < TIME '01:30:00';

-- Lista todas las categorías de motos con cilindraje mayor a 1000cc.
SELECT c.Nombre AS Categoria, 
       c.Cilindraje
FROM Categorias c
WHERE c.Cilindraje > 1000;

-- Obtiene el equipo con mayor cantidad de pilotos
SELECT e.Nombre AS Equipo, 
       COUNT(p.ID) AS CantidadPilotos
FROM Equipos e
JOIN Pilotos p ON e.PilotoID = p.ID
GROUP BY e.Nombre
ORDER BY CantidadPilotos DESC
LIMIT 1;

-- Obtiene el número total de victorias por piloto y país
SELECT p.Nombre AS Piloto, 
       pa.Nombre AS Pais, 
       p.Victorias
FROM Pilotos p
JOIN Paises pa ON p.PaisID = pa.ID;

-- Lista los circuitos más largos que son mayores a 5000 metros
SELECT c.Nombre AS Circuito, 
       c.Longitud
FROM Circuito c
WHERE c.Longitud > 5000;

-- Contar cuántas carreras se han corrido en cada tipo de clima
SELECT cl.Nombre AS Clima, 
       COUNT(ca.ID) AS TotalCarreras
FROM Carreras ca
JOIN Climas cl ON ca.ClimaID = cl.ID
GROUP BY cl.Nombre;

-- Obtiene el total de puntos ganados por un piloto en todas las carreras
SELECT p.Nombre AS Piloto, 
       SUM(pos.Puntos) AS TotalPuntos
FROM Resultados r
JOIN Pilotos p ON r.PilotoID = p.ID
JOIN Posiciones pos ON r.PosicionID = pos.ID
GROUP BY p.Nombre;

-- Consulta para obtener todos los pilotos con más de 10 victorias
SELECT Nombre, Apellido, Victorias
FROM Pilotos
WHERE Victorias > 10;

-- Consulta para listar todos los modelos de motos y sus respectivos fabricantes
SELECT M.Nombre AS Modelo, F.Nombre AS Fabricante
FROM Modelos M
JOIN Fabricantes F ON M.FabricanteID = F.ID;

-- Consulta para encontrar la carrera más reciente y su fecha
SELECT Nombre, Fecha
FROM Carreras
ORDER BY Fecha DESC
LIMIT 1;


-- Consulta para obtener los equipos y sus respectivos pilotos
SELECT E.Nombre AS Equipo, P.Nombre AS Piloto
FROM Equipos E
LEFT JOIN Pilotos P ON E.PilotoID = P.ID;

-- Consulta para obtener la velocidad promedio de las motos
SELECT AVG(Velocidad) AS VelocidadPromedio
FROM Motos;

-- Consulta para obtener todas las carreras junto con la ubicación
SELECT C.Nombre AS Carrera, U.Nombre AS Ubicacion
FROM Carreras C
JOIN Ubicaciones U ON C.UbicacionID = U.ID;

-- Consulta para obtener los circuitos que tienen un récord superior a 125
SELECT Nombre, Record
FROM Circuito
WHERE Record > 125;

-- Consulta para obtener la cantidad de motos por modelo
SELECT M.Nombre AS Modelo, COUNT(MM.MotoID) AS CantidadMotos
FROM Modelos M
LEFT JOIN Motos_Modelos MM ON M.ID = MM.ModeloID
GROUP BY M.ID;

-- Consulta para listar todas las categorías y sus cilindrajes
SELECT Nombre, Cilindraje
FROM Categorias;
