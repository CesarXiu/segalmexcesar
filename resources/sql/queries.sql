-- :name get-estados :? :*
-- :doc Obtener los estados
SELECT * FROM estados
-- :name get-municipios :? :*
-- :doc Obtener los municipios
SELECT municipios.municipio_id, municipios.nombre, municipios.estado_id, estados.nombre AS nombre_estado FROM municipios INNER JOIN estados ON municipios.estado_id = estados.estado_id
-- :name get-localidades :? :*
-- :doc Obtener los localidades
SELECT localidades.localidad_id, localidades.nombre, localidades.municipio_id, municipios.nombre AS nombre_municipio 
FROM localidades INNER JOIN municipios ON localidades.municipio_id = municipios.municipio_id
-- :name get-beneficiarios :? :*
-- :doc Obtener a los beneficiarios registrados
SELECT * FROM beneficiarios
-- :name get-caders :? :*
-- :doc Obtener los cader registrados
SELECT * FROM cader
-- :name get-cader :? :*
-- :doc Obtener los cader registrados
SELECT 
    cader.cader_id, 
    cader.fecha, 
    cader.hora, 
    cader.curp, 
    cader.entrego_documentos, 
    cader.localidad_real, 
    beneficiarios.nombres, 
    beneficiarios.primer_apellido, 
    beneficiarios.segundo_apellido, 
    estados.nombre AS nombre_estado, 
    municipios.nombre AS nombre_municipio, 
    localidades.nombre AS nombre_localidad 
FROM 
    cader 
INNER JOIN 
    beneficiarios ON cader.curp = beneficiarios.curp 
INNER JOIN 
    estados ON beneficiarios.estado_id = estados.estado_id 
INNER JOIN 
    municipios ON beneficiarios.municipio_id = municipios.municipio_id 
INNER JOIN 
    localidades ON beneficiarios.localidad_id = localidades.localidad_id;

-- :name create-estados! :! :n
-- :Agregar un nuevo estado
INSERT INTO estados
(nombre)
VALUES (:nombre)
-- :name create-municipios! :! :n
-- :Agregar un nuevo municipio
INSERT INTO municipios
(nombre, estado_id)
VALUES (:nombre, :estado_id)
-- :name create-localidades! :! :n
-- :Agregar una nueva localidades
INSERT INTO localidades
(nombre, municipio_id)
VALUES (:nombre, :municipio_id)
-- :name create-beneficiarios! :! :n
-- :Agregar un nuevo beneficiarios
INSERT INTO beneficiarios
(curp, nombres, primer_apellido, segundo_apellido, estado_id, municipio_id, localidad_id)
VALUES (:curp, :nombres, :primer_apellido, :segundo_apellido, :estado_id, :municipio_id, :localidad_id)
-- :name create-cader! :! :n
-- :Agregar un nuevo cader
INSERT INTO cader
(fecha, hora, curp, entrego_documentos, localidad_real)
VALUES (:fecha, :hora, :curp, :entrego_documentos, :localidad_real) 

-- :name update-estados! :! :n
-- :doc Actualiza nombre de un estado
UPDATE estados
SET nombre = :nuevo_nombre
WHERE estado_id = :estado_id
-- :name update-municipios! :! :n
-- :doc Actualiza nombre de un estado
UPDATE municipios
SET nombre = :nuevo_nombre, estado_id = :nuevo_estado_id
WHERE municipio_id = :municipio_id
-- :name update-localidades! :! :n
-- :doc Actualiza nombre de un estado
UPDATE localidades
SET nombre = :nuevo_nombre, municipio_id = :nuevo_municipio_id
WHERE localidad_id = :localidad_id
-- :name update-beneficiarios! :! :n
-- :doc Actualiza un beneficiario
UPDATE beneficiarios
SET nombres = :nombres, primer_apellido = :primer_apellido, segundo_apellido = :segundo_apellido, estado_id = :estado_id, municipio_id = :municipio_id, localidad_id = :localidad_id
WHERE curp = :curp
-- :name update-cader! :! :n
-- :doc Actualizar un cader
UPDATE cader
SET fecha = :fecha, hora = :hora, curp = :curp, entrego_documentos = :entrego_documentos, localidad_real = :localidad_real
WHERE cader_id = :cader_id

-- :name delete-estados! :! :n
-- :doc Eliminar un estado
DELETE FROM estados
WHERE estado_id = :estado_id
-- :name delete-municipios! :! :n
-- :doc Eliminar un estado
DELETE FROM municipios
WHERE municipio_id = :municipio_id
-- :name delete-localidades! :! :n
-- :doc Eliminar un estado
DELETE FROM localidades
WHERE localidad_id = :localidad_id
-- :name delete-beneficiarios! :! :n
-- :doc Eliminar un beneficiarios
DELETE FROM beneficiarios
WHERE curp = :curp
-- :name delete-cader! :! :n
-- :doc Eliminar un cader
DELETE FROM cader
WHERE cader_id = :cader_id

-- :name clear-estados! :! :*
-- :doc Eliminar todos los estados
DELETE FROM estados