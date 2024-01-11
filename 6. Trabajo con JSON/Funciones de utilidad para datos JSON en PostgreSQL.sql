/* Funciones para JSON */

/*
Extraer cada elemento del JSON a un conjunto de pares clave-valor.

json_each() es una función de conjunto que toma un valor JSON y devuelve un conjunto de pares clave-valor.
*/
Select * from json_each(
    (Select to_json(informacion)
     from orden
     where id = 1)
);

-- Con jsonb
Select * from jsonb_each(
    (Select informacion
     from orden
     where id = 1)
);

-- Para devolver el valor en formato texto
Select * from jsonb_each_text(
    (Select informacion
     from orden
     where id = 1)
);

-- Para extraer un elemento del JSON
Select jsonb_extract_path(informacion, 'libros')
from orden;

-- Para extraer un elemento del JSON en formato texto
Select jsonb_extract_path_text(informacion, 'libros')
from orden;

-- Para extraer los tamaños de los elementos del JSON
select jsonb_array_length(informacion->'libros')
from orden;