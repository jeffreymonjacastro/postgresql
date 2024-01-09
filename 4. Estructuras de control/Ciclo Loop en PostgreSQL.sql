/* Ciclo LOOP */
-- Recorrer las declaraciones en bucle
-- el bucle loop es similar al while

/*
Ejemplo 1

Store procedure que devuelve la potencia de a^b
*/

CREATE OR REPLACE PROCEDURE public.potencia(num1 integer default 1, num2 integer default 1, INOUT resultado numeric DEFAULT 1)
LANGUAGE plpgsql
AS $$
DECLARE
	contador integer := 0;
BEGIN
	loop
		if contador = num2 then
			exit;
		end if;
		contador := contador + 1;
		resultado := resultado * num1;
	end loop;
END;
$$;

/*
CREATE OR REPLACE PROCEDURE public.potencia(num1 integer default 1, num2 integer default 1, INOUT resultado numeric DEFAULT 1)
LANGUAGE plpgsql
AS $$
BEGIN
	loop
		if num2 = 0 then
			exit;
		end if;
        num2 := num2 - 1;
		resultado := resultado * num1;
	end loop;
END;
$$;
*/

call potencia (4,3);