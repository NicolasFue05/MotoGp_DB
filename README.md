# Base de Datos MotoGP
Una base de datos SQL para gestionar información de fabricantes, modelos, motos y mucho mas para la competencia MotoGp. Esta base de datos puede ser usada para cualquier clase de proyecto en el que la requieras, esta facilitado para consultar datos sobre los pilotos, diferentes carreras etc.

## Tabla de Contenidos
1. [Instalación](#instalación)
2. [Contexto](#contexto-de-la-competencia-motogp)
3. [Estructura](#estructura)
4. [Relaciones](#relaciones)
5. [Diagrama E-R](#diagrama-e-r)
6. [Colaboradores](#colaboradores)
7. [Contacto](#contacto)

## Contexto de la competencia MotoGP
MotoGP es la competencia de motociclismo más prestigiosa a nivel mundial, organizada por la FIM (Federación Internacional de Motociclismo).

En esta competencia, fabricantes de motocicletas de alto rendimiento como Yamaha, Honda, Ducati, y Suzuki participan con motos personalizadas, mientras que equipos y pilotos de todo el mundo compiten en circuitos internacionales.

Los pilotos acumulan puntos en función de sus posiciones en cada carrera.

## Estructura
MotoGP está estructurado en varias categorías, que incluyen MotoGP, Moto2, y Moto3, diferenciadas por el cilindraje de las motos.

A lo largo de una temporada, se realizan carreras en diferentes países y ubicaciones, con equipos patrocinados por fabricantes y otras entidades.

Además, los resultados dependen no solo de la habilidad del piloto, sino también de factores como las condiciones del clima y las características del circuito.

## Relaciones
Las tablas en la base de datos están diseñadas para modelar la estructura de la competencia MotoGP y reflejar las relaciones entre los diferentes actores y elementos involucrados:

- **Fabricantes y Modelos**: Los fabricantes (como Yamaha o Honda) producen diversos modelos de motocicletas, que se reflejan en las tablas Fabricantes y Modelos. Cada moto en la tabla Motos está asociada con un fabricante y un modelo específico, lo que refleja la importancia de las marcas y su rendimiento.

- **Motos y Motos_Modelo**: Las motos se asocian a un fabricante y un modelo específico, y se pueden enlazar con una tabla relacional Motos_Modelo para gestionar la información sobre las diferentes versiones de un mismo modelo a lo largo de los años.

- **Pilotos**: Cada piloto que participa en MotoGP está representado en la tabla Pilotos, donde se almacenan datos como su país de origen, victorias, y fecha de nacimiento.

- **Equipos**: Los equipos de MotoGP, que son patrocinados por fabricantes y compiten con un piloto y una moto, están en la tabla Equipos. Estos equipos tienen un vínculo con los pilotos y los fabricantes, lo que refleja la estructura de las competiciones.

- **Climas y Ubicaciones**: Los climas y las ubicaciones de las carreras juegan un rol importante en el resultado de las competencias. Las carreras pueden tener condiciones climáticas variables, lo cual afecta el rendimiento de los pilotos y las motos. Estas tablas reflejan las características ambientales de las carreras.

- **Posiciones y Resultados**: Las posiciones en las carreras son cruciales para determinar los puntos acumulados por los pilotos. Los resultados de cada carrera, que incluyen el tiempo y la posición final, están almacenados en Resultados y Posiciones.

- **Carreras**: Cada carrera es un evento único con características como la ubicación, el clima, la categoría de motos, y los resultados finales. La tabla Carreras representa estos eventos y sus datos asociados.

- **Categorías**: MotoGP tiene distintas categorías según el cilindraje de las motos. La tabla Categorias almacena las diferentes categorías de competición (como MotoGP, Moto2, etc.).

- **Circuitos**: Los circuitos donde se llevan a cabo las carreras están representados en la tabla Circuito. Aquí se almacenan detalles como la longitud del circuito, el récord de velocidad y el año de apertura, datos importantes para la historia y análisis de las competiciones.

- **Equipo_Carreras**: La tabla Equipo_Carreras gestiona la participación de los equipos en cada carrera, permitiendo rastrear qué equipo compitió en cuál carrera.

### Relacion y contexto
Relación y contexto
Estas tablas permiten modelar cómo los pilotos, equipos y motos se conectan dentro del marco de la competencia MotoGP.

Puedes realizar consultas para obtener información detallada sobre las carreras, las motos y sus fabricantes, los pilotos y sus equipos, y ver cómo el rendimiento de cada piloto o equipo se ve afectado por factores como el clima, la categoría de las motos y las condiciones del circuito.

## Diagrama E-R
En el siguiente diagrama StarUML se muestra la creacion grafica de las relaciones en la base de datos:

![image](https://github.com/user-attachments/assets/ebd8065e-0986-4f63-a2a2-b3e69d1629c5)

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
