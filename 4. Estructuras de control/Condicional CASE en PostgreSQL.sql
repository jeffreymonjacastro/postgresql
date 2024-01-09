/* CASE */
-- Es similar a if then else pero en una sola linea
-- CASE WHEN condicion THEN resultado ELSE resultado END CASE

/*
Ejemplo 1

Store procedure que recibe un id de prestamo y devuelve la cantidad a pagar según los dias de morosidad
*/

Select
    prestamo.id,
    DATE_PART('day', now()::timestamp - prestamo.fecha_devolucion::timestamp) as dias_morosidad
from prestamo
left join prestamo_detalle on prestamo.id = prestamo_detalle.prestamo_id
where prestamo_detalle.devuelto = false
group by prestamo.id
order by dias_morosidad desc;

CREATE OR REPLACE PROCEDURE public.pago_morosidad(id_prestamo integer default 1, INOUT monto numeric DEFAULT 0)
LANGUAGE plpgsql
AS $$
BEGIN
   	Select
	DATE_PART('day', now()::timestamp - prestamo.fecha_devolucion::timestamp) as dias_morosidad
	from prestamo
	left join prestamo_detalle on prestamo.id = prestamo_detalle.prestamo_id
	where prestamo_detalle.devuelto = false and prestamo.id = id_prestamo
	group by prestamo.id
	into monto;

	case
        when monto <= 1100 then monto := monto * 2;
        when monto <= 1150 then monto := monto * 2.5;
        when monto <= 1200 then monto := monto * 3;
        when monto > 1200 then monto := monto * 4;
        else monto := 0;
	end case;
END;
$$;

call pago_morosidad(49);