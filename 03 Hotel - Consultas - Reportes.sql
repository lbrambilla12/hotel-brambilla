USE hotel;

-- Consultar si la reserva fue creada correctamente
SELECT *
FROM reserva
WHERE id_reserva = @r1;

-- Consultar que servicio se asocio a la reserva
SELECT rs.*, s.nombre_servicio
FROM reserva_servicio rs
JOIN servicio s ON rs.id_servicio = s.id_servicio
WHERE id_reserva = @r1;

-- Consultar pago realizado
SELECT p.*, tp.nombre_tipo
FROM pago p
JOIN tipo_pago tp ON p.id_tipo_pago = tp.id_tipo_pago
WHERE id_reserva = @r1;

-- Verificar registros
SELECT *
FROM auditoria_estado_habitacion
WHERE id_habitacion = 13
ORDER BY id_auditoria DESC;

-- VISTA vw_ocupacion_actual
SELECT * FROM vw_ocupacion_actual
WHERE id_reserva IS NOT NULL;

-- todas las habitaciones
SELECT * FROM vw_ocupacion_actual;

-- VISTA vw_reservas_por_mes
SELECT * FROM vw_reservas_por_mes;

-- VISTA vw_servicios_por_reserva
SELECT * FROM vw_servicios_por_reserva;

-- VISTA vw_huespedes_por_ciudad
SELECT * FROM vw_huespedes_por_ciudad;

-- VISTA vw_detalle_pagos
select * FROM vw_detalle_pagos;

-- VISTA vw_empleados_con_puesto
SELECT * FROM vw_empleados_con_puesto;

-- VISTA vw_estado_habitaciones
SELECT * FROM vw_estado_habitaciones;

-- VISTA vw_historial_cambios_precios
SELECT * FROM vw_historial_cambios_precios;

-- Verificar FUNCIONAMIENTO TRIGGER tr_log_pago_after_insert
SELECT * FROM pago;
SELECT * FROM log_pago;

-- Verificar FUNCIONAMIENTO TRIGGER tr_actualizar_precio_servicio
SELECT * FROM auditoria_precio_servicio;

-- Verificar FUNCIONAMIENTO TRIGGER tr_actualizar_precio_habitacion
SELECT * FROM auditoria_precio_habitacion;

-- Verificar Funcionamiento trigger tr_alerta_habitacion_mantenimiento
SELECT * FROM alertas_habitacion;

-- Verificar funcionmiento trigger tr_proteger_reserva_cancelada


-- VERIFICARfuncionamiento FUNCIONES fn_edad_huesped(p_id_huesped INT)
SELECT fn_edad_huesped(12) AS edad;

SELECT 
    id_huesped,
    nombre,
    fecha_nacimiento,
    fn_edad_huesped(id_huesped) AS edad_actual
FROM huesped
LIMIT 10;

-- Verificar Funcionamiento fn_dias_estadia(p_id_reserva INT)
SELECT id_reserva, fecha_inicio, fecha_fin
FROM reserva
LIMIT 5;

SELECT fn_dias_estadia(3) AS dias_estadia;

SELECT 
    id_reserva,
    fecha_inicio,
    fecha_fin,
    fn_dias_estadia(id_reserva) AS dias_estadia
FROM reserva
ORDER BY id_reserva
LIMIT 10;

-- Funcionamiento fn_total_servicios_reserva(p_id_reserva INT)

SELECT id_reserva, COUNT(*) AS cantidad_servicios
FROM reserva_servicio
GROUP BY id_reserva
ORDER BY cantidad_servicios DESC;

SELECT fn_total_servicios_reserva(5) AS total_servicios;

SELECT 
    r.id_reserva,
    r.total_pago,
    fn_total_servicios_reserva(r.id_reserva) AS total_servicios
FROM reserva r
ORDER BY r.id_reserva;

-- Probar funcion fn_total_a_pagar_reserva(p_id_reserva INT)
SELECT id_reserva, id_habitacion, fecha_inicio, fecha_fin
FROM reserva
WHERE estado = 'confirmada'
LIMIT 5;

SELECT fn_total_a_pagar_reserva(4) AS total_estimado;

SELECT 
    r.id_reserva,
    fn_total_a_pagar_reserva(r.id_reserva) AS calculado,
    r.total_pago AS registrado
FROM reserva r
WHERE estado = 'confirmada';

-- Probar funcion fn_habitaciones_disponibles(p_fecha DATE)
SELECT id_habitacion, estado FROM habitacion;
SELECT id_reserva, id_habitacion, fecha_inicio, fecha_fin, estado FROM reserva;

SELECT fn_habitaciones_disponibles('2025-06-10') AS disponibles;

SELECT 
    '2025-06-08' AS fecha, fn_habitaciones_disponibles('2025-06-08') AS disponibles
UNION
SELECT 
    '2025-06-09', fn_habitaciones_disponibles('2025-06-09')
UNION
SELECT 
    '2025-06-10', fn_habitaciones_disponibles('2025-06-10');
    
    
-- SP que lista las habitaciones disponibles para XX fecha
CALL sp_habitaciones_disponibles_por_fecha('2025-06-10');

