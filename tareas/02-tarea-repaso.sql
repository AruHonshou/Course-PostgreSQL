-- Nombre, apellido e IP, donde la última conexión se dió de 221.XXX.XXX.XXX
select
    *
from
    users;
select
    first_name,
    last_name,
   	last_connection
from
    users
where
    last_connection like '211.%';


-- Nombre, apellido y seguidores(followers) de todos a los que lo siguen más de 4600 personas

select
    users.first_name,
    users.last_name,
   	users.followers
from
    users
where
    followers >= 4600
