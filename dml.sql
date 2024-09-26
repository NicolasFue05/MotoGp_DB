-- Obtiene todos los pilotos con su respectivo equipo, fabricante de motos y su pais de origen
SELECT Pilotos.Nombre AS Piloto,
        Equipo.Nombre AS Equipo,
        Fabricante.Nombre as Fabricante,
        Pais.Nombre AS Pais
FROM Pilotos 
JOIN Equipos ON Pilotos.ID = Equipos.PilotosID
JOIN Fabricantes ON Equipo.FabricantesID = Fabricantes.ID
JOIN Pais ON Pilotos.PaisID = Paises.ID;

-- Obtiene el nombre de todas las motos con sus respectivos fabricantes, modelos y su velocidad final
SELECT Motos.ID AS MotoID,
        Fabricante.Nombre AS Fabricante,
        Modelos.Nombre AS Modelo,
        Motos.Velocidad AS VelocidadMaxima
FROM Motos
JOIN Fabricantes ON Motos.FabricanteID = Fabricantes.ID
JOIN Modelos ON Motos.ModeloID = Modelos.ID;

-- Obtiene cuantos pilotos hay por pais 
SELECT Paises.Nombre AS Pais, COUNT(Pilotos.ID) AS CantidadPilotos
FROM PILOTOS 
JOIN Paises ON Pilotos.PaisID = Paises.ID
GROUP BY Paises.Nombre;

