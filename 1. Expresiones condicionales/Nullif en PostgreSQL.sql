/* NULLIF */
-- Devuelve null si los valores son iguales, de lo contrario, devuelve el primer valor
Select nullif(1, 1);
Select nullif(1, 2);
Select nullif('texto1', 'texto1');

-- Ejemplo

/*
En la db, la tabla prestamo contiene la fecha de devolucion del prestamo,
y la tabla prestamo_detalle contiene la fecha real en que se devolvio el libro

Si la fecha de devolucion es mayor a la fecha real en que se devolvio el libro,
no se cobra ningún monto por morosidad
*/

Select
    prestamo.id,
    prestamo.usuario_id,
    prestamo_detalle.libro_id,
    prestamo.fecha_devolucion,
    prestamo_detalle.fecha_devuelto,
    nullif (prestamo.fecha_devolucion, prestamo_detalle.fecha_devuelto),
    coalesce (mora, 0) as mora
from prestamo
left join prestamo_detalle on prestamo.id = prestamo_detalle.prestamo_id
where prestamo_detalle.devuelto = true;