/* Funciones para manejar datos xml */

-- Funcion para concatenar datos xml para crear un valor único xml
Select xmlconcat (detalle, '<biblioteca>Central</biblioteca>')
from comentario
where id =1;

-- Funcion para producir un valor xml a partir de un texto
Select xmlparse(CONTENT detalle::text)
from comentario;

-- Similarl a la anterior pero especifica que el texto es un documento xml
Select xmlparse(DOCUMENT detalle::text)
from comentario;

-- Función para alterar el nodo raíz y especifica la versión y si es independiente
SELECT xmlroot(xmlparse(document detalle::text), version '1.0', standalone yes)
from comentario;

-- Función que concatena las filas de los valores de entrada en una sola
select xmlagg(detalle order by id desc)
from comentario;

-- Función que valida si el texto es un documento xml
Select detalle is document from comentario;

-- Función si una cadena de texto es un documento xml correcto
Select xml_is_well_formed(detalle::text)
from comentario;

-- Función que extrae el valor de un nodo xml
select xpath('//usuario/email', detalle)
from comentario;

-- Función que extrae el valor de un nodo xml pero sin las etiquetas
select xpath('//usuario/email/text()', detalle)
from comentario;

-- Función que verifica si existe un nodo xml
select xpath_exists('//usuario/email', detalle)
from comentario;