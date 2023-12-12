# Curso de Bases de Datos con PostgreSQL

Este proyecto utiliza PostgreSQL como base de datos, y se recomienda seguir estos pasos para levantar el proyecto localmente.

## Requisitos previos

- Tener Docker Desktop instalado en tu máquina.

## Pasos para levantar el proyecto

1. Clona este repositorio en tu máquina local:

    ```bash
    git clone https://github.com/AruHonshou/Course-PostgreSQL.git
    ```

2. Navega a la carpeta del proyecto:

    ```bash
    cd tu-proyecto
    ```

3. Ejecuta el siguiente comando para iniciar los contenedores de Docker en segundo plano:

    ```bash
    docker-compose up -d
    ```

4. Revisa el archivo `docker-compose.yml` para obtener información sobre los usuarios y contraseñas utilizados.

5. Instala [TablePlus](https://tableplus.com/) o inicia desde [PgAdmin](https://www.pgadmin.org/), y configura la conexión con los siguientes detalles:

    - **Host:** localhost
    - **Puerto:** 5432
    - **Usuario:** [Usuario especificado en el archivo docker-compose.yml]
    - **Contraseña:** [Contraseña especificada en el archivo docker-compose.yml]
    - **Base de datos:** [Nombre de la base de datos especificado en el archivo docker-compose.yml]

6. ¡Listo! Ahora deberías tener tu entorno de desarrollo PostgreSQL listo para usar.

## Notas adicionales

- Asegúrate de tener los puertos necesarios disponibles para Docker (predeterminadamente, PostgreSQL utiliza el puerto 5432).
- Si encuentras algún problema, revisa los logs de Docker o verifica la configuración en el archivo `docker-compose.yml`.
