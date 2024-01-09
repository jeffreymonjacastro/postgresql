/* parámetros IN store procedure */
-- Un tipo de parámetros que acepta un STORE PROCEDURE es el IN, que es el tipo de argumento por defecto si se omita

/*
Ejemplo 1

STORE PROCEDURE para insertar un nuevo libro en la tabla libro
*/

create or replace procedure ingresar_libro(IN titulo_libro Character varying, IN fecha_publicacion_libro date, isbn_libro integer)
language SQL
as $$
	insert into libro(titulo, fecha_publicacion, isbn) values (titulo_libro, fecha_publicacion_libro, isbn_libro);
$$;

call ingresar_libro('Cocina Italina', '2019-03-05', 45678);