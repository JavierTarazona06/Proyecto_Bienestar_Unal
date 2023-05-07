#------------------------------------------------------------------
#Javier
#------------------------------------------------------------------

#Vista de información completa de estudiantes:

select estID,perNombre,perApellido,perEmail,estPBM,estFacultad,carreNombre,carreCreditos from estudiante join persona on (estID=perID) join carrera using (carreID);

drop view if exists vw_info_estudiante;
create view vw_info_estudiante as select * from estudiante join persona on (estID=perID) join carrera using (carreID);

select estID,perNombre,perApellido,perEmail,estPBM,estFacultad,carreNombre,carreCreditos from vw_info_estudiante;


#Vista de estudiantes con sus convocatorias:

select estID,perNombre,perApellido,perEmail,estPBM,estFacultad,carreNombre,carreCreditos,conv_id,convNombre from estudiante join persona on (estID=perID) join carrera using (carreID) left join estudiante_toma_convocatoria on (estID=idEst) left join convocatoria using (conv_id);

drop view if exists vw_info_convocatoria_estudiante;
create view vw_info_convocatoria_estudiante as select * from estudiante join persona on (estID=perID) join carrera using (carreID) left join estudiante_toma_convocatoria on (estID=idEst) left join convocatoria using (conv_id);

select estID,perNombre,perApellido,perEmail,estPBM,estFacultad,carreNombre,carreCreditos,conv_id,convNombre from vw_info_convocatoria_estudiante;


#Vista de facturas con sus productos y tienda:



select * from tiendabienestar;
select * from factura;
select * from producto;
select * from factura_producto;
select * from convocatoria;
select * from estudiante_toma_convocatoria;
select * from estudiante;
select * from carrera;
#------------------------------------------------------------------
#------------------------------------------------------------------

#------------------------------------------------------------------
#Valeria
#------------------------------------------------------------------






#------------------------------------------------------------------
#------------------------------------------------------------------

#------------------------------------------------------------------
#Carlos
#------------------------------------------------------------------






#------------------------------------------------------------------
#------------------------------------------------------------------