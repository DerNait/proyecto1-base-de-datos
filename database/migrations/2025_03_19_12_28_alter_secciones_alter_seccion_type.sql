ALTER TABLE secciones
ALTER COLUMN seccion TYPE VARCHAR(1);

-- JUSTIFICACIÓN --
/* 
	Se optó por restringir la longitud de seccion a 1 carácter porque cada 
	sección realmente se representa con una sola letra (A, B, C...). 
	Esto refuerza la consistencia de la información y evita que se ingresen 
	valores más largos de lo necesario, ahorrandonos espacio.
*/