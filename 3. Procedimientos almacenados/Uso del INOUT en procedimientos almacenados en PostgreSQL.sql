/* parámetros INOUT store procedures*/
-- inout son inicializados con un valor antes de invocar el store procedure
-- dicho valor puede ser modificado dentro del store procedure


/*
Ejemplo 1

STORE PROCEDURE para buscar un libro por su título
*/

create or replace procedure buscar_libro_titulo(INOUT _valor text default null)
language plpgsql as
$$
    begin
        select titulo
        from libro
        where titulo like _valor into _valor;
    end
$$;

call buscar_libro_titulo('%el%');