/* FUNCIONES */
-- permite realizar operaciones que requieren que sean ejecutadas multiples veces
-- Difiere del store procedure ya que siempre retorna un valor
-- Para llamar a las funciones se utiliza select

/*
Ejemplo 1

Función que devuelve el total de usuarios
*/

create or replace function total_usuarios()
returns integer -- tipo de dato que retorna
language plpgsql
AS $$
DECLARE
	total integer := 0;
begin
	select count(*) into total from usuario;
	return total; -- retorna total que es un integer
end;
$$;

Select total_usuarios();

/*
Ejemplo 2

Función que devuelve una tabla con la información de un usuario
*/
create or replace function informacion_usuario(id_usuario integer default 1)
returns table ( -- Tipo tabla
    nombre varchar,
    apellido varchar,
    email varchar,
    telefono varchar)
language plpgsql
AS $$
begin
	return query -- retorna una query (va al comienzo)
	Select usuario.nombre, usuario.apellido, usuario.email, usuario.telefono
	from usuario
	where usuario.id = id_usuario;
end;
$$;

Select informacion_usuario(2);

Select * from informacion_usuario(2);