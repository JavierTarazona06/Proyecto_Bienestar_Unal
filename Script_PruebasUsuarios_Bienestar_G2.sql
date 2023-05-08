use bienestar;

#Pruebas en Estudiante:

select * from convocatoria;
insert into convocatoria (conv_id,convNombre,convFechaApertura,convFechaCierre,convEstado,Programa_progID) values (17,'Fomento Económico Estudiantes','2023-01-15','2023-02-1',1,1);

select * from convocatoriagestionalimentaria;
insert into convocatoriagestionalimentaria values (5,'Cena','Comedor Central');
select * from convocatoriagestionalimentaria;
update convocatoriagestionalimentaria set cgaComida = Cena where cgaLugar = 'Comedor Central';

select * from vw_info_estudiante;
insert into estudiante (estID,carreID,estEdad,estFacultad,estPBM,estTipoAdmision,estEsEgresado) values (1,'36','17','Ingeniería','73','Regular','0');
update vw_info_estudiante set perDireccion='Dirección Modificada' where estID=4;
select * from vw_info_estudiante;

select * from vw_info_convocatoria_estudiante;
delete from vw_info_convocatoria_estudiante;

#Pruebas director bienestar economico

select * from convocatoriagestioneconomica;
select * from convocatoria;

insert into convocatoria (conv_id,convNombre,convFechaApertura,convFechaCierre,convEstado,Programa_progID) values (17,'Fomento Económico Estudiantes','2023-01-15','2023-02-01',1,1);
insert into convocatoriagestioneconomica values (17,1500000);
select * from convocatoria;
select * from convocatoriagestioneconomica;

update convocatoriagestioneconomica set cgeCobertura=2000000 where conv_id=17;
select * from convocatoriagestioneconomica;

delete from convocatoriagestioneconomica where conv_id=17;
delete from convocatoria where conv_id=17;
select * from convocatoria;
select * from convocatoriagestioneconomica;

select * from actividadcorresp;
delete from actividadcorresp where estID=18;
select * from actividadcorresp;

# -----------------------------------  Pruebas bienestar salud --------------------------------------------

SELECT * FROM citamedica;
INSERT INTO citamedica (idCitaMedica, doctorID, citFecha, citEspecialidad) VALUES
	(1008, 30, '2023-05-20 00:08:30', 'General'),
    (1007, 70, '2023-05-20 00:09:30', 'Cardiologo'),
    (1005, 50, '2023-05-20 00:10:30', 'Psicologia');
SELECT * FROM citamedica WHERE pacienteID IS NULL;

DELETE FROM citamedica WHERE doctorID = 50 AND pacienteID IS NULL;
SELECT * FROM citamedica WHERE pacienteID IS NULL;

UPDATE citamedica SET citFecha = '2023-05-20 00:11:30' WHERE doctorID = 70 AND pacienteID IS NULL;

# ---------------------------------------------  No estudiante --------------------------------------------
SELECT * FROM vw_citamedica_disponible;
UPDATE citamedica SET pacienteID = 10 WHERE citFecha = '2023-05-20 00:08:30' AND citEspecialidad = 'General';
SELECT * FROM vw_citamedica_disponible;

SELECT * FROM vw_doctor_procedimiento WHERE paciente = 10;


	#Accesos y vistas

select * from TorneoInterno;

select * from vw_info_curso_libre_convocatoria;

select * from vw_info_factura;


# -----------------------------------  Pruebas bienestar deportes --------------------------------------------
# distintos usuarios
select * from TorneoInterno;
select * from ConvocatoriaSeleccion;

select * from vw_info_curso_libre_convocatoria;
select * from vw_info_gai_convocatoria;
select * from vw_info_seleccion_convocatoria;

update TorneoInterno set torEstado = 0 where torEstado = 0 and torNombreTorneo = "Torneo de Futbol de la Facultad de Ciencias"; 
