create database hospital_pequeñas_especies;

create table usuarios(
    id_usuario serial primary key,
    nom varchar(20) not null,
    especialidad varchar(20),
    contacto varchar(20) not null
);

create table paciente(
    id_paciente serial primary key,
    especie varchar(20) not null,
    raza varchar(20),
    fecha_nacimiento date,
    sexo char(6),
    peso float(5),
    nom varchar(20) not null,
    condicion varchar(30) not null
);

create table agenda(
    id_agenda serial primary key,
    fecha_hora timestamp(10) not null
);

create table tratamiento(
    id_tratamiento serial primary key,
    descripcion varchar(50) not null,
    id_paciente int,
    id_usuario int
    );