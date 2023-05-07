#Pruebas en Estudiante:

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
update estudiante set perDireccion='Dirección Modificada' where estID=4;
select * from vw_info_estudiante;