/* Manejo de datos */

/*
Store procedure que permita ingresar un libro
*/

CREATE OR REPLACE PROCEDURE public.ingresar_libro(
	titulo_libro character varying,
	fecha_publicacion_libro date,
	isbn_libro integer)
LANGUAGE 'sql'
AS $BODY$
	insert into libro(titulo, fecha_publicacion, isbn)
	VALUES (titulo_libro, fecha_publicacion_libro, isbn_libro);
$BODY$;

/*
Store procedure que permita actualizar un libro
*/

CREATE OR REPLACE PROCEDURE public.actualizar_libro(
	libro_id integer,
	titulo_libro character varying,
	fecha_publicacion_libro date,
	isbn_libro integer)
LANGUAGE 'sql'
AS $BODY$
	update libro
	SET titulo = titulo_libro,
	fecha_publicacion = fecha_publicacion_libro,
	isbn = isbn_libro
	where id = libro_id;
$BODY$;

/*
Store procedure que permita eliminar un libro
*/

CREATE OR REPLACE PROCEDURE public.eliminar_libro(
	libro_id integer)
LANGUAGE 'sql'
AS $BODY$
	delete from libro
	where id = libro_id;
$BODY$;

-- Insert (POST)
Call ingresar_libro ('Cocina Italiana', '2019-03-05', 45678);

-- Update (PUT)
Call actualizar_libro(17, 'Cocina Italiana volumen 2', '2019-10-01', 45679);

-- Delete (DELETE)
Call eliminar_libro(17);
