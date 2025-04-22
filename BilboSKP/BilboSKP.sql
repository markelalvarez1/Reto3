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

CREATE TABLE centroEducativo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cif VARCHAR(20) UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    localidad VARCHAR(100),
    etapasEducativas VARCHAR(255),
    numAlumnos INT,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE clase (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    grado VARCHAR(50),
    seccion VARCHAR(50)
);

CREATE TABLE clase_centroEducativo (
    id_clase INT,
    centroEducativo_id INT,
    PRIMARY KEY (id_clase, centroEducativo_id),
    FOREIGN KEY (id_clase) REFERENCES clase(id),
    FOREIGN KEY (centroEducativo_id) REFERENCES centroEducativo(id)
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

INSERT INTO suscripcion (usuario_id, fechaInicio, estado, suscripcion_tipo_id, codigoVerificacion)
VALUES 
(1, '2025-04-01', 'ACTIVA', 1, 'ABC123'),
(2, '2025-04-02', 'PENDIENTE', 2, 'DEF456'),
(3, '2025-03-25', 'CANCELADA', 1, 'GHI789'),
(4, '2025-03-20', 'ACTIVA', 2, 'JKL012'),
(5, '2025-04-10', 'PENDIENTE', 1, 'MNO345'),
(6, '2025-04-05', 'ACTIVA', 2, 'PQR678'),
(7, '2025-03-15', 'CANCELADA', 1, 'STU901'),
(8, '2025-04-12', 'PENDIENTE', 2, 'VWX234'),
(9, '2025-04-08', 'ACTIVA', 1, 'YZA567'),
(10, '2025-03-30', 'CANCELADA', 2, 'BCD890');



