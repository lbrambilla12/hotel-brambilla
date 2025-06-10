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
    id_pago INT NOT NULL,
    id_reserva INT NOT NULL,
    fecha_pago DATETIME NOT NULL,
    monto DECIMAL(10,2) NOT NULL CHECK (monto >= 0),
    id_tipo_pago INT NOT NULL,
    registrado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pago) REFERENCES pago(id_pago),
    FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva),
    FOREIGN KEY (id_tipo_pago) REFERENCES tipo_pago(id_tipo_pago)
);

CREATE TABLE alertas_habitacion (
    id_alerta INT AUTO_INCREMENT PRIMARY KEY,
    id_habitacion INT NOT NULL,
    motivo VARCHAR(255) NOT NULL,
    fecha_alerta DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_empleado INT,
    id_reserva INT,
    FOREIGN KEY (id_habitacion) REFERENCES habitacion(id_habitacion),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva)
);

CREATE TABLE auditoria_precio_servicio (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_servicio INT NOT NULL,
    precio_anterior DECIMAL(10,2) NOT NULL,
    precio_nuevo DECIMAL(10,2) NOT NULL,
    fecha_cambio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_empleado INT,
    motivo VARCHAR(255),
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    CHECK (precio_anterior <> precio_nuevo)
);

CREATE TABLE auditoria_precio_habitacion (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_tipo INT NOT NULL,
    precio_anterior DECIMAL(10,2) NOT NULL,
    precio_nuevo DECIMAL(10,2) NOT NULL,
    fecha_cambio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_empleado INT,
    motivo VARCHAR(255),
    FOREIGN KEY (id_tipo) REFERENCES tipo_habitacion(id_tipo),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    CHECK (precio_anterior <> precio_nuevo)
);

--------------------------------------------------------------------------------------------------------
-- Vistas!
-- Resume la cantidad de reservas y los ingresos mensuales.
CREATE VIEW vw_ocupacion_actual AS
SELECT 
    h.numero AS numero_habitacion,
    th.nombre_tipo AS tipo,
    r.id_reserva,
    r.fecha_inicio,
    r.fecha_fin,
    r.estado,
    r.cantidad_personas,
    r.total_pago
FROM habitacion h
JOIN tipo_habitacion th ON h.id_tipo = th.id_tipo
LEFT JOIN reserva r ON r.id_habitacion = h.id_habitacion
    AND r.estado = 'confirmada'
    AND CURDATE() BETWEEN r.fecha_inicio AND r.fecha_fin;
    
    
-- Resume la cantidad de reservas y los ingresos mensuales.
    CREATE VIEW vw_reservas_por_mes AS
SELECT 
    DATE_FORMAT(fecha_inicio, '%Y-%m') AS mes,
    COUNT(*) AS total_reservas,
    SUM(total_pago) AS ingresos_estimados
FROM reserva
WHERE estado = 'confirmada'
GROUP BY mes
ORDER BY mes DESC;


-- Detalla los servicios utilizados por cada reserva, con su precio aplicado y si fue bonificado.
CREATE VIEW vw_servicios_por_reserva AS
SELECT 
    rs.id_reserva,
    s.nombre_servicio,
    rs.precio_aplicado,
    rs.bonificado
FROM reserva_servicio rs
JOIN servicio s ON rs.id_servicio = s.id_servicio;


-- Muestra de dónde provienen los huéspedes. Útil para análisis de mercado.
CREATE VIEW vw_huespedes_por_ciudad AS
SELECT 
    c.nombre AS ciudad,
    p.nombre AS provincia,
    COUNT(*) AS total_huespedes
FROM huesped h
JOIN ciudad c ON h.id_ciudad = c.id_ciudad
JOIN provincia p ON c.id_provincia = p.id_provincia
GROUP BY c.nombre, p.nombre
ORDER BY total_huespedes DESC;


-- Lista todos los pagos realizados con su tipo, empleado responsable y monto.
CREATE VIEW vw_detalle_pagos AS
SELECT 
    pa.id_pago,
    pa.id_reserva,
    tp.nombre_tipo AS tipo_pago,
    pa.monto_total,
    pa.fecha_pago,
    e.nombre AS empleado,
    e.apellido
FROM pago pa
JOIN tipo_pago tp ON pa.id_tipo_pago = tp.id_tipo_pago
JOIN empleado e ON pa.id_empleado = e.id_empleado;


-- Vista organizacional para mostrar empleados con sus puestos, áreas y datos de contacto.
CREATE VIEW vw_empleados_con_puesto AS
SELECT 
    e.id_empleado,
    e.nombre,
    e.apellido,
    p.nombre_puesto,
    a.nombre_area,
    e.email
