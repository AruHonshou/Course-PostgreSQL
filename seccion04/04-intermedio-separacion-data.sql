-- Crear tabla continente / continent
select
    DISTINCT continent
from
    country
ORDER BY
    continent ASC;
    
--insertamos data en la tabla continent
insert into
    continent (name)
select
    DISTINCT continent
from
    country
ORDER BY
    continent ASC;
select
    *
from
    continent;
    
--vamos a crear una copia de la tabla country
--siempre que haremos cambios en produccion, es recomendable crear una copia y hacer todo en la copia

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."country_copy" (
    "code" bpchar(3) NOT NULL,
    "name" text NOT NULL,
    "continent" text NOT NULL,
    "region" text NOT NULL,
    "surfacearea" float4 NOT NULL,
    "indepyear" int2,
    "population" int4 NOT NULL,
    "lifeexpectancy" float4,
    "gnp" numeric(10,2),
    "gnpold" numeric(10,2),
    "localname" text NOT NULL,
    "governmentform" text NOT NULL,
    "headofstate" text,
    "capital" int4,
    "code2" bpchar(2) NOT NULL,
    PRIMARY KEY ("code")
);

--Pasamos la data de country a su copia
insert into
    country_copy
select
    *
from
    country;
    
--Eliminamos el check de country
select * from country;
alter table country drop CONSTRAINT country_continent_check;
    
--subQuery
select
    a.name,
    a.continent,
    (
        SELECT
            name
        from
            continent b
        WHERE
            b.name = a.continent
    )
from
    country a;
    
--Actualizacion masiva a country
update
    country a
set
    continent = (
        SELECT
            "code"
        from
            continent b
        WHERE
            b.name = a.continent
    );

select * from country;

--Cambiamos la tabla country, cambiamos la columna continent a tipo int4
ALTER table
    country
alter column
    continent TYPE int4 USING continent :: integer;
    
-- Asegurar que la columna referenciada tenga una restricción única
CREATE UNIQUE INDEX idx_unique_code ON "public"."continent" ("code");

-- Agregar la clave externa en la tabla "country"
ALTER TABLE
    "public"."country"
ADD
    FOREIGN KEY ("continent") REFERENCES "public"."continent" ("code");

 
 
 
 
 