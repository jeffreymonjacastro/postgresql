/* Disparadores / Triggers */
-- Un Trigger es una función que se invoca automáticamente cuando se produce un evento (INSERT, UPDATE, DELETE) en la base de datos.
-- Un trigger se asocia a una tabla específica

/*
Ejemplo

Trigger que cambia la primera letra del nombre y apellido de un autor a mayúscula
*/

-- Función que se va a invocar cuando se inserte un nuevo autor
create or replace function before_insertar_autor()
	returns trigger -- retorna un trigger
	language plpgsql
as $$
begin
    -- new es una variable que contiene los valores que se van a insertar
	new.nombre := concat(upper(substring(new.nombre, 1, 1)), substring(new.nombre,2));
	new.apellido := concat(upper(substring(new.apellido, 1, 1)), substring(new.apellido,2));
	return new;
end;
$$;


-- Creación del trigger antes del insert
create trigger insertar_autor_trigger before insert on autor
for each row execute procedure before_insertar_autor();

-- Al insertar los valores en minúscula, el trigger se encarga de cambiarlos a mayúscula
insert into autor(nombre, apellido)
values ('juan', 'rojas');

/*
Ejemplo 2

Trigger que inserta un nuevo registro en la tabla libro_clasico cuando se inserta un nuevo libro con fecha de publicación menor a 1970
*/

-- Función que se va a invocar cuando se inserte un nuevo autor
create or replace function insertar_libro_clasico()
returns trigger -- retorna un trigger
language plpgsql
as
$$
begin
	if new.fecha_publicacion < '1970-01-01' then
		insert into libro_clasico(libro_id, titulo, fecha_publicacion)
		values (new.id, new.titulo, new.fecha_publicacion);
	end if;
	return new;
end;
$$;

-- Creación del trigger después del insert
create trigger insertar_libro_clasico_trigger after insert on libro
for each row execute procedure insertar_libro_clasico();

-- Al insertar un nuevo libro antiguo, se inserta un nuevo registro en la tabla libro_clasico
insert into libro(titulo, fecha_publicacion, isbn) values ('Comienza un nuevo libro', '1960-03-20', 34213);




