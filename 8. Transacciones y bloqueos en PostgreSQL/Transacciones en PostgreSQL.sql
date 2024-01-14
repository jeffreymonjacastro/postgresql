/* TRANSACCIONES */
-- Es una unidad de trabajo que consta de una o más operaciones
-- Siguen el principio ACID:
    -- Atomicidad: La transacción se completa de una manera de todo o nada
    -- Consistencia: Los cambios hechos serán coherentes de un estado a otro
    -- (Isolation) Aislamiento: Dos transacciones sobre la misma información no generan errores
    -- Durabilidad: Una vez realizada la transacción, esta persistirá


-- Transacción
begin;
    update libro
    set fecha_publicacion = '1967-06-05'
    where id = 3;

    update libro_clasico
    set fecha_publicacion = '1967-06-05'
    where libro_id = 3;
commit;

select * from libro where id = 3;