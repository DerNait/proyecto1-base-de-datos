CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    rol_id INT REFERENCES roles(id) ON DELETE SET NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(255) NOT NULL,
    contrasenia VARCHAR(255) NOT NULL,
    fecha_registro DATE NOT NULL,
    fecha_nacimiento DATE,
    creado_en TIMESTAMP NOT NULL,
    actualizado_en TIMESTAMP
);

CREATE TABLE modulos (
    id SERIAL PRIMARY KEY,
    modulo VARCHAR(100) NOT NULL
);

CREATE TABLE modulos_permisos (
    id SERIAL PRIMARY KEY,
    modulo_id INT NOT NULL REFERENCES modulos(id) ON DELETE CASCADE,
    permiso VARCHAR(100) NOT NULL
);

CREATE TABLE rol_modulos_permisos (
    id SERIAL PRIMARY KEY,
    rol_id INT NOT NULL REFERENCES roles(id) ON DELETE CASCADE,
    modulo_permiso_id INT NOT NULL REFERENCES modulos_permisos(id) ON DELETE CASCADE
);

CREATE TABLE becas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descuento DECIMAL(5,2) NOT NULL
);

CREATE TABLE estudiantes (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    beca_id INT REFERENCES becas(id) ON DELETE SET NULL
);

CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    salario_base DECIMAL(10,2) NOT NULL
);

CREATE TABLE cursos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE grado (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    anio INT NOT NULL
);

CREATE TABLE grado_cursos (
    id SERIAL PRIMARY KEY,
    grado_id INT NOT NULL REFERENCES grado(id) ON DELETE CASCADE,
    curso_id INT NOT NULL REFERENCES cursos(id) ON DELETE CASCADE
);

CREATE TABLE secciones (
    id SERIAL PRIMARY KEY,
    grado_id INT NOT NULL REFERENCES grado(id) ON DELETE CASCADE,
    maestro_guia_id INT REFERENCES empleados(id) ON DELETE SET NULL,
    seccion VARCHAR(100) NOT NULL
);

CREATE TABLE seccion_estudiantes (
    id SERIAL PRIMARY KEY,
    seccion_id INT NOT NULL REFERENCES secciones(id) ON DELETE CASCADE,
    estudiante_id INT NOT NULL REFERENCES estudiantes(id) ON DELETE CASCADE
);

CREATE TABLE actividades (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    grado_curso_id INT NOT NULL REFERENCES grado_cursos(id) ON DELETE CASCADE
);

CREATE TABLE estudiante_notas (
    id SERIAL PRIMARY KEY,
    seccion_estudiante_id INT NOT NULL REFERENCES seccion_estudiantes(id) ON DELETE CASCADE,
    actividad_id INT NOT NULL REFERENCES actividades(id) ON DELETE CASCADE,
    nota DECIMAL(5,2)
);

CREATE TABLE maestro_cursos (
    id SERIAL PRIMARY KEY,
    maestro_id INT NOT NULL REFERENCES empleados(id) ON DELETE CASCADE,
    curso_id INT NOT NULL REFERENCES cursos(id) ON DELETE CASCADE,
    seccion_id INT NOT NULL REFERENCES secciones(id) ON DELETE CASCADE
);

CREATE TABLE grado_precio (
    id SERIAL PRIMARY KEY,
    grado_id INT NOT NULL REFERENCES grado(id) ON DELETE CASCADE,
    mensualidad DECIMAL(10,2) NOT NULL,
    inscripcion DECIMAL(10,2) NOT NULL
);

CREATE TABLE tipo_productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    tipo_producto_id INT NOT NULL REFERENCES tipo_productos(id) ON DELETE CASCADE,
    nombre VARCHAR(100) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    cantidad INT NOT NULL
);

CREATE TABLE bolsas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio_total DECIMAL(10,2) NOT NULL,
    creado_en TIMESTAMP NOT NULL,
    actualizado_en TIMESTAMP
);

CREATE TABLE bolsas_detalles (
    id SERIAL PRIMARY KEY,
    bolsa_id INT NOT NULL REFERENCES bolsas(id) ON DELETE CASCADE,
    producto_id INT NOT NULL REFERENCES productos(id) ON DELETE CASCADE
);

CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    vendedor_id INT NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    precio_total DECIMAL(10,2) NOT NULL,
    creado_en TIMESTAMP NOT NULL,
    actualizado_en TIMESTAMP
);

CREATE TABLE pedido_detalles (
    id SERIAL PRIMARY KEY,
    pedido_id INT NOT NULL REFERENCES pedidos(id) ON DELETE CASCADE,
    producto_id INT REFERENCES productos(id) ON DELETE SET NULL,
    bolsa_id INT REFERENCES bolsas(id) ON DELETE SET NULL
);

CREATE TABLE tipo_pagos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE tipo_estados (
    id SERIAL PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL
);

CREATE TABLE estudiante_pagos (
    id SERIAL PRIMARY KEY,
    grado_precio_id INT NOT NULL REFERENCES grado_precio(id) ON DELETE CASCADE,
    estudiante_id INT NOT NULL REFERENCES estudiantes(id) ON DELETE CASCADE,
    tipo_pago_id INT NOT NULL REFERENCES tipo_pagos(id) ON DELETE CASCADE,
    monto_pagado DECIMAL(10,2) NOT NULL,
    meses_pagados INT NOT NULL,
    periodo_inicio DATE NOT NULL,
    periodo_fin DATE NOT NULL,
    tipo_estado_id INT NOT NULL REFERENCES tipo_estados(id) ON DELETE CASCADE,
    creado_en TIMESTAMP NOT NULL,
    actualizado_en TIMESTAMP
);

CREATE TABLE pagos_empleados (
    id SERIAL PRIMARY KEY,
    empleado_id INT NOT NULL REFERENCES empleados(id) ON DELETE CASCADE,
    periodo_mes INT NOT NULL,
    periodo_anio INT NOT NULL,
    tipo_estados INT NOT NULL REFERENCES tipo_estados(id) ON DELETE CASCADE,
    monto_base DECIMAL(10,2) NOT NULL,
    monto_total DECIMAL(10,2) NOT NULL,
    creado_en TIMESTAMP NOT NULL,
    actualizado_en TIMESTAMP
);

CREATE TABLE tipo_ajustes (
    id SERIAL PRIMARY KEY,
    ajuste VARCHAR(100) NOT NULL
);

CREATE TABLE ajustes_salariales (
    id SERIAL PRIMARY KEY,
    pago_empleado_id INT NOT NULL REFERENCES pagos_empleados(id) ON DELETE CASCADE,
    tipo_ajuste_id INT NOT NULL REFERENCES tipo_ajustes(id) ON DELETE CASCADE,
    descripcion TEXT,
    monto DECIMAL(10,2) NOT NULL,
    creado_en TIMESTAMP NOT NULL
);