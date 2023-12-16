

-- 1. Crear una llave primaria en city (id)
select * from city;
Alter table
    city
add
    PRIMARY KEY (id);

-- 2. Crear un check en population, para que no soporte negativos
select population from city;
alter table
    city
add
    CHECK(population >= 0);

-- 3. Crear una llave primaria compuesta en "countrylanguage"
-- los campos a usar como llave compuesta son countrycode y language
select * from countrylanguage;
Alter table
    countrylanguage
add
    PRIMARY KEY (countrycode, language);

-- 4. Crear check en percentage, 
-- Para que no permita negativos ni números superiores a 100

select percentage from countrylanguage;
alter table
    countrylanguage
add
    CHECK(percentage >= 0 and percentage <= 100);
