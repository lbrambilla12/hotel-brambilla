USE Hotel;
-- Crear usuarios
CREATE USER 'admin_hotel'@'localhost' IDENTIFIED BY 'admin123';
CREATE USER 'editor_hotel'@'localhost' IDENTIFIED BY 'editor123';
CREATE USER 'usuario_consulta'@'localhost' IDENTIFIED BY 'consulta123';

-- Otorgar permisos al usuario administrador (todos los privilegios)
GRANT ALL PRIVILEGES ON hotel.* TO 'admin_hotel'@'localhost';

-- Otorgar permisos al usuario editor (puede consultar y manipular datos, pero no administrar usuarios)
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON hotel.* TO 'editor_hotel'@'localhost';

-- Otorgar permisos de solo lectura al usuario de consulta
GRANT SELECT ON hotel.* TO 'usuario_consulta'@'localhost';

-- Aplicar los cambios de privilegios
FLUSH PRIVILEGES;