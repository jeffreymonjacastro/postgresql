/* WITH */
-- Proporciona una forma de escribir declaraciones auxiliares para usar en una consulta más grande.
-- Es una clausula que permite crear una vista temporal en la consulta
-- Ayuda a dividir consultas complejas en partes más simples y legibles
-- Es una consulta CTE (Expresiones de Tabla Comunes)

/*
Ejemplo 1

Se desea obtener las veces que un libro ha sido prestado
y luego los datos de los libros
*/

-- Tabla temporal
With libro_presados as (
	-- Subquery: cantidad de veces que un libro ha sido prestado
	Select
		libro_id,
		sum(ejemplares) as total_prestados
	from prestamo_detalle
	group by libro_id
)

-- Query principal
Select
	libro.id,
	libro.titulo,
	libro_presados.total_prestados -- Se obtiene el dato de la tabla temporal
from libro
left join libro_presados on libro.id = libro_presados.libro_id;