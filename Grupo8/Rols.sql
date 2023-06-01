drop role if exists 'estudiante'@'localhost';
drop role if exists 'no_estudiante'@'localhost';
drop role if exists 'direccion_cultura'@'localhost';
drop role if exists 'direccion_unidadEspecial'@'localhost';
drop role if exists 'direccion_integracion'@'localhost';
drop role if exists 'administrador'@'localhost';

CREATE ROLE 'estudiante'@'localhost';
CREATE ROLE 'no_estudiante'@'localhost';
CREATE ROLE 'direccion_cultura'@'localhost';
CREATE ROLE 'direccion_integracion'@'localhost';
CREATE ROLE 'direccion_unidadEspecial'@'localhost';
CREATE ROLE 'administrador'@'localhost'; 