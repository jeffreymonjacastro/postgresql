/* STORE PROCEDURES */
-- Sirven para almacenar instrucciones en unidades lógicas
-- Difiere de una función, ya que no retorna un valor, sino que ejecuta una serie de instrucciones

/*
Sintaxis:

CREATE (OR REPLACE) PROCEDURE <nombre> (Parámetros tipados) -- puede aceptar 0 o más parámetros
LANGUAGE <lenguaje> -- sql, cinternal, plpgsql
AS $$
    <instrucciones>
$$;

Ejemplo 1

STORE PROCEDURE para cambiar el email de un usuario
*/
CREATE OR REPLACE PROCEDURE public.actualizar_email_usuario(usuario_id integer, nuevo_email character varying)
LANGUAGE sql
AS $$
    update usuario set email = nuevo_email where id = usuario_id;
$$;

/*
Llamar un procedimiento

CALL <nombre>(<argumentos en orden>);
*/

CALL actualizar_email_usuario(1, 'test@test.com');