CREATE TABLE estados
(
    estado_id SERIAL PRIMARY KEY,
    nombre VARCHAR(250)
);
CREATE TABLE municipios
(
    municipio_id SERIAL PRIMARY KEY,
    nombre VARCHAR(250),
    estado_id INT,
    FOREIGN KEY (estado_id) REFERENCES estados(estado_id) ON DELETE CASCADE
);
CREATE TABLE localidades (
    localidad_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    municipio_id INTEGER NOT NULL,
    FOREIGN KEY (municipio_id) REFERENCES municipios (municipio_id) ON DELETE CASCADE
);
CREATE TABLE beneficiarios
(
    curp VARCHAR(30) PRIMARY KEY,
    nombres VARCHAR(250),
    primer_apellido VARCHAR(250),
    segundo_apellido VARCHAR(250),
    estado_id INT,
    municipio_id INT,
    localidad_id INT,
    FOREIGN KEY (estado_id) REFERENCES estados(estado_id) ON DELETE CASCADE,
    FOREIGN KEY (municipio_id) REFERENCES municipios(municipio_id) ON DELETE CASCADE,
    FOREIGN KEY (localidad_id) REFERENCES localidades(localidad_id) ON DELETE CASCADE
);
CREATE TABLE cader (
    cader_id SERIAL PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    hora VARCHAR(30) NOT NULL,
    curp VARCHAR(30) NOT NULL,
    localidad_real VARCHAR(255),
    entrego_documentos BOOLEAN,
    FOREIGN KEY (curp) REFERENCES beneficiarios(curp)
);