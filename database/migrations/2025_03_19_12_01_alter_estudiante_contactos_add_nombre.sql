ALTER TABLE estudiante_contactos
ADD COLUMN nombre VARCHAR(100) NOT NULL;

-- JUSTIFICACIÓN --
/* 
	La columna nombre se agregó para identificar a la persona a la que pertenece el contacto,
	por ejemplo: “Papá”, “Hermano”, “Tutor”, etc. 
	De esta forma no solo se registra el método de contacto, sino también a quién corresponde.
*/