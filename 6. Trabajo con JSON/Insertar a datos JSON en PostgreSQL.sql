/* JSON */
-- JavaScript Object Notation
-- Clave - Valor
-- Sirve para transportar datos entre aplicaciones
-- tipo de dato json y jsonb
-- json almacena una copia exacta de la cadena de texto
-- jsonb almacena una representación binaria de la cadena de texto y acepta indexación (más eficiente)

/*
Ejemplo

Se crea una tabla para almacenar ordenes de libros de los usuarios
*/
CREATE TABLE public.orden
(
    id serial NOT NULL,
    informacion jsonb NOT NULL, -- jsonb es el tipo de dato para almacenar JSON
    PRIMARY KEY (id)
);

-- Se inserta un registro de tipo JSON
insert into orden (informacion) values (
    '{
      "nombre":"Nancy Monge",
      "telefono":"(123) 4254-2345",
      "email":"nancymonge@test.com",
      "libros":[
        {
          "titulo":"Cocina oriental",
          "autor":"Luis Ruiz"
        },
        {
          "titulo":"Datos orientales más recientes",
          "autor":"Juan Herrera"
        }
      ]
    }'
);