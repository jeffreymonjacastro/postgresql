/* ANY, SOME, ALL */
-- Son operadores de comparación con un conjunto de valores devueltos por una subconsulta
-- Deben estar precedidos por un operador de comparación (>, < >=, <=, =, <>, !=)
-- ANY y SOME son equivalentes
-- El operador ALL es TRUE si la comparación es TRUE para todos los valores de la subconsulta

/*
Ejemplo 1

Info de los libros que han sido prestados más de 20 veces
*/

Select *
from libro
where id = SOME ( -- ANY == SOME
	Select libro_id as id
	from prestamo_detalle
	group by libro_id
	having sum(ejemplares) > 20
);

/*
Ejemplo 2

Obtener la info de aquellos usuarios que tienen mayor morosidad que el promedio
*/
select
	prestamo.id,
	prestamo.usuario_id,
	usuario.nombre,
	usuario.apellido,
	avg(date_part('day', now()::timestamp - prestamo.fecha_devolucion::timestamp)) as promedio_dias_morosidad
from prestamo
left join usuario on usuario.id = prestamo.usuario_id
group by prestamo.id,usuario.nombre,usuario.apellido
having avg(date_part('day', now()::timestamp - prestamo.fecha_devolucion::timestamp)) > all (
	select avg(date_part('day', now()::timestamp - prestamo.fecha_devolucion::timestamp))
	from prestamo
	left join prestamo_detalle on prestamo_detalle.prestamo_id = prestamo.id
	where prestamo_detalle.devuelto = false
	group by usuario_id
);