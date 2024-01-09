-- CASE EN POSTGRES
/* Hacer una consulta que halle los días de morosidad (demora) de los usuarios de la biblioteca */

Select
    prestamo.id,
    prestamo.usuario_id,
    prestamo_detalle.libro_id,
    DATE_PART('day', now()::timestamp - prestamo.fecha_devolucion::timestamp) as dias_morosidad,
-- Funciona como un if else, si se cumple la condicion se cumple lo que esta despues del THEN, si no se cumple se cumple lo que esta despues del ELSE
case
	when DATE_PART('day', now()::timestamp - prestamo.fecha_devolucion::timestamp) <= 1200 THEN 'Morosidad Baja'
	when DATE_PART('day', now()::timestamp - prestamo.fecha_devolucion::timestamp) <= 1300 THEN 'Morosidad Media'
	when DATE_PART('day', now()::timestamp - prestamo.fecha_devolucion::timestamp) > 1400 THEN 'Morosidad Alta'
end nivel_morosidad -- se coloca "end" y el nombre de la columna que se quiere mostrar
from prestamo
left join prestamo_detalle on prestamo.id = prestamo_detalle.prestamo_id -- Union de tablas
where prestamo_detalle.devuelto = false;