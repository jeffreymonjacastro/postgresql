/* WHILE */
-- Realiza una acción repetitiva mientras se cumpla una condición

/*
Ejemplo

Store procedure que permite sumar los números desde 1 hasta el número que se le pase como parámetro
*/

CREATE OR REPLACE PROCEDURE public.sumatoria(numero integer default 1, INOUT suma numeric DEFAULT 0)
LANGUAGE plpgsql
AS $$
DECLARE
	contador integer := 1;
BEGIN
	while contador <= numero -- Condición del bucle, si es TRUE se ejecuta el código del loop
	loop
		suma := suma + contador;
		contador := contador + 1;
	end loop;
END;
$$;


Call sumatoria(10);