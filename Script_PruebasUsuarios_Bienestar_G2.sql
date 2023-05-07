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

	#Accesos y vistas

select * from TorneoInterno;

select * from vw_info_curso_libre_convocatoria;

select * from vw_info_factura;