-- Reporte de servicios mas vendidos
SELECT 
    s.nombre_servicio,
    COUNT(*) AS veces_contratado,
    SUM(rs.precio_aplicado) AS ingresos_generados
FROM reserva_servicio rs
JOIN servicio s ON rs.id_servicio = s.id_servicio
GROUP BY rs.id_servicio
ORDER BY ingresos_generados DESC;

-- Servicios por reserva
SELECT * FROM vw_servicios_por_reserva
ORDER BY id_reserva;

-- Disponibilidad de Habitaciones
SELECT 
    tipo,
    COUNT(CASE WHEN estado = 'confirmada' THEN 1 END) AS ocupadas,
    COUNT(CASE WHEN estado IS NULL THEN 1 END) AS disponibles
FROM vw_ocupacion_actual
GROUP BY tipo;


-- Distribucion de Huesped por Ciudad
SELECT * FROM vw_huespedes_por_ciudad;

-- Utilizacion de medios de pago y montos
SELECT * FROM vw_detalle_pagos
ORDER BY fecha_pago DESC;

-- Datos de huesped jovenes por nacionalidad
SELECT 
    h.id_huesped,
    h.nombre,
    h.apellido,
    fn_edad_huesped(h.id_huesped) AS edad,
    h.fecha_nacimiento,
    h.email,
    h.telefono,
    h.fecha_registro,
    c.nombre AS ciudad,
    p.nombre AS provincia,
    n.pais AS nacionalidad
FROM huesped h
JOIN ciudad c ON h.id_ciudad = c.id_ciudad
JOIN provincia p ON c.id_provincia = p.id_provincia
JOIN nacionalidad n ON h.id_nacionalidad = n.id_nacionalidad
HAVING edad <= 60
ORDER BY h.apellido, h.nombre;

-- Datos de reservas por huesped entre fechas con el total estimado
SELECT 
    r.id_reserva,
    h.nombre AS huesped,
    r.fecha_inicio,
    r.fecha_fin,
    fn_total_a_pagar_reserva(r.id_reserva) AS total_estimado
FROM reserva r
JOIN huesped h ON r.id_huesped = h.id_huesped
ORDER BY r.id_reserva DESC;

-- Disponibilidad de habitaciones a X fecha
SELECT fn_habitaciones_disponibles('2025-06-15') AS habitaciones_disponibles;

-- Analisis de Ingresos Mensuales
-- Objetivo: Mostrar evolución de ingresos y volumen de reservas mensuales.
-- Útil para: Gráficos de línea o columnas de evolución financiera.
SELECT *
FROM vw_reservas_por_mes;

-- Ranking de habitaciones mas Reservadas
-- Objetivo: Determinar qué habitaciones son más solicitadas.
-- Útil para: Mejorar promociones, organización y mantenimiento.
SELECT 
    h.numero AS numero_habitacion,
    COUNT(*) AS cantidad_reservas
FROM habitacion h
JOIN reserva r ON h.id_habitacion = r.id_habitacion
GROUP BY h.numero
ORDER BY cantidad_reservas DESC
LIMIT 10;

-- Distribucion de Huespedes por Ciudad
-- Objetivo: Analizar la procedencia de los clientes.
-- Útil para: Estrategias de marketing geolocalizado.
SELECT *
FROM vw_huespedes_por_ciudad;

-- Huéspedes con un gasto total superior a X
-- Objetivo: Identificar clientes valiosos o VIP.
SELECT 
    h.id_huesped,
    h.nombre,
    h.apellido,
    fn_total_a_pagar_reserva(r.id_reserva) AS total_reserva
FROM huesped h
JOIN reserva r ON h.id_huesped = r.id_huesped
HAVING total_reserva > 200000
ORDER BY total_reserva DESC;

-- Reservas con más servicios bonificados
-- Objetivo: Saber qué reservas recibieron más beneficios.
SELECT 
    rs.id_reserva,
    COUNT(*) AS cantidad_bonificados
FROM reserva_servicio rs
WHERE rs.bonificado = TRUE
GROUP BY rs.id_reserva
ORDER BY cantidad_bonificados DESC
LIMIT 5;

-- Habitaciones en mantenimiento este mes
-- Objetivo: Controlar operaciones y planificación de mantenimiento.
SELECT 
    h.numero,
    a.estado_nuevo,
    a.fecha_cambio
FROM habitacion h
JOIN auditoria_estado_habitacion a ON h.id_habitacion = a.id_habitacion
WHERE a.estado_nuevo = 'mantenimiento'
  AND MONTH(a.fecha_cambio) = MONTH(CURDATE())
  AND YEAR(a.fecha_cambio) = YEAR(CURDATE());


-- Edad promedio de huéspedes por Provincia
-- Objetivo: Perfilar a los huéspedes y sus preferencias.
SELECT 
    p.nombre AS provincia,
    ROUND(AVG(fn_edad_huesped(h.id_huesped)), 1) AS edad_promedio
FROM huesped h
JOIN ciudad c ON h.id_ciudad = c.id_ciudad
JOIN provincia p ON c.id_provincia = p.id_provincia
GROUP BY p.nombre
ORDER BY edad_promedio DESC;

-- Se utiliza como herramientas y tecnologias
-- MySQL, github, Microsoft Word / Excel