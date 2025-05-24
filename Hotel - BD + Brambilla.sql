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

CREATE TABLE auditoria_estado_habitacion (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_habitacion INT NOT NULL,
    estado_anterior ENUM('disponible', 'ocupada', 'mantenimiento'),
    estado_nuevo ENUM('disponible', 'ocupada', 'mantenimiento') NOT NULL,
    fecha_cambio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_empleado INT,
    id_reserva INT,
    FOREIGN KEY (id_habitacion) REFERENCES habitacion(id_habitacion),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva),
    CHECK (estado_anterior IS NULL OR estado_anterior <> estado_nuevo)
);

CREATE TABLE log_pago (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_pago INT,
    id_reserva INT,
    fecha_pago DATETIME,
    monto DECIMAL(10,2),
    id_tipo_pago INT,
    registrado_en DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE alertas_habitacion (
    id_alerta INT AUTO_INCREMENT PRIMARY KEY,
    id_habitacion INT,
    motivo VARCHAR(255),
    fecha_alerta DATETIME DEFAULT CURRENT_TIMESTAMP
);


-------------------------------------------------------------------------------
CREATE OR REPLACE VIEW vista_reservas_con_detalles AS
SELECT 
    r.id_reserva,
    CONCAT(h.nombre, ' ', h.apellido) AS huesped,
    ha.numero AS numero_habitacion,
    th.nombre_tipo AS tipo_habitacion,
    r.fecha_inicio,
    r.fecha_fin,
    r.estado,
    r.total_pago,
    CONCAT(e.nombre, ' ', e.apellido) AS empleado
FROM reserva r
JOIN huesped h ON r.id_huesped = h.id_huesped
JOIN habitacion ha ON r.id_habitacion = ha.id_habitacion
JOIN tipo_habitacion th ON ha.id_tipo = th.id_tipo
LEFT JOIN empleado e ON r.id_empleado = e.id_empleado;

CREATE OR REPLACE VIEW vista_empleados_por_area AS
SELECT 
    a.nombre_area,
    p.nombre_puesto,
    CONCAT(e.nombre, ' ', e.apellido) AS empleado,
    e.email,
    e.telefono
FROM empleado e
JOIN puesto p ON e.id_puesto = p.id_puesto
JOIN area a ON p.id_area = a.id_area;

CREATE OR REPLACE VIEW vista_habitaciones_disponibles AS
SELECT 
    ha.id_habitacion,
    ha.numero,
    th.nombre_tipo,
    th.precio_base
FROM habitacion ha
JOIN tipo_habitacion th ON ha.id_tipo = th.id_tipo
WHERE ha.estado = 'disponible';

CREATE OR REPLACE VIEW vista_historial_estado_habitaciones AS
SELECT 
    ae.id_auditoria,
    ae.id_habitacion,
    ae.estado_anterior,
    ae.estado_nuevo,
    ae.fecha_cambio,
    CONCAT(e.nombre, ' ', e.apellido) AS empleado,
    ae.id_reserva
FROM auditoria_estado_habitacion ae
LEFT JOIN empleado e ON ae.id_empleado = e.id_empleado
ORDER BY ae.fecha_cambio DESC;

CREATE OR REPLACE VIEW vista_pagos_completos AS
SELECT 
    p.id_pago,
    r.id_reserva,
    CONCAT(h.nombre, ' ', h.apellido) AS huesped,
    p.monto_total,
    tp.nombre_tipo AS tipo_pago,
    p.fecha_pago,
    CONCAT(e.nombre, ' ', e.apellido) AS empleado
FROM pago p
JOIN reserva r ON p.id_reserva = r.id_reserva
JOIN huesped h ON r.id_huesped = h.id_huesped
JOIN tipo_pago tp ON p.id_tipo_pago = tp.id_tipo_pago
JOIN empleado e ON p.id_empleado = e.id_empleado;

CREATE OR REPLACE VIEW vista_servicios_por_reserva AS
SELECT 
    rs.id_reserva,
    s.nombre_servicio,
    rs.precio_aplicado,
    rs.bonificado
FROM reserva_servicio rs
JOIN servicio s ON rs.id_servicio = s.id_servicio;

CREATE OR REPLACE VIEW vista_huespedes_por_ciudad AS
SELECT 
    c.nombre AS ciudad,
    p.nombre AS provincia,
    COUNT(h.id_huesped) AS total_huespedes
FROM huesped h
JOIN ciudad c ON h.id_ciudad = c.id_ciudad
JOIN provincia p ON c.id_provincia = p.id_provincia
GROUP BY c.nombre, p.nombre;

CREATE OR REPLACE VIEW vista_ocupacion_habitaciones AS
SELECT 
    h.numero,
    th.nombre_tipo AS tipo_habitacion,
    h.estado
FROM habitacion h
JOIN tipo_habitacion th ON h.id_tipo = th.id_tipo;

CREATE OR REPLACE VIEW vista_servicios_bonificados AS
SELECT 
    s.nombre_servicio,
    COUNT(*) AS cantidad_bonificados
FROM reserva_servicio rs
JOIN servicio s ON rs.id_servicio = s.id_servicio
WHERE rs.bonificado = TRUE
GROUP BY s.nombre_servicio;

CREATE OR REPLACE VIEW vista_reservas_por_mes AS
SELECT 
    YEAR(fecha_inicio) AS anio,
    MONTH(fecha_inicio) AS mes,
    COUNT(*) AS total_reservas
FROM reserva
WHERE estado = 'confirmada'
GROUP BY YEAR(fecha_inicio), MONTH(fecha_inicio)
ORDER BY anio DESC, mes DESC;

CREATE OR REPLACE VIEW vista_habitaciones_mas_utilizadas AS
SELECT 
    h.numero,
    COUNT(*) AS veces_ocupada
FROM auditoria_estado_habitacion aeh
JOIN habitacion h ON aeh.id_habitacion = h.id_habitacion
WHERE aeh.estado_nuevo = 'ocupada'
GROUP BY h.numero
ORDER BY veces_ocupada DESC;

-----------------------------------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE sp_registrar_pago (
    IN p_id_reserva INT,
    IN p_id_empleado INT,
    IN p_monto_total DECIMAL(10,2),
    IN p_id_tipo_pago INT
)
BEGIN
    -- Registrar el pago
    INSERT INTO pago (id_reserva, id_empleado, monto_total, id_tipo_pago)
    VALUES (p_id_reserva, p_id_empleado, p_monto_total, p_id_tipo_pago);

    -- Actualizar el estado de la reserva a 'finalizada'
    UPDATE reserva
    SET estado = 'finalizada'
    WHERE id_reserva = p_id_reserva;
END;
//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_finalizar_reserva_y_mantenimiento (
    IN p_id_reserva INT,
    IN p_id_empleado INT
)
BEGIN
    DECLARE v_id_habitacion INT;

    -- Obtener ID de la habitación relacionada a la reserva
    SELECT id_habitacion INTO v_id_habitacion
    FROM reserva
    WHERE id_reserva = p_id_reserva;

    -- Actualizar el estado de la reserva
    UPDATE reserva
    SET estado = 'finalizada'
    WHERE id_reserva = p_id_reserva;

    -- Actualizar el estado de la habitación
    UPDATE habitacion
    SET estado = 'mantenimiento'
    WHERE id_habitacion = v_id_habitacion;

    -- Insertar en la tabla de auditoría
    INSERT INTO auditoria_estado_habitacion (
        id_habitacion,
        estado_anterior,
        estado_nuevo,
        id_empleado,
        id_reserva
    )
    VALUES (
        v_id_habitacion,
        'ocupada',
        'mantenimiento',
        p_id_empleado,
        p_id_reserva
    );
