CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ultimo_login DATETIME NULL,
    estado ENUM('activo', 'inactivo') DEFAULT 'activo'
);

INSERT INTO usuarios (nombre, email, password, estado)
VALUES 
('Ana', 'ana@example.com', '12345', 'activo'),
('Carlos', 'carlos@example.com', '12345', 'activo'),
('Luisa', 'luisa@example.com', '12345', 'inactivo');
