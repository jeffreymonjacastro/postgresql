/* parámetros VARIADIC */
-- se define como tipo array
-- se usa cuando no se sabe cuantos parámetros se van a enviar

/*
Ejemplo 1:

store procedure que recibe un array de enteros y devuelve el mayor de ellos
*/

Create or replace procedure maximo_valor(inout _valor integer default null, variadic arr numeric[] default null)
language plpgsql as
$$
	begin
		select max($2[i]) -- $2 es el segundo argumento (array), i es el indice del array
		-- generate_subscripts devuelve un array de indices
		-- $2 se refiere al segundo argumento y 1 es la dimensión de la matriz
		-- g(i) es el alias de la tabla
		from generate_subscripts($2,1) g(i) into _valor;
	end
$$;

call maximo_valor(0, variadic array[10,-2,5,8,91]);