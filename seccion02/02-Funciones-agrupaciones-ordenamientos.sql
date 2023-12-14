select * FROM users;

--Utilizando el and y between
select
    first_name,
    last_name,
    followers
from
    users
where
    --     followers >= 4600
    --     AND followers <= 4700
    followers BETWEEN 4600
    and 4700
order by
    followers ASC;
    
--Funciones agregadas, max min count round AVG
select
    COUNT(*) as total_users,
    min(followers) as min_followers,
    max(followers) as max_followers,
    AVG(followers) as avg_followers,
    Round(AVG(followers)) as avg_followers_round,
    sum (FOLLOWERS) / COUNT(*) AS avg_manual
from
    users;
    
--GROUP BY/ORDER BY
SELECT
    first_name,
    last_name,
    followers
from
    users
where
    followers = 4
    or followers = 4999;
SELECT
    COUNT(*),
    followers
from
    users
where
    followers = 4
    or followers = 4999
GROUP BY
    followers
order by
    followers DESC;
    
--Having
SELECT
    count(*) as total,
    country
from
    users
GROUP BY
    country
HAVING
    count(*) > 5
order BY
    COUNT(*) ASC;
    
--Distinct/NO ES MUY EFICIENTE, LO ES SI ES CON DATAS UNICAS
select
    DISTINCT country
from
    users;
    
--Group By con otras funciones
SELECT
    count(*),
    SUBSTRING(email, POSITION('@' in email) + 1) as domain
FROM
    users
GROUP BY
    SUBSTRING(email, POSITION('@' in email) + 1)
HAVING
    count(*) > 1;
    
--Sub Query, son ineficientes, normalmente no queremos hacer esto
SELECT
    DOMAIN,
    total
FROM
    (
        SELECT
            count(*) as total,
            SUBSTRING(email, POSITION('@' in email) + 1) as domain
        FROM
            users
        GROUP BY
            SUBSTRING(email, POSITION('@' in email) + 1)
        HAVING
            count(*) > 1
    ) as email_domains;