FROM empleado e
JOIN puesto p ON e.id_puesto = p.id_puesto
JOIN area a ON p.id_area = a.id_area;


-- Describe el estado de las habitaciones en forma visual. Útil para dashboards de gestión.
CREATE VIEW vw_estado_habitaciones AS
SELECT 
    h.numero,
    th.nombre_tipo,
    h.estado,
    CASE
        WHEN h.estado = 'disponible' THEN 'Disponible'
        WHEN h.estado = 'ocupada' THEN 'Ocupada'
        WHEN h.estado = 'mantenimiento' THEN 'En mantenimiento'
    END AS estado_descripcion
FROM habitacion h
JOIN tipo_habitacion th ON h.id_tipo = th.id_tipo;


-- Vista consolidada del historial de cambios de precios con trazabilidad del responsable.
CREATE VIEW vw_historial_cambios_precios AS
SELECT 
    aps.id_auditoria,
    'servicio' AS tipo,
    s.nombre_servicio AS nombre,
    aps.precio_anterior,
    aps.precio_nuevo,
    aps.fecha_cambio,
    e.nombre AS empleado,
    e.apellido,
    aps.motivo
FROM auditoria_precio_servicio aps
LEFT JOIN servicio s ON aps.id_servicio = s.id_servicio
LEFT JOIN empleado e ON aps.id_empleado = e.id_empleado

UNION ALL

SELECT 
    aph.id_auditoria,
    'habitacion' AS tipo,
    th.nombre_tipo AS nombre,
    aph.precio_anterior,
    aph.precio_nuevo,
    aph.fecha_cambio,
    e.nombre AS empleado,
    e.apellido,
    aph.motivo
FROM auditoria_precio_habitacion aph
LEFT JOIN tipo_habitacion th ON aph.id_tipo = th.id_tipo
LEFT JOIN empleado e ON aph.id_empleado = e.id_empleado;



--------------------------------------------------------------------------------
-- Stored Procudere
-- Crea una reserva sin servicios ni pago.
DELIMITER $$

CREATE PROCEDURE sp_crear_reserva_simple (
    IN p_id_huesped INT,
    IN p_id_habitacion INT,
    IN p_id_empleado INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE,
    IN p_cantidad_personas INT,
    OUT p_id_reserva INT
)
BEGIN
    DECLARE v_dias INT;
    DECLARE v_precio DECIMAL(10,2);
    DECLARE v_total DECIMAL(10,2);

    -- Validación de fechas
    IF p_fecha_fin <= p_fecha_inicio THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fecha de fin inválida';
    END IF;

    SET v_dias = DATEDIFF(p_fecha_fin, p_fecha_inicio);

    -- Obtener precio base de habitación
    SELECT th.precio_base INTO v_precio
    FROM habitacion h
    JOIN tipo_habitacion th ON h.id_tipo = th.id_tipo
    WHERE h.id_habitacion = p_id_habitacion;

    SET v_total = v_dias * v_precio;

    -- Insertar reserva
    INSERT INTO reserva (
        id_huesped, id_habitacion, id_empleado,
        fecha_inicio, fecha_fin, cantidad_personas, total_pago
    ) VALUES (
        p_id_huesped, p_id_habitacion, p_id_empleado,
        p_fecha_inicio, p_fecha_fin, p_cantidad_personas, v_total
    );

    SET p_id_reserva = LAST_INSERT_ID();
END $$

DELIMITER ;


-- Permite asociar manualmente un servicio a una reserva, marcando si es bonificado o no.
DELIMITER $$

CREATE PROCEDURE sp_agregar_servicio_a_reserva (
    IN p_id_reserva INT,
    IN p_id_servicio INT,
    IN p_bonificado BOOLEAN
)
BEGIN
    DECLARE v_precio DECIMAL(10,2);

    SELECT precio INTO v_precio
    FROM servicio
    WHERE id_servicio = p_id_servicio;

    IF p_bonificado THEN
        SET v_precio = 0;
    END IF;

    INSERT INTO reserva_servicio (
        id_reserva, id_servicio, bonificado, precio_aplicado
    ) VALUES (
        p_id_reserva, p_id_servicio, p_bonificado, v_precio
    );

    -- Actualizar total en la reserva
    UPDATE reserva
    SET total_pago = total_pago + v_precio
    WHERE id_reserva = p_id_reserva;
END $$

DELIMITER ;


-- Registra un pago total para una reserva confirmada.
DELIMITER $$

