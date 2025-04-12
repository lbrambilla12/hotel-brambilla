CREATE DATABASE hotel;
USE hotel;

 CREATE TABLE nacionalidad (
    id_nacionalidad INT AUTO_INCREMENT PRIMARY KEY,
    pais VARCHAR(50) NOT NULL UNIQUE
);  

CREATE TABLE provincia (
    id_provincia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE ciudad (
    id_ciudad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    id_provincia INT NOT NULL,
    UNIQUE (nombre, id_provincia),
    FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
);

CREATE TABLE huesped (
    id_huesped INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dni INT NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    id_nacionalidad INT NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    id_ciudad INT NOT NULL,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_nacimiento DATE NOT NULL,
    FOREIGN KEY (id_nacionalidad) REFERENCES nacionalidad(id_nacionalidad),
    FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)
);

CREATE TABLE area (
    id_area INT AUTO_INCREMENT PRIMARY KEY,
    nombre_area VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE puesto (
    id_puesto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_puesto VARCHAR(50) NOT NULL UNIQUE,
    id_area INT NOT NULL,
    FOREIGN KEY (id_area) REFERENCES area(id_area)
);

CREATE TABLE empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dni INT NOT NULL UNIQUE,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    id_puesto INT NOT NULL,
    id_ciudad INT NOT NULL,
    id_nacionalidad INT NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    fecha_alta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_puesto) REFERENCES puesto(id_puesto),
    FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad),
    FOREIGN KEY (id_nacionalidad) REFERENCES nacionalidad(id_nacionalidad)
);

CREATE TABLE tipo_habitacion (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo VARCHAR(50) NOT NULL UNIQUE,
    precio_base DECIMAL(10,2) NOT NULL CHECK (precio_base > 0)
);

CREATE TABLE habitacion (
    id_habitacion INT AUTO_INCREMENT PRIMARY KEY,
    numero INT NOT NULL UNIQUE,
    id_tipo INT NOT NULL,
    estado ENUM('disponible', 'ocupada', 'mantenimiento') NOT NULL DEFAULT 'disponible',
    FOREIGN KEY (id_tipo) REFERENCES tipo_habitacion(id_tipo)
);

CREATE TABLE reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_huesped INT NOT NULL,
    id_habitacion INT NOT NULL,
    id_empleado INT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    cantidad_personas INT NOT NULL CHECK (cantidad_personas > 0),
    estado ENUM('confirmada', 'cancelada', 'finalizada') NOT NULL DEFAULT 'confirmada',
    total_pago DECIMAL(10,2) DEFAULT 0 CHECK (total_pago >= 0),
    FOREIGN KEY (id_huesped) REFERENCES huesped(id_huesped),
    FOREIGN KEY (id_habitacion) REFERENCES habitacion(id_habitacion),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    CHECK (fecha_fin > fecha_inicio)
);

CREATE TABLE servicio (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_servicio VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL CHECK (precio >= 0),
    bonificable BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE reserva_servicio (
    id_reserva INT,
    id_servicio INT,
    bonificado BOOLEAN NOT NULL DEFAULT FALSE,
    precio_aplicado DECIMAL(10,2) NOT NULL CHECK (precio_aplicado >= 0),
    PRIMARY KEY (id_reserva, id_servicio),
    FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva),
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio)
);

CREATE TABLE tipo_pago (
    id_tipo_pago INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE pago (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT NOT NULL UNIQUE,
    id_empleado INT NOT NULL,
    fecha_pago DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	monto_total DECIMAL(10,2) NOT NULL CHECK (monto_total >= 0),
    id_tipo_pago INT NOT NULL,
    FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_tipo_pago) REFERENCES tipo_pago(id_tipo_pago)
);