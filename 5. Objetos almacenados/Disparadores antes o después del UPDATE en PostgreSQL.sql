/*
El UPDATE es importante para validar los datos antes que se actualicen
*/

/*
Ejemplo

Validar el email de un usuario antes de ser actualizado
*/

-- Función que valida el email
CREATE OR REPLACE FUNCTION actualizar_email_usuario()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
DECLARE
	valido varchar;
BEGIN
	select new.email like '%_@_%.__%' into valido;

	if valido = 'true' then
		return new; -- Si es valido, se actualiza
	end if;
	return old; -- Si no es valido, no se actualiza
END;
$$;

-- Trigger que ejecuta la función antes de actualizar
create trigger actualizar_email_usuario_trigger before update on usuario
for each row execute procedure actualizar_email_usuario();

-- Actualizar el email
update usuario set email = 'test@testsssss.com' where id = 1;

/*
Ejemplo 2

Actualizar un libro clásico cuando se actualiza un libro
*/

-- Función que actualiza el libro clásico
CREATE OR REPLACE FUNCTION actualizar_libro_clasico()
  RETURNS TRIGGER
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
	update libro_clasico
	set titulo = new.titulo,
	fecha_publicacion = new.fecha_publicacion
	where libro_id = old.id;
	return new;
END;
$$;

-- Trigger que ejecuta la función después de actualizar
create trigger actualizar_libro_clasico_trigger after update on libro
for each row execute procedure actualizar_libro_clasico();

-- Actualizar el libro
update libro set titulo = 'Comienza un nuevo libro hoy' where id = 18;