CREATE PROCEDURE sp_registrar_pago_reserva (
    IN p_id_reserva INT,
    IN p_id_empleado INT,
    IN p_id_tipo_pago INT
)
BEGIN
    DECLARE v_total DECIMAL(10,2);

    -- Obtener total a pagar
    SELECT total_pago INTO v_total
    FROM reserva
    WHERE id_reserva = p_id_reserva;

    -- Insertar pago
    INSERT INTO pago (
        id_reserva, id_empleado, monto_total, id_tipo_pago
    ) VALUES (
        p_id_reserva, p_id_empleado, v_total, p_id_tipo_pago
    );
END $$

DELIMITER ;


-- Cambia el estado de una habitación (ej: a mantenimiento) y lo registra en la auditoría.
DELIMITER $$

CREATE PROCEDURE sp_actualizar_estado_habitacion (
    IN p_id_habitacion INT,
    IN p_estado_nuevo VARCHAR(20),
    IN p_id_empleado INT,
    IN p_id_reserva INT
)
BEGIN
    DECLARE v_estado_actual VARCHAR(20);

    -- Validar que el estado nuevo sea uno de los permitidos
    IF p_estado_nuevo NOT IN ('disponible', 'ocupada', 'mantenimiento') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Estado inválido: debe ser disponible, ocupada o mantenimiento';
    END IF;

    -- Obtener el estado actual de la habitación
    SELECT estado INTO v_estado_actual
    FROM habitacion
    WHERE id_habitacion = p_id_habitacion;

    -- Solo hacer algo si hay un cambio real de estado
    IF v_estado_actual <> p_estado_nuevo THEN

        -- Insertar en tabla de auditoría
        INSERT INTO auditoria_estado_habitacion (
            id_habitacion, estado_anterior, estado_nuevo, id_empleado, id_reserva
        ) VALUES (
            p_id_habitacion, v_estado_actual, p_estado_nuevo, p_id_empleado, p_id_reserva
        );

        -- Actualizar el estado en la tabla habitacion
        UPDATE habitacion
        SET estado = p_estado_nuevo
        WHERE id_habitacion = p_id_habitacion;

    END IF;
END $$

DELIMITER ;


-- Habitaciones disponibles para X fecha
DELIMITER $$

CREATE PROCEDURE sp_habitaciones_disponibles_por_fecha(IN p_fecha DATE)
BEGIN
    SELECT 
        h.id_habitacion,
        h.numero,
        th.nombre_tipo AS tipo,
        h.estado
    FROM habitacion h
    JOIN tipo_habitacion th ON h.id_tipo = th.id_tipo
    WHERE h.estado = 'disponible'
      AND h.id_habitacion NOT IN (
          SELECT r.id_habitacion
          FROM reserva r
          WHERE p_fecha BETWEEN r.fecha_inicio AND r.fecha_fin
            AND r.estado IN ('confirmada', 'finalizada')
      )
    ORDER BY h.numero ASC;
END$$

DELIMITER ;


----------------------------------------------------------------------------------------
-- Trigger
-- Registrar automáticamente en log_pago cada nuevo pago insertado en la tabla pago.
DELIMITER $$

CREATE TRIGGER tr_log_pago_after_insert
AFTER INSERT ON pago
FOR EACH ROW
BEGIN
    INSERT INTO log_pago (
        id_pago, id_reserva, fecha_pago, monto, id_tipo_pago
    ) VALUES (
        NEW.id_pago, NEW.id_reserva, NEW.fecha_pago, NEW.monto_total, NEW.id_tipo_pago
    );
END $$

DELIMITER ;


-- Auditar cambios de precio en la tabla servicio.
DELIMITER //

CREATE TRIGGER tr_actualizar_precio_servicio
BEFORE UPDATE ON servicio
FOR EACH ROW
BEGIN
    IF OLD.precio <> NEW.precio THEN
        INSERT INTO auditoria_precio_servicio (
            id_servicio, precio_anterior, precio_nuevo, id_empleado, motivo
        )
        VALUES (
            OLD.id_servicio,
            OLD.precio,
            NEW.precio,
            NULL, -- reemplazar por ID del empleado si lo manejás desde aplicación
            'Actualización manual del precio del servicio'
        );
    END IF;
END;
//

DELIMITER ;


-- Audita cambios en la tabla tipo_habitacion.
DELIMITER //

CREATE TRIGGER tr_actualizar_precio_habitacion
BEFORE UPDATE ON tipo_habitacion
FOR EACH ROW
BEGIN
    IF OLD.precio_base <> NEW.precio_base THEN
        INSERT INTO auditoria_precio_habitacion (
            id_tipo, precio_anterior, precio_nuevo, id_empleado, motivo
        )
        VALUES (
            OLD.id_tipo,
            OLD.precio_base,
            NEW.precio_base,
            NULL, -- reemplazar si se gestiona el empleado en contexto
            'Actualización manual del precio del tipo de habitación'
        );
    END IF;