END;
//

DELIMITER ;

-----------------------------------------------------------------------------------------

DELIMITER //

CREATE TRIGGER tr_alerta_mantenimiento
AFTER UPDATE ON habitacion
FOR EACH ROW
BEGIN
    IF OLD.estado <> NEW.estado AND NEW.estado = 'mantenimiento' THEN
        INSERT INTO alertas_habitacion (
            id_habitacion,
            motivo
        )
        VALUES (
            NEW.id_habitacion,
            'Habitación marcada como en mantenimiento.'
        );
    END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER tr_log_nuevo_pago
AFTER INSERT ON pago
FOR EACH ROW
BEGIN
    INSERT INTO log_pago (
        id_pago,
        id_reserva,
        fecha_pago,
        monto,
        id_tipo_pago
    )
    VALUES (
        NEW.id_pago,
        NEW.id_reserva,
        NEW.fecha_pago,
        NEW.monto_total,
        NEW.id_tipo_pago
    );
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER tr_reserva_ocupa_habitacion
AFTER UPDATE ON reserva
FOR EACH ROW
BEGIN
    DECLARE estado_actual_habitacion ENUM('disponible', 'ocupada', 'mantenimiento');

    -- Solo si se confirma una reserva y ya estamos en la fecha de inicio
    IF NEW.estado = 'confirmada' AND CURDATE() >= NEW.fecha_inicio THEN
        -- Obtener el estado actual de la habitación
        SELECT estado INTO estado_actual_habitacion
        FROM habitacion
        WHERE id_habitacion = NEW.id_habitacion;

        -- Si la habitación estaba disponible, registramos el cambio
        IF estado_actual_habitacion = 'disponible' THEN
            -- Insertamos en la tabla de auditoría
            INSERT INTO auditoria_estado_habitacion (
                id_habitacion,
                estado_anterior,
                estado_nuevo,
                id_empleado,
                id_reserva
            )
            VALUES (
                NEW.id_habitacion,
                'disponible',
                'ocupada',
                NEW.id_empleado,
                NEW.id_reserva
            );

            -- También actualizamos el estado de la habitación
            UPDATE habitacion
            SET estado = 'ocupada'
            WHERE id_habitacion = NEW.id_habitacion;
        END IF;
    END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER tr_proteger_fecha_registro_huesped
