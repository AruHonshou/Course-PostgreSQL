--Correr primeroi la estructura y la data
--Funciones basicas de fechas
SELECT
    now(),
    CURRENT_DATE,
    CURRENT_TIME,
    date_part('hours', now()) as hours,
    date_part('minutes', now()) as minutes,
    date_part('seconds', now()) as seconds,
    date_part('days', now()) as days,
    date_part('months', now()) as months,
    date_part('years', now()) as years;
    
--Consultar fechas
SELECT
    *
FROM
    employees
WHERE
    hire_date > date('1998-02-05')
ORDER BY
    hire_date DESC;
    
SELECT
    max(hire_date) AS mas_nuevo,
    min(hire_date) AS primer_empleado
FROM
    employees;
    
SELECT
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1999-01-01'
    AND '2001-01-04'
ORDER BY
    hire_date DESC;
    
--INTERVALOS/ INTERVAL
SELECT
    max(hire_date),
    -- 	max(hire_date) + INTERVAL '1 days' as days,
    -- 	max(hire_date) + INTERVAL '1 month' as months,
    -- 	max(hire_date) + INTERVAL '1 year' as years,
    max(hire_date) + INTERVAL '1 years' + INTERVAL '1 day' AS years,
    date_part('year', now()),
    MAKE_INTERVAL(YEARS := date_part('year', now()) :: integer),
    max(hire_date) + MAKE_INTERVAL(YEARS := 23)
FROM
    employees;
--Diferencia entre fechas y actualizaciones + mini tarea
SELECT
    hire_date,
    MAKE_INTERVAL(
        YEARS := 2023 - EXTRACT(
            YEARS
            from
                hire_date
        ) :: integer
    ) as manual,
    MAKE_INTERVAL(
        YEARS := date_part('years', CURRENT_DATE) :: integer - EXTRACT(
            YEARS
            from
                hire_date
        ) :: integer
    ) as computed
FROM
    employees
order by
    hire_date desc;

--tarea
SELECT
	hire_date,
	hire_date + INTERVAL '23 years'		
FROM
	employees
order by hire_date desc;


UPDATE
	employees
SET
	hire_date = hire_date + INTERVAL '23 years';


--Clausula CASE-THEN
SELECT
	first_name,
	last_name,
	hire_date,
	CASE WHEN hire_date > now() - INTERVAL '1 year' THEN
		'Rango A'
	WHEN hire_date > now() - INTERVAL '3 year' THEN--Se sabe que si no es rango A, para el b es de 1 a 3 años
		'Rango B'
	WHEN hire_date > now() - INTERVAL '6 year' THEN
		'Rango C'
	ELSE
		'Rango D'
	END AS rango_antiguedad
FROM
	employees
ORDER BY
	hire_date DESC;

SELECT
	first_name,
	last_name,
	hire_date,
	CASE WHEN hire_date > now() - INTERVAL '1 year' THEN
		'1 año o menos'
	WHEN hire_date > now() - INTERVAL '3 year' THEN
		'1 a 3 años'
	WHEN hire_date > now() - INTERVAL '6 year' THEN
		'3 a 6 años'
	ELSE
		'+ de 6 años'
	END AS rango_antiguedad
FROM
	employees
ORDER BY
	hire_date DESC;



















