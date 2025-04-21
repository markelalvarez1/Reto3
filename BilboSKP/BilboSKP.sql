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
    tipo ENUM('NORMAL','ESPECIAL') NOT NULL,
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

INSERT INTO rol (tipo) VALUES ('Admin'), ('Usuario'), ('Responsable'), ('Jugador');
INSERT INTO suscripcionTipo (tipo, precio) VALUES ('PAGO', 5.0), ('GRATUITA', 0);
