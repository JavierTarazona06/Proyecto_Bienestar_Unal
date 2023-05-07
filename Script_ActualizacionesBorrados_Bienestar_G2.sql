select * from convocatoriagestionalimentaria;
update convocatoriagestionalimentaria set cgaComida = 'Cena' where cgaLugar = 'Comedor Central';

select * from vw_info_estudiante;
update vw_info_estudiante set perDireccion='Dirección Modificada' where estID=4;


select * from convocatoriagestionalojamiento;
delete from convocatoriagestionalojamiento where conv_id=8;


select * from convocatoriagestioneconomica;
update convocatoriagestioneconomica set cgeCobertura=cgeCobertura/2 where conv_ID=1;

update convocatoriagestioneconomica set cgeCobertura=2000000 where conv_id=16;
select * from convocatoriagestioneconomica;

select * from tiendabienestar;
update tiendabienestar set tieHorFinal='20:00:00' where tieID=2;

SET foreign_key_checks = 0;
select * from producto;
delete from producto where prodPrecio<100000;
SET foreign_key_checks = 1;

# --------------------------------------------- AREA DE SALUD ---------------------------------------------------
SELECT * FROM citamedica;
UPDATE citamedica SET citDiagnostico = 'reservado' WHERE citDiagnostico = 'muerte';
SELECT * FROM citamedica;

SELECT * FROM medicamentos;
DELETE FROM medicamentos WHERE medNombre = 'Noxpirin';
SELECT * FROM medicamentos;

SELECT * FROM personalsalud;
UPDATE personalsalud SET salEspecializacion = 'Jefe' WHERE perID = 10;
SELECT * FROM personalsalud;

SELECT * FROM discapacidad;
UPDATE discapacidad SET disVerificado = 1 WHERE perID = 12;
DELETE FROM discapacidad WHERE perID = 200;
SELECT * FROM discapacidad;
