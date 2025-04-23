DROP DATABASE IF EXISTS EscapeRoomBilboSKP;
CREATE DATABASE EscapeRoomBilboSKP;
USE EscapeRoomBilboSKP;

CREATE TABLE rol (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(100) NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    rol_id INT NOT NULL,
    FOREIGN KEY (rol_id) REFERENCES rol(id)
);

CREATE TABLE centroEscolar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cif VARCHAR(20) UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100),
    etapaEducativa VARCHAR(255),
    numeroAlumnos INT,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE clase (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    grado VARCHAR(50),
    seccion VARCHAR(50)
);

<<<<<<< HEAD
CREATE TABLE clase_centroEscolar (
=======
<<<<<<< HEAD
CREATE TABLE clase_centroEscolar(
	id_clase INT,
	id_centroEscolar INT,
	PRIMARY KEY (id_clase, id_centroEscolar),
	FOREIGN KEY (id_clase) REFERENCES clase (id),
	FOREIGN KEY (id_centroEscolar) REFERENCES centroescolar(id)
=======
CREATE TABLE clase_centroEducativo (
>>>>>>> 6bd9705f02edc767ed2b4cee6a5d0d755888b209
    id_clase INT,
    centroEducativo_id INT,
    PRIMARY KEY (id_clase, centroEducativo_id),
    FOREIGN KEY (id_clase) REFERENCES clase(id),
<<<<<<< HEAD
    FOREIGN KEY (centroEducativo_id) REFERENCES centroEscolar(id)
=======
    FOREIGN KEY (centroEducativo_id) REFERENCES centroEducativo(id)
>>>>>>> eed91d3f20a17eb28d8b6194cb32f4af5c8677e8
>>>>>>> 6bd9705f02edc767ed2b4cee6a5d0d755888b209
);

CREATE TABLE suscripcionTipo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE suscripcion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL UNIQUE,
    fechaInicio DATE NOT NULL,
    estado ENUM('PENDIENTE','ACTIVA','CANCELADA') NOT NULL,
    suscripcion_tipo_id INT NOT NULL,
    codigoVerificacion VARCHAR(50),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (suscripcion_tipo_id) REFERENCES suscripcionTipo(id)
);

CREATE TABLE cupon (
    id INT AUTO_INCREMENT PRIMARY KEY,
    suscripcion_id INT NOT NULL,
    fechaCompra DATE NOT NULL,
    fechaCaducidad DATE NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    estado ENUM('ACTIVO','PROGRAMADO','USADO','CADUCADO') NOT NULL,
    FOREIGN KEY (suscripcion_id) REFERENCES suscripcion(id)
);

CREATE TABLE escapeRoom (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    tipo ENUM('CYBERBULLYING','GENERICO') NOT NULL
);

CREATE TABLE partida (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fechaProgramada DATETIME NOT NULL,
    codigoAcceso VARCHAR(50) NOT NULL,
    estado ENUM('PROGRAMADO','EN_CURSO','CANCELADO','FINALIZADO') NOT NULL,
    cantidadCuponesAsignados INT NOT NULL,
    escapeRoom_id INT NOT NULL,
    responsable_id INT NOT NULL,
    clase_id INT,
    FOREIGN KEY (escapeRoom_id) REFERENCES escapeRoom(id),
    FOREIGN KEY (responsable_id) REFERENCES usuario(id),
    FOREIGN KEY (clase_id) REFERENCES clase(id)
);

CREATE TABLE sesionPartida (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigoSesion VARCHAR(50) NOT NULL,
    fechaInicio DATETIME NOT NULL,
    fechaFin DATETIME,
    alias VARCHAR(100) NOT NULL,
    tiempoJuego INT NOT NULL,
    puntuacion DOUBLE,
    rol_id INT,
    partida_id INT NOT NULL,
    FOREIGN KEY (rol_id) REFERENCES rol(id),
    FOREIGN KEY (partida_id) REFERENCES partida(id)
);

CREATE TABLE ranking (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fechaCreacion DATETIME NOT NULL,
    tipo ENUM('GENERAL','ESPECIAL') NOT NULL,
    creadoPor INT NOT NULL,
    FOREIGN KEY (creadoPor) REFERENCES usuario(id)
);

CREATE TABLE cupon_partida (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cupon_id INT NOT NULL,
    partida_id INT NOT NULL,
    FOREIGN KEY (cupon_id) REFERENCES cupon(id),
    FOREIGN KEY (partida_id) REFERENCES partida(id)
);

<<<<<<< HEAD
CREATE TABLE ranking_clase (
    id INT AUTO_INCREMENT PRIMARY KEY,
    clase_id INT NOT NULL,
    centro_escolar_id INT NOT NULL,
    puntuacion_total INT NOT NULL DEFAULT 0,
    fecha_actualizacion DATETIME NOT NULL,
    FOREIGN KEY (clase_id) REFERENCES clase(id),
    FOREIGN KEY (centro_escolar_id) REFERENCES centroEscolar(id),
    UNIQUE KEY (clase_id, centro_escolar_id)
);

CREATE TABLE ranking_reset (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_reset DATETIME NOT NULL,
    tipo VARCHAR(20) NOT NULL, -- 'automatico' o 'manual'
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE resultado_partida (
    id INT AUTO_INCREMENT PRIMARY KEY,
    partida_id INT NOT NULL,
    aciertos INT NOT NULL,
    pistas_usadas INT NOT NULL,
    tiempo_segundos INT NOT NULL,
    puntuacion INT NOT NULL,
    clase_id INT,
    centro_escolar_id INT,
    FOREIGN KEY (partida_id) REFERENCES partida(id),
    FOREIGN KEY (clase_id) REFERENCES clase(id),
    FOREIGN KEY (centro_escolar_id) REFERENCES centroEscolar(id)
);

INSERT INTO rol (tipo)
=======
INSERT INTO rol (tipo) VALUES ('ADMINISTRADOR'), ('USUARIO'), ('RESPONSABLE');
INSERT INTO suscripcionTipo (tipo, precio) VALUES ('INDIVIDUAL', 5.0), ('CENTRO ESCOLAR', 0);
INSERT INTO usuario (dni, nombre, apellidos, telefono, correo, contraseña, rol_id)
>>>>>>> eed91d3f20a17eb28d8b6194cb32f4af5c8677e8
VALUES 
('12345678A', 'Admin', 'Admin', '600123456', 'admin@gmail.com', '12345', 1),
('87654321B', 'Usuario', 'Usuario', '610654321', 'usuario@gmail.com', '12345', 2),
('11223344C', 'Ana', 'Martínez Díaz', '620112233', 'ana.martinez@example.com', 'contraseña3', 2),
('44332211D', 'Responsable', 'Responsable', '630443322', 'responsable@gmail.com', '12345', 3),
('99887766E', 'Laura', 'Jiménez Ruiz', '640998877', 'laura.jimenez@example.com', 'contraseña5', 2),
('77665544F', 'Carlos', 'Hernández Torres', '650776655', 'carlos.hernandez@example.com', 'contraseña6', 3),
('66554433G', 'Sofía', 'Ramírez Morales', '660665544', 'sofia.ramirez@example.com', 'contraseña7', 1),
('55443322H', 'Pedro', 'Sánchez Gómez', '670554433', 'pedro.sanchez@example.com', 'contraseña8', 3),
('33221100I', 'Marta', 'Navarro Ortega', '680332211', 'marta.navarro@example.com', 'contraseña9', 1),
('11110000J', 'Andrés', 'Castro Velázquez', '690111100', 'andres.castro@example.com', 'contraseña10', 2);

INSERT INTO suscripcion (usuario_id, fechaInicio, estado, suscripcion_tipo_id, codigoVerificacion)
VALUES 
(1, '2025-04-01', 'ACTIVA', 1, 'ABC123'),
(2, '2025-04-02', 'ACTIVA', 2, 'DEF456'),
(3, '2025-03-25', 'CANCELADA', 1, 'GHI789'),
(4, '2025-03-20', 'ACTIVA', 2, 'JKL012'),
(5, '2025-04-10', 'PENDIENTE', 1, 'MNO345'),
(6, '2025-04-05', 'ACTIVA', 2, 'PQR678'),
(7, '2025-03-15', 'CANCELADA', 1, 'STU901'),
(8, '2025-04-12', 'PENDIENTE', 2, 'VWX234'),
(9, '2025-04-08', 'ACTIVA', 1, 'YZA567'),
(10, '2025-03-30', 'CANCELADA', 2, 'BCD890');

<<<<<<< HEAD
INSERT INTO centroEscolar (cif, nombre, ciudad, etapaEducativa, numeroAlumnos, id_usuario)
VALUES 
  ('A12345678', 'Colegio San Juan', 'Bilbao', 'Primaria y Secundaria', 800, 4),
  ('B87654321', 'Instituto Vasco', 'San Sebastián', 'Secundaria', 600, 6),
  ('C98765432', 'CEIP Arriaga', 'Bilbao', 'Infantil y Primaria', 300, 8);
=======
<<<<<<< HEAD
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

INSERT INTO rol (tipo) VALUES ('ADMINISTRADOR'), ('USUARIO'), ('RESPONSABLE');
INSERT INTO suscripcionTipo (tipo, precio) VALUES ('INDIVIDUAL', 5.0), ('CENTRO ESCOLAR', 0);
INSERT INTO usuario (dni, nombre, apellidos, telefono, correo, contraseña, rol_id)
VALUES 
('12345678A', 'Admin', 'Admin', '600123456', 'admin@gmail.com', '12345', 1),
('87654321B', 'María', 'López Fernández', '610654321', 'maria.lopez@example.com', 'contraseña2', 2),
('11223344C', 'Ana', 'Martínez Díaz', '620112233', 'ana.martinez@example.com', 'contraseña3', 2),
('44332211D', 'Luis', 'González Romero', '630443322', 'luis.gonzalez@example.com', 'contraseña4', 3),
('99887766E', 'Laura', 'Jiménez Ruiz', '640998877', 'laura.jimenez@example.com', 'contraseña5', 2),
('77665544F', 'Carlos', 'Hernández Torres', '650776655', 'carlos.hernandez@example.com', 'contraseña6', 3),
('66554433G', 'Sofía', 'Ramírez Morales', '660665544', 'sofia.ramirez@example.com', 'contraseña7', 1),
('55443322H', 'Pedro', 'Sánchez Gómez', '670554433', 'pedro.sanchez@example.com', 'contraseña8', 3),
('33221100I', 'Marta', 'Navarro Ortega', '680332211', 'marta.navarro@example.com', 'contraseña9', 1),
('11110000J', 'Andrés', 'Castro Velázquez', '690111100', 'andres.castro@example.com', 'contraseña10', 2);

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
=======
>>>>>>> eed91d3f20a17eb28d8b6194cb32f4af5c8677e8
>>>>>>> 6bd9705f02edc767ed2b4cee6a5d0d755888b209


