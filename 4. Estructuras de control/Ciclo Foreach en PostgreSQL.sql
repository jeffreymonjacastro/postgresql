/* bucle FOR EACH */
-- Es parecido al bucle FOR
-- Se utiliza para recorrer un array

/*
Ejemplo

Store procedure que sume los valores de un array
*/

CREATE OR REPLACE PROCEDURE public.suma_array(elementos numeric[], INOUT suma numeric DEFAULT 0)
LANGUAGE plpgsql
AS $$
DECLARE
	elemento integer := 0;
BEGIN
	foreach elemento in ARRAY $1 -- $1 es el primer parametro que recibe la funcion (el array)
	loop
		suma := suma + elemento;
	end loop;
END;
$$;

call suma_array(ARRAY[1,2,3,4,5]);