END;
//

DELIMITER ;


-- Registrar automáticamente una alerta cuando una habitación entra en "mantenimiento".
DELIMITER $$

CREATE TRIGGER tr_alerta_habitacion_mantenimiento
AFTER UPDATE ON habitacion
FOR EACH ROW
BEGIN
    IF OLD.estado <> 'mantenimiento' AND NEW.estado = 'mantenimiento' THEN
        INSERT INTO alertas_habitacion (
            id_habitacion, motivo
        ) VALUES (
            NEW.id_habitacion, 'Habitación pasada a mantenimiento'
        );
    END IF;
END $$

DELIMITER ;


-- Evitar que se modifique una reserva cancelada
DELIMITER $$

CREATE TRIGGER tr_proteger_reserva_cancelada
BEFORE UPDATE ON reserva
FOR EACH ROW
BEGIN
    IF OLD.estado = 'cancelada' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede modificar una reserva cancelada';
    END IF;
END $$

DELIMITER ;


---------------------------------------------------------------------------------------
-- FUNCIONES
-- Busca la fecha_nacimiento del huésped y calcula su edad
DELIMITER $$

CREATE FUNCTION fn_edad_huesped(p_id_huesped INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_edad INT;
    
    SELECT TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE())
    INTO v_edad
    FROM huesped
    WHERE id_huesped = p_id_huesped;

    RETURN v_edad;
END $$

DELIMITER ;


-- Calcula la duración en días de la reserva.
DELIMITER $$

CREATE FUNCTION fn_dias_estadia(p_id_reserva INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_dias INT;

    SELECT DATEDIFF(fecha_fin, fecha_inicio)
    INTO v_dias
    FROM reserva
    WHERE id_reserva = p_id_reserva;

    RETURN v_dias;
END $$

DELIMITER ;


-- Devuelve el total de los servicios cargados a una reserva, considerando el precio aplicado (puede ser con o sin bonificación).
-- Suma todos los valores de precio_aplicado asociados a una reserva específica.
DELIMITER $$

CREATE FUNCTION fn_total_servicios_reserva(p_id_reserva INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_total DECIMAL(10,2);

    SELECT IFNULL(SUM(precio_aplicado), 0)
    INTO v_total
    FROM reserva_servicio
    WHERE id_reserva = p_id_reserva;

    RETURN v_total;
END $$

DELIMITER ;


-- Calcula el total a pagar por una reserva: precio de habitación × días +  total de servicios
-- Usa las otras funciones (fn_dias_estadia y fn_total_servicios_reserva) para calcular el monto total.
DELIMITER $$

CREATE FUNCTION fn_total_a_pagar_reserva(p_id_reserva INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_total DECIMAL(10,2);
    DECLARE v_precio_base DECIMAL(10,2);
    DECLARE v_dias INT;
    DECLARE v_servicios DECIMAL(10,2);

    -- obtener precio por noche
    SELECT th.precio_base
    INTO v_precio_base
    FROM reserva r
    JOIN habitacion h ON r.id_habitacion = h.id_habitacion
    JOIN tipo_habitacion th ON h.id_tipo = th.id_tipo
    WHERE r.id_reserva = p_id_reserva;

    -- calcular días
    SET v_dias = fn_dias_estadia(p_id_reserva);

    -- calcular servicios
    SET v_servicios = fn_total_servicios_reserva(p_id_reserva);

    -- total
    SET v_total = (v_precio_base * v_dias) + v_servicios;

    RETURN v_total;
END $$

DELIMITER ;


-- Devuelve el número de habitaciones disponibles en una fecha específica. Considera que una habitación está ocupada si hay una reserva confirmada o finalizada para esa fecha.
-- Evalúa si la habitación está marcada como 'disponible' y no está comprometida por una reserva activa en esa fecha.

DELIMITER $$

CREATE FUNCTION fn_habitaciones_disponibles(p_fecha DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_total INT;

    SELECT COUNT(*) 
    INTO v_total
    FROM habitacion h
    WHERE h.estado = 'disponible'
    AND h.id_habitacion NOT IN (
        SELECT r.id_habitacion
        FROM reserva r
        WHERE p_fecha BETWEEN r.fecha_inicio AND r.fecha_fin
        AND r.estado IN ('confirmada', 'finalizada')
    );

    RETURN v_total;
END $$

DELIMITER ;