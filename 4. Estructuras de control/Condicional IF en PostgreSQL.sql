/* IF ELSE */
-- Permite ejecutar una sentencia o bloque de sentencias si se cumple una condición


/*
Ejemplo 1

Store procedure que recibe un id de libro y devuelve un mensaje (popularidad) de acuerdo a la cantidad de ejemplares prestados
*/

CREATE OR REPLACE PROCEDURE public.popularidad_libro( id_libro integer default 1, INOUT mensaje text DEFAULT null)
LANGUAGE plpgsql
AS $$
DECLARE -- Declaración de variables, se utiliza := para asignar un valor
	num_ejemplares integer := 0;
BEGIN
   	Select
	sum(ejemplares)
	from prestamo_detalle
	where libro_id = id_libro
	group by libro_id
	into num_ejemplares;

	if num_ejemplares <= 5 then
		mensaje := 'Poco popular';
	elsif num_ejemplares <= 20 then
		mensaje := 'Medio popular';
	elsif num_ejemplares > 20 then
		mensaje := 'Muy popular';
	else
		mensaje := 'N/A';
	end if;
END;
$$;

Call popularidad_libro(18);

