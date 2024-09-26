# Base de datos de MotoGP

Este proyecto contiene el esquema para una base de datos relacionada con MotoGP, que incluye tablas para pilotos, equipos, motocicletas, carreras y más. A continuación, se incluye una descripción detallada de la estructura de la base de datos, junto con consultas SQL de muestra para recuperar datos.

## Tabla de Contenidos
1. [Instalación](#instalación)
2. [Contexto](#contexto-de-la-competencia-motogp)
3. [Tablas y Relaciones](#tablas-y-relaciones)
4. [Inserciones](#inserciones-de-ejemplo)
5. [Consultas](#consultas)
6. [Diagrama E-R](#diagrama-e-r)
7. [Mejoras Futuras](#mejoras-futuras)
8. [Colaboradores](#colaboradores)

## Contexto de la competencia MotoGP
MotoGP es la competencia de motociclismo más prestigiosa a nivel mundial, organizada por la FIM (Federación Internacional de Motociclismo).

En esta competencia, fabricantes de motocicletas de alto rendimiento como Yamaha, Honda, Ducati, y Suzuki participan con motos personalizadas, mientras que equipos y pilotos de todo el mundo compiten en circuitos internacionales.

Los pilotos acumulan puntos en función de sus posiciones en cada carrera.

## Esquema de la base de datos

### Tablas y Relaciones:
En la base de datos se pueden observar diferentes tablas, aqui te muestro que representa cada estado de cada tabla:

1. **Paises**: Contiene la lista de países.
- `ID`: Clave principal, autoincrementable.
- `Nombre`: Nombre del país.

2. **Fabricantes**: Contiene la lista de fabricantes de motocicletas.
- `ID`: Clave principal, autoincrementable.
- `Nombre`: Nombre del fabricante.

3. **Modelos**: Contiene modelos de motocicletas.
- `ID`: Clave principal, autoincrementable.
- `Nombre`: Nombre del modelo.
- `FabricanteID`: Clave externa que hace referencia a `Fabricantes(ID)`.

4. **Motos**: Contiene información sobre las motos.
- `ID`: Clave principal, autoincrementable.
- `Velocidad`: Velocidad de la moto.
- `Ano`: Año de la moto.

5. **Pilotos**: Contiene detalles del piloto.
- `ID`: Clave principal, autoincrementable.
- `Nombre`: Nombre del piloto.
- `Apellido`: Apellido del piloto.
- `FechaNacimiento`: Fecha de nacimiento del piloto.
- `Victorias`: Número de victorias.
- `PaisID`: Clave externa que hace referencia a `Paises(ID)`.

6. **Equipos**: Contiene detalles del equipo.
- `ID`: Clave principal, autoincrementable.
- `Nombre`: Nombre del equipo.
- `PaisID`: Clave externa que hace referencia a `Paises(ID)`.
- `FabricanteID`: Clave externa que hace referencia a `Fabricantes(ID)`.
- `PilotoID`: Clave externa que hace referencia a `Pilotos(ID)`.

7. **Ubicaciones**: Contiene las ubicaciones de los circuitos.
- `ID`: Clave primaria, autoincrementable.
- `Nombre`: Nombre de la ubicación.

8. **Circuito**: Contiene detalles del circuito.
- `ID`: Clave primaria, autoincrementable.
- `Nombre`: Nombre del circuito.
- `Longitud`: Longitud del circuito en metros.
- `UbicacionID`: Clave externa que hace referencia a `Ubicaciones(ID)`.
- `Record`: Registra el tiempo en el circuito.
- `AnoApertura`: Año en que se inauguró el circuito.

9. **Climas**: Contiene las condiciones meteorológicas.
- `ID`: Clave primaria, autoincrementable.
- `Nombre`: Condición meteorológica (p. ej., soleado, lluvioso).

10. **Categorias**: Contiene las categorías de la carrera.
- `ID`: Clave principal, autoincrementable.
- `Nombre`: Nombre de la categoría.
- `Cilindraje`: Cilindrada del motor en cc.

11. **Posiciones**: Contiene las posiciones de los resultados de la carrera.
- `ID`: Clave principal, autoincrementable.
- `Nombre`: Nombre de la posición (p. ej., 1º, 2º, etc.).
- `Puntos`: Puntos otorgados por la posición.

12. **Resultados**: Contiene los resultados de la carrera.
- `ID`: Clave principal, autoincrementable.
- `PosicionID`: Clave externa que hace referencia a `Posiciones(ID)`.
- `PilotoID`: Clave externa que hace referencia a `Pilotos(ID)`.
- `Tiempo`: Tiempo empleado por el corredor.

13. **Carreras**: Contiene los detalles de la carrera.
- `ID`: Clave primaria, autoincrementable.
- `Nombre`: Nombre de la carrera.
- `Fecha`: Fecha de la carrera.
- `ClimaID`: Clave externa que hace referencia a `Climas(ID)`.
- `CategoriaID`: Clave externa que hace referencia a `Categorias(ID)`.
- `ResultadoID`: Clave externa que hace referencia a `Resultados(ID)`.
- `UbicacionID`: Clave externa que hace referencia a `Ubicaciones(ID)`.

14. **Equipo_Carrera**: Vincula los equipos a las carreras.
- `EquipoID`: Clave externa que hace referencia a `Equipos(ID)`.
- `CarreraID`: Clave externa que hace referencia a `Carreras(ID)`.

15. **Motos_Modelos**: Vincula las motocicletas a los modelos.
- `ModeloID`: Clave externa que hace referencia a `Modelos(ID)`.
- `MotoID`: Clave externa que hace referencia a `Motos(ID)`.
- `Ano`: Año del modelo.

### Inserciones de Ejemplo

En el archivo dll.sql se encuentran algunas de las inserciones default que vienen con el programa, a continuacion un ejemplo de como vienen estructuradas las inserciones

### Insertar fabricantes de motocicletas en `Fabricantes`
```sql
INSERT INTO Fabricantes (Nombre) VALUES
('Yamaha'), ('Ducati'), ('Honda'), ('Suzuki'), ('Kawasaki'),
('Aprilia'), ('KTM'), ('MV Agusta'), ('BMW'), ('Triumph'),
('Harley-Davidson'), ('Indian'), ('Husqvarna'), ('Bajaj'), ('Royal Enfield');
```

### Insertar modelos de motocicletas en `Modelos`
```sql
INSERT INTO Modelos (Nombre, FabricanteID) VALUES
('YZR-M1', 1), ('Desmosedici GP', 2), ('RC213V', 3), ('GSX-RR', 4),
('Ninja ZX-RR', 5), ('RS-GP', 6), ('RC16', 7);
```


## Consultas
En este caso hay algunos ejemplo de como vienen las consultas en el archivo dml.sql. Cada consulta viene con una breve explicacion en codigo comentada arriba de la misma, a continuacion la descripcion de la consulta con su respectiva solucion

### Algunos ejemplos de las consultas con su explicacion 
1.Obtener el nombre de los pilotos y sus paises 
```sql
    SELECT Pilotos.Nombre AS Piloto, Paises.Nombre
    FROM Pilotos
    INNER JOIN Paises ON Pilotos.PaisID = Paises.ID;
```
**Explicación**:
Esta consulta obtiene una lista de los pilotos junto con el nombre de sus respectivos países, utilizando una relación entre las tablas Pilotos y Paises mediante el campo PaisID.

2.Obtener todas las categorias con cilindraje mayor a 300
```sql
    SELECT Categorias.Nombre AS Categoria, Cilindraje
    FROM Categorias
    WHERE Cilindraje > 300;
```
**Explicación**:
Esta consulta lista todas las categorías que tienen un cilindraje superior a 300cc, filtrando las filas de la tabla Categorias con un valor mayor a 300 en el campo Cilindraje.

3. Obtiene todos los pilotos con su respectivo equipo, fabricantes de motos y su pais de origen 
```sql
    SELECT p.Nombre AS NombrePiloto,
           p.Apellido AS ApellidoPiloto,
           e.Nombre AS NombreEquipo,
           f.Nombre AS Fabricante,
           pa.Nombre AS PaisOrigen
    FROM Pilotos p
    JOIN Equipos e ON p.ID = e.PilotoID
    JOIN Fabricantes f ON e.FabricanteID = f.ID
    JOIN Paises pa ON p.PaisID = pa.ID;
```
**Explicación**:
Esta consulta obtiene una lista de pilotos, sus equipos, los fabricantes de motos y sus países de origen. Realiza múltiples JOINs para combinar las tablas Pilotos, Equipos, Fabricantes, y Paises en una sola consulta.

4. Obtiene el nombre de todas las motos con sus respectivos fabricantes, modelos y su velocidad final
```sql
    SELECT m.ID AS MotoID,
           m.Velocidad AS VelocidadFinal,
           mo.Nombre AS NombreModelo,
           f.Nombre AS NombreFabricante
    FROM Motos m
    JOIN Motos_Modelos mm ON m.ID = mm.MotoID
    JOIN Modelos mo ON mm.ModeloID = mo.ID
    JOIN Fabricantes f ON mo.FabricanteID = f.ID;
```
**Explicación**:
Esta consulta lista todas las motos junto con su velocidad final, modelo, y fabricante. Se utiliza la tabla intermedia Motos_Modelos para asociar las motos con sus modelos y luego se realiza un JOIN con Fabricantes.

5. Obtiene cuantos pilotos hay por pais
```sql
    SELECT pa.Nombre AS Pais,
           COUNT(p.ID) AS NumeroDePilotos
    FROM Paises pa
    LEFT JOIN Pilotos p ON pa.ID = p.PaisID
    GROUP BY pa.Nombre
    ORDER BY NumeroDePilotos DESC;
```
**Explicación**:
La consulta cuenta cuántos pilotos hay en cada país. Utiliza un LEFT JOIN para asegurarse de incluir países aunque no tengan pilotos registrados. El resultado se agrupa por país y se ordena de mayor a menor cantidad de pilotos.


### Estas son las consultas disponibles
1.Obtener el nombre de los pilotos y sus países.
2.Obtener todas las categorías con un cilindraje mayor a 300.
3.Obtener los pilotos junto con sus equipos, el fabricante de sus motos y su país de origen.
4.Obtener el nombre de todas las motos, junto con sus fabricantes, modelos y velocidad final.
5.Obtener el número de pilotos por país.
6.Obtener el total de victorias de un país específico.
7.Listar todas las carreras que se han corrido en un clima específico.
8.Obtener el número total de carreras ganadas por un piloto específico.
9.Obtener los pilotos que pertenecen a un equipo específico.
10.Obtener el número total de victorias de un equipo.
11.Listar los pilotos con más de 20 victorias.
12.Listar las categorías y el número total de carreras en cada una.
13.Listar los circuitos que tienen un récord menor a 1:30:00.
14.Listar todas las categorías de motos con un cilindraje mayor a 1000cc.
15.Obtener el equipo con más pilotos registrados.
16.Obtener el número total de victorias por piloto y su país.
17.Listar los circuitos que tienen más de 5000 metros de longitud.
18.Contar cuántas carreras se han corrido en cada tipo de clima.
19.Obtener el total de puntos ganados por un piloto en todas las carreras.
20.Listar todos los pilotos con más de 10 victorias.
21.Listar todos los modelos de motos y sus fabricantes.
22.Obtener la carrera más reciente y su fecha.
23.Obtener los equipos y sus respectivos pilotos.
24.Obtener la velocidad promedio de las motos.
25.Listar todas las carreras junto con su ubicación.
26.Obtener los circuitos que tienen un récord superior a 125.
27.Obtener la cantidad de motos por modelo.
28.Listar todas las categorías de motos y sus cilindrajes.
29.Obtener el promedio de victorias de los pilotos por equipo.
30.Obtener el equipo con el mayor número de victorias en total.
31.Listar las motos más rápidas (con una velocidad mayor a 300 km/h).
32.Obtener el fabricante con más modelos de motos.
33.Listar las carreras realizadas después del año 2020.
34.Obtener el número total de puntos ganados por un equipo en todas las carreras.
35.Listar los países que tienen más de 5 pilotos registrados.
36.Obtener el total de carreras ganadas por pilotos con más de 5 victorias.
37.Obtener el total de carreras corridas por categoría.
38.Listar los fabricantes que han producido más de 5 modelos de motos.
39.Obtener el promedio de velocidad de las motos por fabricante.

## Diagrama E-R
El siguiente diagrama se muestra una vista grafica de la estructura de la base de datos y la relacion que tienen sus entidades

![image](https://github.com/user-attachments/assets/d891be69-4d86-46aa-8aa1-65c3e0243418)


## Mejoras futuras

- Agregar relaciones más complejas entre carreras, pilotos y equipos.
- Implementar estadísticas detalladas para el rendimiento de los pilotos a lo largo de las temporadas.
- Introducir funcionalidad para realizar un seguimiento de los presupuestos de los equipos y el desarrollo de las motocicletas.

## Instalación

1. Clona este repositorio:
    ```bash
    git clone https://github.com/NicolasFue05/MotoGp_DB.git
    ```
2. Instalar el servidor de mysql (si aun no lo tienes):
    ```bash
    sudo apt install mysql-server
    ```
3. Verificar el estado de MySQL (para asegurarte de que está corriendo):
   ```bash
   sudo systemctl status mysql
   ```
   Si no esta iniciado, puedes iniciar el servicio:
     ```bash
     sudo systemctl start mysql
     ```
5. Configurar MySQL (opcional pero recomendado para evitar errores):
    Después de la instalación, se recomienda ejecutar el script de seguridad para configurar MySQL:
   ```bash
   sudo mysql_secure_installation
   ```
6. Configura la base de datos (deberas pegar la ruta en la que se encuentran los archivos actuales:
    ```bash
    mysql -u root -p </ruta-archivo/ddl.sql
    ```
7. Comprueba que se hayan guardado los datos en la base de datos:
    ```sql
    SHOW DATABASES;
    ```

## Colaboradores
- **Nicolas Fuentes** - [NicolasFue05](https://github.com/NicolasFue05)
- **Haider Jerez** - [haiderjerez](https://github.com/haiderjerez)
