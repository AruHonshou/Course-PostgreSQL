-- Clausula union
select
    code,
    name,
    '123'
from
    continent
where
    name LIKE '&America%'
UNION
select
    1,
    'otra cosa',
    name
from
    continent
WHERE
    code in (3, 5)
order by
    NAME ASC;
-- Union de tablas/no se recomienda usar
select
    a.name as countrylanguage,
    b.name as continent
from
    country a,
    continent b
where
    a.continent = b.code ORDER BY a.name asc;
--inner JOIN
select
    a.name as country,
    b."name" as continent
from
    country a
    INNER JOIN continent b on a.continent = b.code
ORDER BY
    a."name" ASC;
    
--Alterar secuencias/agregando North Asia, Central Asia, South Asia a los nombres de los continentes de la tabla continent/name
alter SEQUENCE 'seq name' RESTART with 8;

--FULLOUTER JOIN, vemos los registros que estan incompletos
select
    a.name as country,
    a.continent as continentCode,
    b.name as continentName
from
    country a
    FULL OUTER JOIN continent b on a.continent = b.code
ORDER BY
    a."name" DESC;
--Right Join con exclusion
select
    a.name as country,
    a.continent as continentCode,
    b.name as continentName
from
    country a
    RIGHT JOIN continent b on a.continent = b.code
where
    a.name is NULL
ORDER BY
    a."name" DESC;
--Inner Join + COUNT
select
    COUNT(*),
    b.name
FROM
    country a
    INNER JOIN continent b on a.continent = b.code
group by
    b."name"
ORDER BY
    COUNT(*) ASC;



-- ¿Quiero saber los idiomas oficiales que se hablan por continente?

select * from countrylanguage where isofficial = true;

select * from country;

select * from continent;

select distinct d.name, c."name" as continent from countrylanguage a 
inner JOIN country b ON a.countrycode = b.code
inner join continent c on b.continent = c.code
inner join "language" d on d.code = a.languagecode
where a.isofficial = true;


select * from countrylanguage;

-- ¿Cuantos idiomas oficiales se hablan por continente?
select count(*), continent from (
	select distinct a."language", c."name" as continent from countrylanguage a 
	inner JOIN country b ON a.countrycode = b.code
	inner join continent c on b.continent = c.code
	where a.isofficial = true
) as totales
group by continent;

