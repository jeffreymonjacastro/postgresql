/* EVENTOS */
-- Es muy útil para detectar cambios en los datos y realizar automáticamente las tareas posteriores
-- Events triggers ddl
-- Es una herramienta muy poderosa de auditoría y seguridad


CREATE TABLE autoria_logs(
    fecha TIMESTAMP,
    evento TEXT
);

/*
Ejemplo

Cada vez que se cree una tabla, se insertará un registro en la tabla autoria_logs
*/

-- Función que se ejecutará cada vez que se modifique un registro de la tabla
CREATE OR REPLACE FUNCTION logs_eventos()
RETURNS event_trigger -- retorna un evento
LANGUAGE plpgsql
AS $$
begin
    INSERT INTO autoria_logs(fecha,evento) VALUES(NOW(),TG_TAG);
end;
$$;

-- Crear el evento con la función
create event trigger event_trigger_logs on DDL_COMMAND_START
execute procedure logs_eventos();

-- Al crear una tabla se insertará un registro en la tabla autoria_logs
Create table editorial(
	id serial not null,
	nombre character varying (40) not null,
	primary key (id)
);