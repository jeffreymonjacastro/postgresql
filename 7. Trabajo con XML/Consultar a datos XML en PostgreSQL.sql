/* Visualizar datos en xml */
-- unnest() Expande un array a una lista de filas
-- xpath() Devuelve una matriz de valores xml correspondiente al conjunto de nodos

insert into comentario (detalle) values ('<?xml version="1.0"?>
<comentario>
    <libro>Descubre el maravilloso mundo de las flores</libro>
    <comentario>Muy interesante</comentario>
    <usuario>
        <nombre>Manuel</nombre>
        <apellido>Walsh</apellido>
        <email>manuelwalsh@test.com</email>
    </usuario>
</comentario>');


insert into comentario (detalle) values ('<?xml version="1.0"?>
<comentario>
    <libro>Aprende un nuevo deporte en 21 días</libro>
    <comentario>Es muy práctico</comentario>
    <usuario>
        <nombre>George</nombre>
        <apellido>Weissnat</apellido>
        <email>georgeweissnat@test.com</email>
    </usuario>
</comentario>');

-- Consultar el campo xml
Select detalle from comentario;

/*
Sintaxis

select unnest(xpath(<xpath>, <columna>)) as nombre_campo
from <tabla>
where <condicion (id)>
*/

-- Extraer solo la información del usuario
Select unnest(xpath('//usuario', detalle)) AS usuario
from comentario
where id = 3;

-- Extraer solo el nombre del usuario
Select unnest(xpath('//usuario/nombre', detalle)) AS nombre
from comentario
where id = 3;

-- Extraer la información del libro
Select unnest(xpath('//libro', detalle)) AS libro
from comentario
where id = 3;