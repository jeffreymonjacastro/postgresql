/* IN */
-- Devuelve los valores que coinciden con los valores de una lista o subconsulta
-- Se utiliza seguido de un WHERE

/*
Ejemplo 1

Info de aquellos libros después del 1ro de marzo del 2020
*/

Select *
from libro
where
	id IN ( -- Esta subconsulta devuelve solamente una columna (lista)
		Select prestamo_detalle.libro_id as id
		from prestamo
		left join prestamo_detalle on prestamo_detalle.prestamo_id = prestamo.id
		where fecha_salida > '2020-03-01'
	)
order by id;

/* IN */
-- Devuelve los valores que no coinciden con los valores de una lista o subconsulta
-- Se utiliza seguido de un WHERE

/*
Ejemplo 2

Info de aquellos libros antes del 1ro de marzo del 2020
*/

Select *
from libro
where
	id NOT IN ( -- Esta subconsulta devuelve solamente una columna (lista)
		Select prestamo_detalle.libro_id as id
		from prestamo
		left join prestamo_detalle on prestamo_detalle.prestamo_id = prestamo.id
		where fecha_salida > '2020-03-01'
	)
order by id;