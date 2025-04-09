DROP DATABASE IF EXISTS EscapeRoomBilboSKP;
CREATE DATABASE EscapeRoomBilboSKP;
USE EscapeRoomBilboSKP;

CREATE TABLE rol (
	id INT AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR(50) NOT NULL
);

CREATE TABLE etapaEducativa(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR (100) NOT NULL
);

CREATE TABLE centroEscolar(
	id INT AUTO_INCREMENT PRIMARY KEY,
	CIF VARCHAR (50) NOT NULL UNIQUE,
	nombre VARCHAR (100) NOT NULL,
	telefono VARCHAR (50) NOT NULL,
	email VARCHAR (100) NOT NULL,
	numeroAlumnos INT NOT NULL
);

CREATE TABLE etapaEducativa_centroEscolar(
	etapaEducativa_id INT,
	centroEscolar_id INT,
	PRIMARY KEY (etapaEducativa_id, centroEscolar_id),
	FOREIGN KEY (etapaEducativa_id) REFERENCES etapaEducativa (id),
	FOREIGN KEY (centroEscolar_id) REFERENCES centroescolar (id)
);

CREATE TABLE usuario(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR (100) NOT NULL,
	apellidos VARCHAR (200) NOT NULL,
	dni VARCHAR(9) NOT NULL UNIQUE,
	correo VARCHAR(100) NOT NULL UNIQUE,
	contraseña VARCHAR(200) NOT NULL,
	telefono VARCHAR(50) NOT NULL,
	rol_id INT NOT NULL,
	FOREIGN KEY (rol_id) REFERENCES rol (id)
);

CREATE TABLE responsable(
	id_usuario INT NOT NULL,	
	centroEscolar_id INT NOT NULL,
	FOREIGN KEY (centroEscolar_id) REFERENCES centroEscolar(id),
	FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE clase (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	etapaEducativa_id INT NOT NULL,
	FOREIGN KEY (etapaEducativa_id) REFERENCES etapaEducativa(id)
);


CREATE TABLE clase_centroEscolar(
	id_clase INT,
	id_centroEscolar INT,
	PRIMARY KEY (id_clase, id_centroEscolar),
	FOREIGN KEY (id_clase) REFERENCES clase (id),
	FOREIGN KEY (id_centroEscolar) REFERENCES centroescolar(id)
);

CREATE TABLE suscripcionTipo(
	id INT AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR (50) NOT NULL,
	precio DECIMAL (10,2) NOT NULL
);

CREATE TABLE suscripcion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL UNIQUE,
    fechaInicio DATE NOT NULL,
    estado VARCHAR(50) NOT NULL,
    suscripcion_tipo_id INT NOT NULL,
    codigoAcceso INT,
    FOREIGN KEY (suscripcion_tipo_id) REFERENCES suscripcionTipo (id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE cupon_tipo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE cupon (
    id INT AUTO_INCREMENT PRIMARY KEY,
    suscripcion_id INT NOT NULL,
    cupon_tipo_id INT NOT NULL,
    fechaCompra DATE NOT NULL,
    fechaCaducidad DATE NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    FOREIGN KEY (suscripcion_id) REFERENCES suscripcion(id),
    FOREIGN KEY (cupon_tipo_id) REFERENCES cupon_tipo(id)
);

CREATE TABLE escapeRoom (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo ENUM('especial','general') NOT NULL
);

CREATE TABLE partida (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,
    escapeRoom_id INT NOT NULL,
    responsable_id INT NOT NULL,
    clase_id INT DEFAULT NULL,
    FOREIGN KEY (escapeRoom_id) REFERENCES escapeRoom(id),
    FOREIGN KEY (responsable_id) REFERENCES usuario(id),
    FOREIGN KEY (responsable_id) REFERENCES clase_centroescolar(id_clase)
);

CREATE TABLE cupon_partida (
	 id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_acceso VARCHAR(20) NOT NULL UNIQUE,
    puntuacion INT DEFAULT 0,
    cupon_id INT NOT NULL,
    partida_id INT NOT NULL,
    FOREIGN KEY (cupon_id) REFERENCES cupon(id),
    FOREIGN KEY (partida_id) REFERENCES partida(id)
);

INSERT INTO rol (tipo)
VALUES 
("Admin"),
("Usuario"),
("Responsable");

INSERT INTO cupon_tipo (tipo)
VALUES
("NORMAL"),
("ESPECIAL");

INSERT INTO suscripciontipo (tipo, precio)
VALUES
("PAGO" , 5),
("GRATUITA", 0);

INSERT INTO etapaEducativa (nombre) 
VALUES
('Educación Infantil'),
('Educación Primaria'),
('Educación Secundaria Obligatoria (ESO)'),
('Bachillerato'),
('Formación Profesional Básica'),
('Ciclo Formativo de Grado Medio'),
('Ciclo Formativo de Grado Superior');

-- Educación Infantil (etapaEducativa_id = 1)
INSERT INTO clase (nombre, etapaEducativa_id) VALUES
('Infantil A', 1),
('Infantil B', 1),
('1º Primaria A', 2),
('1º Primaria B', 2),
('2º Primaria A', 2),
('2º Primaria B', 2),
('3º Primaria A', 2),
('3º Primaria B', 2),
('4º Primaria A', 2),
('4º Primaria B', 2),
('5º Primaria A', 2),
('5º Primaria B', 2),
('6º Primaria A', 2),
('6º Primaria B', 2),
('1º ESO A', 3),
('1º ESO B', 3),
('2º ESO A', 3),
('2º ESO B', 3),
('3º ESO A', 3),
('3º ESO B', 3),
('4º ESO A', 3),
('4º ESO B', 3),
('1º Bachillerato Ciencias', 4),
('2º Bachillerato Ciencias', 4),
('1º Bachillerato Humanidades y CC. Sociales', 4),
('2º Bachillerato Humanidades y CC. Sociales', 4),
('1º Bachillerato Artes', 4),
('2º Bachillerato Artes', 4),
('FPB Servicios Administrativos', 5),
('FPB Informática de Oficina', 5),
('CFGM Sistemas Microinformáticos y Redes', 6),
('CFGM Gestión Administrativa', 6),
('CFGM Instalaciones Eléctricas y Automáticas', 6),
('CFGM Cuidados Auxiliares de Enfermería', 6),
('CFGS Desarrollo de Aplicaciones Web', 7),
('CFGS Desarrollo de Aplicaciones Multiplataforma', 7),
('CFGS Administración y Finanzas', 7),
('CFGS Educación Infantil', 7);


