--Obtiene todos los pilotos con su respectivo equipo, fabricante de motos y su pais de origen

-- La consulta presenta problemas
SELECT Pilotos.Nombre AS Piloto,
        Equipos.Nombre AS Equipo,
        Fabricante.Nombre AS Fabricante,
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
