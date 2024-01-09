/* EXISTS */
-- Es un operador booleano que prueba la existencia de una fila en una subconsulta.
-- Si la subconsulta devuelve al menos una fila, el resultado es TRUE, si no, es FALSE.
-- La lista de salida de la subconsulta no es importante (SELECT 1)

/*
Ejemplo 1:

Obtener la información completa de los usuarios que se encuentran morosos
*/

Select *
from usuario
where Exists (
	Select 1  -- Aquí no importa el valor, solo que exista al menos una fila
	from prestamo
	left join prestamo_detalle on prestamo_detalle.prestamo_id = prestamo.id
	where prestamo_detalle.devuelto = false
	and usuario.id = prestamo.usuario_id
);

/* NOT EXISTS */
-- Opuesto al EXISTS
-- Si la subconsulta devuelve al menos una fila, el resultado es FALSE, si no, es TRUE.

/*
Ejemplo 2

Encontrar la información completa de los usuarios que no se encuentran morosos
*/

Select *
from usuario
where NOT Exists (
	Select 1  -- Aquí no importa el valor, solo que exista al menos una fila
	from prestamo
	left join prestamo_detalle on prestamo_detalle.prestamo_id = prestamo.id
	where prestamo_detalle.devuelto = false
	and usuario.id = prestamo.usuario_id
);