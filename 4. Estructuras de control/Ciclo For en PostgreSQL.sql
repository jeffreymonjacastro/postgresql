/* bucle FOR */
-- Se ejecuta un número determinado de veces

/*
Ejemplo

Store procedure que calcula el factorial de un número
*/

CREATE OR REPLACE PROCEDURE public.factorial(numero integer default 1, INOUT factorial numeric DEFAULT 1)
LANGUAGE plpgsql
AS $$
BEGIN
	for contador IN 1..numero  -- De 1 a n
		loop
			factorial := factorial * contador;
		end loop;
END;
$$;

CALL factorial(6);
