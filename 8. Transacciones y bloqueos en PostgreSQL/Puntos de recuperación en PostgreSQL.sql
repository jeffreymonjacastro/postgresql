/* PUNTO DE RECUPERACIÓN */
-- Es una marca dentro de una transacción que permite volver a un punto anterior en caso de error

begin;
    delete from usuario where id = 20;

    savepoint eliminar_usuario; -- marca el punto de recuperación
        delete from usuario where id = 21;
        select * from usuario order by id;
    rollback to savepoint eliminar_usuario; -- vuelve al punto de recuperación

select * from usuario order by id;
