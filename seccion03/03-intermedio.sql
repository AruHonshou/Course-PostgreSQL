--Creando una primary key a code a la tabla country
select * from country;
Alter table
    country
add
    PRIMARY KEY (code);
select
    *
from
    country
where
    code = 'NLD';
DELETE from
    country
where
    code2 = 'NA';

--constrain CHECK
select * from country;

alter table country add CHECK(
	surfacearea >= 0
);

--Creamos un check 
select
    DISTINCT continent
from
    country;
alter table
    country
add
    CHECK (
        (continent = 'Asia' :: text)
        or (continent = 'South America' :: text)
        or (continent = 'North America' :: text)
        or (continent = 'America' :: text)
        or (continent = 'Oceania' :: text)
        or (continent = 'Antarctica' :: text)
        or (continent = 'Africa' :: text)
        or (continent = 'Europe' :: text)
        or (continent = 'Central America' :: text)
    );
select * FROM country where code = 'CRI';

--Eliminamos el check creado
alter table
    country drop CONSTRAINT "country_continent_check";
    
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.
-- Table Definition
CREATE TABLE "public"."country" (
    "code" bpchar(3) NOT NULL,
    "name" text NOT NULL,
    "continent" text NOT NULL,
    "region" text NOT NULL,
    "surfacearea" float4 NOT NULL,
    "indepyear" int2,
    "population" int4 NOT NULL,
    "lifeexpectancy" float4,
    "gnp" numeric(10, 2),
    "gnpold" numeric(10, 2),
    "localname" text NOT NULL,
    "governmentform" text NOT NULL,
    "headofstate" text,
    "capital" int4,
    "code2" bpchar(2) NOT NULL,
    PRIMARY KEY ("code")
);


--Indices

SELECT * from country where continent = 'Africa';

create UNIQUE index "unique_conutry_name" on country (
	--columna o columnas
	name
);

create index "country_continent" on country (
	--columna o columnas
	continent
);


--Unique index-problemas de la vida real
select * from city where name = 'Jinzhou' and countrycode = 'CHN' and district = 'Liaoning';

create unique index "unique_name_countrycode_district" on city (
	name, countrycode, district
);

create index "index_district" on city (
	district
);
--creando llaves foraneas
alter table
    city
add
    CONSTRAINT fk_country_code FOREIGN KEY (countrycode) REFERENCES country(code);--on delete cascade

--no existe AFG ni tampoco NAM, aqui se crea:
INSERT INTO
    country
values(
        'AFG',
        'Afghanistan',
        'Asia',
        'Southern Asia',
        652860,
        1919,
        40000000,
        62,
        69000000,
        NULL,
        'Afghanistan',
        'Totalitarian',
        NULL,
        NULL,
        'AF'
    );
insert into
    country
values(
        'NAM',
        'Namibia',
        'Africa',
        'Africa Austral',
        825625,
        1990,
        2606971,
        65.1,
        12800000.00,
        13300000.00,
        'Namibia',
        'Presidencialist Republic',
        'Hage Geingob',
        2,
        'NA'
    );


--Llave foranea con countrylanguage
alter table
    countrylanguage
add
    CONSTRAINT fk_country_code FOREIGN KEY (countrycode) REFERENCES country(code);--on delete cascade


--on delete cascade
select * from country where code = 'AFG';
select * from city where countrycode = 'AFG';
select * from countrylanguage where countrycode = 'AFG';
DELETE from country where code = 'AFG';