BEFORE UPDATE ON huesped
FOR EACH ROW
BEGIN
    IF NEW.fecha_registro <> OLD.fecha_registro THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No está permitido modificar la fecha de registro del huésped.';
    END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE FUNCTION fn_calcular_edad(fecha_nacimiento DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE());
END;
//

DELIMITER ;

-----------------------------------------------------------------------------------------

DELIMITER //

CREATE FUNCTION fn_duracion_reserva(fecha_inicio DATE, fecha_fin DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN DATEDIFF(fecha_fin, fecha_inicio);
END;
//

DELIMITER ;

DELIMITER //

CREATE FUNCTION fn_total_dias_ocupada(p_id_habitacion INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN (
        SELECT COUNT(*) 
        FROM auditoria_estado_habitacion
        WHERE id_habitacion = p_id_habitacion
          AND estado_nuevo = 'ocupada'
    );
END;
//

DELIMITER ;

DELIMITER //

CREATE FUNCTION fn_precio_total_reserva(id_reserva INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT 
        COALESCE(SUM(rs.precio_aplicado), 0)
    INTO total
    FROM reserva_servicio rs
    WHERE rs.id_reserva = id_reserva;

    RETURN total;
END;
//

DELIMITER ;

DELIMITER //

CREATE FUNCTION fn_estado_actual_habitacion(id_habitacion INT)
RETURNS ENUM('disponible', 'ocupada', 'mantenimiento')
DETERMINISTIC
BEGIN
    DECLARE estado_actual ENUM('disponible', 'ocupada', 'mantenimiento');

    SELECT estado INTO estado_actual
    FROM habitacion
    WHERE habitacion.id_habitacion = id_habitacion;

    RETURN estado_actual;
END;
//

DELIMITER ;