/* VIEWS */
-- Son tablas virtuales que se crean a partir de una consulta
-- No almacenamos datos físicamente, solo información de otras tablas
-- Se pueden usar para simplificar consultas complejas
-- Es una consulta alamacenada

/*
Ejemplo

Crear una vista que muestre la información de los prestamos

*/
Create or replace view informacion_prestamo AS
select -- Consulta
	prestamo.id,
	usuario.nombre,
	usuario.apellido,
	libro.titulo,
	prestamo.fecha_salida,
	prestamo.fecha_devolucion,
	case prestamo_detalle.devuelto
        when 'true' then 'Si'
        when 'false' then 'No'
	end devuelto,
	case
        when prestamo_detalle.mora isnull then 0
        else prestamo_detalle.mora
	end mora
from prestamo
left join prestamo_detalle on prestamo_detalle.prestamo_id = prestamo.id
left join usuario on prestamo.usuario_id = usuario.id
left join libro on prestamo_detalle.libro_id = libro.id;

-- Consultar la vista
select * from informacion_prestamo;

-- Eliminar la vista
-- drop view informacion_prestamo;