/* Excepciones */
-- Los store procedures pueden generar excepciones para manejar errores para el usuario
-- Error de tipo de dato, sintaxis, entre otros

/*
Store procedure que ingresa un libro a la tabla libro
*/

CREATE OR REPLACE PROCEDURE public.ingresar_libro_id(
	id_libro integer,
	titulo_libro character varying,
	fecha_publicacion_libro date,
	isbn_libro integer)
LANGUAGE plpgsql
AS $$
BEGIN
    insert into libro(id, titulo, fecha_publicacion, isbn)
	VALUES (id_libro, titulo_libro, fecha_publicacion_libro, isbn_libro);
	EXCEPTION
		when sqlstate '23505' -- Poner el tipo de error
		then raise exception 'Libro con el ID: % ya existe XD', id_libro; -- El % es el parametro que se le pasa al raise exception
END;
$$;

call ingresar_libro_id(1, 'Desarrollo Profesional', '2017-04-20', 98765);
