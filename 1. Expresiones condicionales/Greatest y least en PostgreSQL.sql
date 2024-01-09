/* GREATEST y LEAST */
-- GREATEST devuelve el valor más grande de una lista de valores
-- LEAST devuelve el valor más pequeño de una lista de valores
-- Todos los valores deben ser del mismo tipo de datos
-- Los null se ignoran
-- Retorna null si todos los valores son null

/* Ejemplo 1
    Devolver la fecha más reciente entre la fecha de devolución
    y la fecha real devuelta de cada libro
*/
Select
    prestamo.id,
    prestamo.usuario_id,
    prestamo_detalle.libro_id,
    greatest(prestamo.fecha_devolucion, prestamo_detalle.fecha_devuelto) -- Devuelve la fecha más reciente
from prestamo
left join prestamo_detalle on prestamo.id = prestamo_detalle.prestamo_id;

/* Ejemplo 2
   Ordenar a los usuarios escogiendo el menor de sus nombres o apellidos
   de forma ascendente
*/

Select nombre, apellido, LEAST(nombre, apellido) as order_nombre
from usuario
order by order_nombre;