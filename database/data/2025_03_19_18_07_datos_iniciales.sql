-- Insertando roles
INSERT INTO roles (nombre) VALUES
('Administrador'),
('Director'),
('Secretaria'),
('Contador'),
('Estudiante'),
('Docente'),
('Coordinador');

INSERT INTO usuarios (rol_id, nombre, apellido, correo, contrasenia, fecha_registro, fecha_nacimiento, creado_en)
VALUES
(1, 'Juan', 'Pérez', 'juan.perez@example.com', 'hashed_password', CURRENT_DATE, '1985-03-12', NOW()),
(2, 'Maria', 'Gomez', 'maria.gomez@example.com', 'hashed_password', CURRENT_DATE, '1978-07-24', NOW()),
(3, 'Luis', 'Hernandez', 'luis.hernandez@example.com', 'hashed_password', CURRENT_DATE, '1990-01-15', NOW()),
(4, 'Ana', 'Lopez', 'ana.lopez@example.com', 'hashed_password', CURRENT_DATE, '1995-06-30', NOW()),
(5, 'Carlos', 'Ramirez', 'carlos.ramirez@example.com', 'hashed_password', CURRENT_DATE, '2002-10-10', NOW()),
(6, 'Sofia', 'Diaz', 'sofia.diaz@example.com', 'hashed_password', CURRENT_DATE, '1993-12-18', NOW()),
(7, 'Miguel', 'Fernandez', 'miguel.fernandez@example.com', 'hashed_password', CURRENT_DATE, '1988-05-21', NOW()),
(5, 'Elena', 'Martinez', 'elena.martinez@example.com', 'hashed_password', CURRENT_DATE, '2001-04-22', NOW()),
(5, 'Andres', 'Torres', 'andres.torres@example.com', 'hashed_password', CURRENT_DATE, '2003-08-17', NOW()),
(6, 'Patricia', 'Castro', 'patricia.castro@example.com', 'hashed_password', CURRENT_DATE, '1997-11-09', NOW());

-- Insertando módulos
INSERT INTO modulos (modulo) VALUES
('Gestión de Usuarios'),
('Gestión de Pagos'),
('Gestión de Cursos'),
('Gestión de Estudiantes'),
('Gestión de Empleados'),
('Reportes y Estadísticas');

-- Insertando becas
INSERT INTO becas (nombre, descuento) VALUES
('Beca Completa', 100.00),
('Media Beca', 50.00);

-- Insertando estudiantes
INSERT INTO estudiantes (usuario_id, beca_id) VALUES
(5, 1),
(8, 2),
(9, NULL),
(10, Null);

-- Insertando empleados
INSERT INTO empleados (usuario_id, salario_base) VALUES
(2, 3500.00),
(3, 2500.00),
(4, 2200.00),
(6, 3000.00),
(7, 2800.00);


-- Insertando cursos
INSERT INTO cursos (nombre) VALUES
('Matemáticas'),
('Ciencias'),
('Historia'),
('Geografía'),
('Inglés'),
('Arte'),
('Música'),
('Educación Física'),
('Computación'),
('Ética');

-- Insertando grados
INSERT INTO grado (nombre, anio) VALUES
('Primero', 2024),
('Segundo', 2024),
('Tercero', 2024),
('Cuarto', 2024),
('Quinto', 2024);


-- Insertando secciones
INSERT INTO secciones (grado_id, maestro_guia_id, seccion) VALUES
(1, 2, 'A'),
(2, 3, 'B'),
(3, 4, 'C');

-- Insertando tipos de pago
INSERT INTO tipo_pagos (nombre) VALUES
('Efectivo'),
('Transferencia'),
('Depósito'),
('Becado');

-- Insertando precios de grado
INSERT INTO grado_precio (grado_id, mensualidad, inscripcion) VALUES
(1, 500.00, 1000.00),
(2, 550.00, 1100.00),
(3, 600.00, 1200.00),
(4, 650.00, 1300.00),
(5, 700.00, 1400.00);

-- Insertando estados de pago
INSERT INTO tipo_estados (tipo) VALUES
('Pagado'),
('Pendiente'),
('Vencido');

-- Insertando pagos de estudiantes
INSERT INTO estudiante_pagos (grado_precio_id, estudiante_id, tipo_pago_id, monto_pagado, meses_pagados, periodo_inicio, periodo_fin, tipo_estado_id, creado_en, actualizado_en) VALUES
(1, 1, 1, 500.00, 1, '2024-01-01', '2024-01-31', 1, NOW(), NOW()),
(2, 2, 2, 1100.00, 2, '2024-02-01', '2024-03-31', 1, NOW(), NOW()),
(3, 3, 3, 1200.00, 2, '2024-03-01', '2024-04-30', 1, NOW(), NOW());

-- Insertando productos
INSERT INTO tipo_productos (nombre) VALUES
('Útiles Escolares'),
('Ropa Escolar'),
('Tecnología');

INSERT INTO productos (tipo_producto_id, nombre, fecha_ingreso, precio_unitario, cantidad) VALUES
(1, 'Cuaderno', CURRENT_DATE, 10.50, 100),
(1, 'Lápiz', CURRENT_DATE, 1.20, 500),
(1, 'Mochila', CURRENT_DATE, 25.00, 50),
(2, 'Camisa Escolar', CURRENT_DATE, 15.00, 30),
(2, 'Pantalón Escolar', CURRENT_DATE, 20.00, 25),
(3, 'Calculadora Científica', CURRENT_DATE, 50.00, 15),
(3, 'Laptop Estudiantil', CURRENT_DATE, 700.00, 5),
(3, 'Tablet', CURRENT_DATE, 300.00, 10),
(3, 'Auriculares', CURRENT_DATE, 25.00, 20),
(3, 'Mouse Inalámbrico', CURRENT_DATE, 15.00, 40);

-- Insertando bolsas
INSERT INTO bolsas (nombre, precio_total, creado_en, actualizado_en) VALUES
('Paquete Escolar Básico', 50.00, NOW(), NOW()),
('Paquete Escolar Avanzado', 120.00, NOW(), NOW());

-- Insertando pedidos
INSERT INTO pedidos (usuario_id, vendedor_id, precio_total, creado_en, actualizado_en) VALUES
(5, 6, 50.00, NOW(), NOW()),
(7, 8, 120.00, NOW(), NOW());


-- Insertando pagos de empleados
INSERT INTO pagos_empleados (empleado_id, periodo_mes, periodo_anio, tipo_estados, monto_base, monto_total, creado_en, actualizado_en) VALUES
(1, 3, 2024, 1, 3500.00, 3600.00, NOW(), NOW()),
(2, 3, 2024, 1, 2500.00, 2450.00, NOW(), NOW());

-- Insertando ajustes salariales
INSERT INTO tipo_ajustes (ajuste) VALUES
('Bono de Productividad'),
('Descuento de Impuestos');

INSERT INTO ajustes_salariales (pago_empleado_id, tipo_ajuste_id, descripcion, monto, creado_en) VALUES
(1, 1, 'Bono por alto rendimiento', 100.00, NOW()),
(2, 2, 'Deducción de impuestos', -50.00, NOW());

-- Insertando contactos de estudiantes
INSERT INTO estudiante_contactos (estudiante_id, contacto, nombre) VALUES
(1, 'madre@example.com', 'Madre de Juan'),
(2, 'padre@example.com', 'Padre de Maria');
