/* DELETE */

/*
Ejemplo

Eliminar un libro y que se elimine de la tabla libro_clasico
*/


CREATE OR REPLACE FUNCTION eliminar_libro_clasico()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    delete from libro_clasico where libro_id = old.id;
    return old;
END;
$$;

-- Trigger que se ejecuta antes de eliminar un libro
create trigger eliminar_libro_clasico_trigger before delete on libro
for each row execute procedure eliminar_libro_clasico();

-- Al eliminar un libro se elimina de la tabla libro_clasico también
delete from libro where id = 19;