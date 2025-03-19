ALTER TABLE usuarios
ADD CONSTRAINT usuarios_correo_unique UNIQUE (correo);

ALTER TABLE usuarios
ALTER COLUMN fecha_registro SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN creado_en SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN actualizado_en SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE bolsas
ALTER COLUMN creado_en SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN actualizado_en SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE pedidos
ALTER COLUMN creado_en SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN actualizado_en SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE productos
ALTER COLUMN fecha_ingreso SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE estudiante_pagos
ALTER COLUMN creado_en SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN actualizado_en SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE pagos_empleados
ALTER COLUMN creado_en SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN actualizado_en SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE ajustes_salariales
ALTER COLUMN creado_en SET DEFAULT CURRENT_TIMESTAMP;

-- JUSTIFICACIÓN --
/* 
	Se agregaron restricciones para las fechas, dandoles un valor default de ahora, en caso de que no se mande algún valor
	ademas de que permite que se guarde el instante exacto de cuando fue creado un registro y si no se ha actualizado
	manendra el timestamp de la fecha de creación. También se restringió que el correo debe ser unico, para evitar
	que existan usuarios con el mismo correo causando conflictos. 
*/