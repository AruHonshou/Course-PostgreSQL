-- Creamos la tabla
CREATE TABLE prueba (
	name VARCHAR(10) UNIQUE
);

-- Insertamos los nombres a la tabla users
INSERT INTO
    prueba (name)
VALUES('Nako');

-- Actualizamos el nombre del usuario
UPDATE
    prueba
set
    name = 'Bocchi'
WHERE name = 'Aru2';

-- Seleccionamos todo de la tabla users
SELECT
    *
FROM
    prueba
LIMIT
    5 OFFSET 2;
    
-- Clausulas WHERE y Like Statements
select
    *
from
    prueba
where
    name like '%ru';
    
-- Eliminar registros
delete from
    prueba
where
    name like '%ru2';
    
-- Eliminar tabla
DROP TABLE prueba;

-- Truncar tabla/solo borra los registros
TRUNCATE TABLE prueba;

--Strings y Funciones
SELECT
    id,
    UPPER(name) as UPPER_name,
    LOWER(name) as lower_name,
    LENGTH(name) as LENGTH_name,
    (20 * 2) as constante,
    CONCAT(id,' - ', name),
    name
from
    users;
    
--Substring y position
SELECT
    name,
    SUBSTRING(name, 0, 5),
    POSITION(' ' in name),
    SUBSTRING(NAME, 0, POSITION(' ' in name)) as first_name,
    SUBSTRING(NAME, POSITION(' ' in name) + 1) as last_name,
    TRIM(SUBSTRING(NAME, POSITION(' ' in name) )) as trimmed_last_name
FROM
    users;
    
--tarea/ CAMBIAR EL FIRST_NAME Y LAST_NAME DE NULL A DATOS REALES
SELECT
    *
FROM
    users;
    
UPDATE
    users
set
    first_name = SUBSTRING(NAME, 0, POSITION(' ' in name)),
    last_name = SUBSTRING(NAME, POSITION(' ' in name) + 1);
SELECT
    *
FROM
    users;

















