/* Modificar JSON */

/*
Para actualizar un valor directo
Sintaxis:

update <tabla>
set <columna> = jsonb_set (<columna>, <llave>, <valor>)
where <condicion>
*/
Update orden
set informacion = jsonb_set (informacion, '{nombre}', '"Nancy Monge Rojas"')
where id = 1;

update orden
set informacion = jsonb_set (informacion, '{direccion}', '"Alajuela, Costa Rica"')
where id = 3;

/*
Para poder actualizar un elemento de un arreglo

Sintaxis:

update <tabla>
set <columna> = jsonb_set (<columna>, <llave, posicion, llave>, <valor>)
where <condicion>
*/
Update orden
set informacion = jsonb_set (informacion, '{libros, 0, titulo}', '"Creación de aviones modernos"')
where id = 2;