/* COALESCE */
-- Devuelve el primer valor no nulo de una lista de argumentos
-- Evalúa de izquierda a derecha
-- Si todos los argumentos son nulos, se obtiene un null
-- La función coalesce es equivalente a un CASE, pero más concisa

Select coalesce(null, 45, 51);


-- Cuando no se usa coalesce, se obtiene un null
Select
    prestamo_id,
    libro_id,
    mora
from prestamo_detalle;

-- Cuando se usa coalesce, si un valor es null, se obtiene un 0 o valor por defecto
Select
    prestamo_id,
    libro_id,
    coalesce(mora,0) -- En caso mora sea null, se obtiene un 0
from prestamo_detalle;
