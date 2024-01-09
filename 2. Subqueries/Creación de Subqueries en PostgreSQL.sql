/* SUBQUERIES / SUBCONSULTAS */
-- Es una consulta sql anidada dentro de otra consulta grande
-- La subconsulta se ejecuta primero y luego se ejecuta la consulta grande
-- Generalmente la subconsulta se coloca dentro del where de otra instrucción select
-- Se utiliza para hacer consultas mas complejas
/*
Ejemplo 1

Obtener el promedio del monto de mora de los prestamos
y luego hallar los prestamos que tengan una mora mayor al promedio
*/

-- Query grande
Select
	prestamo_id,
	libro_id,
	ejemplares,
	mora
from prestamo_detalle
where mora > (
	-- Subquery: se obtiene el promedio de la mora
	Select avg(mora)
	from prestamo_detalle
);