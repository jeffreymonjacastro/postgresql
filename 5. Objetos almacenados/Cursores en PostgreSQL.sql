/* CURSORES */
-- permite capturar una consulta y procesar cada fila
-- se utiliza para dividir un conjunto en partes
-- es ideal para retornar un conjunto de datos de una tabla
-- cuando se ejecuta un cursor, se ejecuta en la consola como mensaje

/*
Ejemplo

Función que procese los titulos de los libros
*/

create or replace function titulo_libro()
returns void -- no retorna nada
language plpgsql
as $$
declare
    registro RECORD; -- variable de tipo registro
    cursor_libro CURSOR for -- variable de tipo cursor
        select titulo
        from libro
        order by titulo;
begin
    open cursor_libro; -- abre el cursor
    fetch cursor_libro into registro; -- obtiene el primer registro
    while found
    loop
        raise notice 'PROCESANDO %', registro.titulo; -- muestra el titulo del libro
        fetch cursor_libro into registro; -- obtiene el siguiente registro
    end loop;
    close cursor_libro; -- cierra el cursor
    return;
end;
$$;

Select titulo_libro();
