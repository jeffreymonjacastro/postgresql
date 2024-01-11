/* Consultar datos JSON */


insert into orden (informacion) values ('{"nombre":"Juan Rojas","telefono":"(123) 3444-5667","email":"juanrojas@test.com","libros":[{"titulo":"Creación de aviones","autor":"Alina Castaño"}]}');
insert into orden (informacion) values ('{"nombre":"Luis Vargas","telefono":"(123) 2345-7540","email":"luisvargas@test.com","libros":[{"titulo":"Cocina oriental","autor":"Jose Carlos Castello"}]}');


-- Extrae los datos de la columna informacion en tipo json
Select informacion from orden;

-- Extrae los datos en tipo jsonb
Select informacion->'nombre' from orden;

-- Extrae los datos en tipo texto
Select informacion->>'nombre' from orden;

-- Extrae la lista de los libros en tipo jsonb
select informacion->'libros' from orden;

-- Extrae el primer valor del array
select informacion->'libros'->0 from orden;

-- Extrae el titulo del primer valor del array en tipo texto
select informacion->'libros'->0->>'titulo' from orden;

