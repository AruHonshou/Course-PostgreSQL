

-- Tarea con countryLanguage

-- Crear la tabla de language

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS language_code_seq;


-- Table Definition
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT 	nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- Crear una columna en countrylanguage
ALTER TABLE countrylanguage
ADD COLUMN languagecode varchar(3);

--Add data en la tabla language columna name que viene de la tabla countrylanguage de la tabla language
insert into language (name)
select
    DISTINCT "language"
from
    countrylanguage
ORDER BY
    "language" ASC;
    
SELECT * from LANGUAGE;


-- Empezar con el select para confirmar lo que vamos a actualizar
select
    a."language",
    (
        SELECT
            code
        from
            "language" b
        WHERE
            a."language" = b."name"
    )
from
    countrylanguage a;


-- Actualizar todos los registros de la tabla conutrylanguage a la columna languagecode
update
    countrylanguage a
set
    languagecode = (
        SELECT
            code
        from
            "language" b
        WHERE
            a."language" = b."name"
    );


-- Cambiar tipo de dato en countrylanguage - languagecode por int4
ALTER table
    countrylanguage
alter column
    languagecode TYPE int4 USING languagecode :: integer;


-- Crear el forening key y constraints de no nulo el language_code
ALTER TABLE "public"."countrylanguage" ADD FOREIGN KEY ("languagecode") REFERENCES "public"."language" ("code");

-- Revisar lo creado
SELECT * from countrylanguage;
