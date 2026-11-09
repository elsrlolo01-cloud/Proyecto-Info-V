
CREATE DATABASE hospital_pequenas_especies;

-- TABLA PROPIETARIO
CREATE TABLE propietario (
    id_propietario SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    contacto VARCHAR(30) NOT NULL
);

-- TABLA USUARIOS
CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    especialidad VARCHAR(50),
    contacto VARCHAR(30) NOT NULL
);

-- TABLA PACIENTE
CREATE TABLE paciente (
    id_paciente SERIAL PRIMARY KEY,
    especie VARCHAR(20) NOT NULL,
    raza VARCHAR(30),
    fecha_nacimiento DATE,
    sexo VARCHAR(10),
    peso NUMERIC(5,2),
    nom VARCHAR(50) NOT NULL,
    condicion VARCHAR(100) NOT NULL,
    id_propietario INT,

    CONSTRAINT fk_paciente_propietario
    FOREIGN KEY (id_propietario)
    REFERENCES propietario(id_propietario)
);

-- TABLA AGENDA
CREATE TABLE agenda (
    id_agenda SERIAL PRIMARY KEY,
    fecha_hora TIMESTAMP NOT NULL,
    id_paciente INT,
    id_usuario INT,
    motivo VARCHAR(100),
    estado VARCHAR(30) DEFAULT 'Pendiente',

    CONSTRAINT fk_agenda_paciente
    FOREIGN KEY (id_paciente)
    REFERENCES paciente(id_paciente),

    CONSTRAINT fk_agenda_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuarios(id_usuario)
);

-- TABLA TRATAMIENTO
CREATE TABLE tratamiento (
    id_tratamiento SERIAL PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    id_paciente INT,
    id_usuario INT,

    CONSTRAINT fk_tratamiento_paciente
    FOREIGN KEY (id_paciente)
    REFERENCES paciente(id_paciente),

    CONSTRAINT fk_tratamiento_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuarios(id_usuario)
);
