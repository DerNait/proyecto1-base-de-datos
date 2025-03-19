CREATE TABLE estudiante_contactos (
    id SERIAL PRIMARY KEY,
    estudiante_id INT NOT NULL REFERENCES estudiantes(id) ON DELETE CASCADE,
    contacto VARCHAR(255) NOT NULL
);

-- JUSTIFICACIÓN --
/* 
	Se introdujo esta tabla para permitir que cada estudiante registre múltiples contacto,
	por ejemplo: teléfono de la madre, correo del padre, etc. 
	Con ON DELETE CASCADE garantizamos que si un estudiante es eliminado, también se eliminen sus contactos asociados, 
	ya que estos pierden sentido si no esta el estudiante.
*/