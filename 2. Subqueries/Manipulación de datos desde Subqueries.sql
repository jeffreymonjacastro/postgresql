CREATE TABLE public.libro_clasico
(
    libro_id integer NOT NULL,
    titulo character varying(80),
    fecha_publicacion date,
    CONSTRAINT libro_clasico_pkey PRIMARY KEY (libro_id),
    CONSTRAINT "FK_LC_LIBRO" FOREIGN KEY (libro_id)
        REFERENCES public.libro (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
);


-- Se realiza una subconsulta para obtener los datos de los libros que se van a insertar en la tabla libro_clasico
-- También funciona para el UPDATE y DELETE

INSERT INTO libro_clasico (libro_id, titulo, fecha_publicacion)
select id, titulo, fecha_publicacion
from libro
where fecha_publicacion < '1970-01-01';