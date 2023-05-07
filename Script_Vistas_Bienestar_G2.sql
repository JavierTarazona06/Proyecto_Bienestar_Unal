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

select factID,factFecha,factHora,factDetalle,prodID,prodPrecio,prodDetalle,clienteID,perNombre,perApellido,perEmail,tieID,tieDireccion,tieCiudad from factura join factura_producto using (factID) join producto using (prodID) join persona on (clienteID=perID) join tiendabienestar using (tieID);
drop view if exists vw_info_factura;
create view vw_info_factura as select factID,factFecha,factHora,factDetalle,prodID,prodPrecio,prodDetalle,clienteID,perNombre,perApellido,perEmail,tieID,tieDireccion,tieCiudad from factura join factura_producto using (factID) join producto using (prodID) join persona on (clienteID=perID) join tiendabienestar using (tieID);
select * from vw_info_factura;


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


#Vista de grupos artisticos institucionales y sus convocatorias.

select gaiNombre, gaiDisciplina, convFechaApertura, convFechaApertura,convGaiEntrevista, convFechaCierre, convEstado, convPeriodo from GrupoArtisticoInstitucional join ConvocatoriaGAI on (GAI_id = GrupoArtisticoInstitucional_GAI_id) join Convocatoria on (Convocatoria_conv_id = conv_id);
drop view if exists vw_info_gai_convocatoria;
create view vw_info_gai_convocatoria as select gaiNombre, gaiDisciplina convFechaApertura, convFechaCierre, convGaiEntrevista, convEstado, convPeriodo from GrupoArtisticoInstitucional join ConvocatoriaGAI on (GAI_id = GrupoArtisticoInstitucional_GAI_id) join Convocatoria on (Convocatoria_conv_id = conv_id);
select * from vw_info_gai_convocatoria;


#Vista de convocatorias a selecciones deportivas.

select progNombre, convNombre, convFechaApertura, convFechaCierre, convPeriodo, convDeporte, convLugar, convHora from Programa join Convocatoria on (Programa_progID = progID) join ConvocatoriaSeleccion on (Convocatoria_conv_id = conv_id);
drop view if exists vw_info_seleccion_convocatoria;
create view vw_info_seleccion_convocatoria as select progNombre, convNombre, convFechaApertura, convFechaCierre, convPeriodo, convDeporte, convLugar, convHora from Programa join Convocatoria on (Programa_progID = progID) join ConvocatoriaSeleccion on (Convocatoria_conv_id = conv_id);
select * from vw_info_seleccion_convocatoria;


#Vista de convocatorias a cursos libres de deportes.

select progNombre, convNombre, curNombre, curTipoCurso, curCondicion, convFechaApertura, convFechaCierre, convPeriodo  from Programa join Convocatoria on (Programa_progID = progID) join ConvocatoriaCursoLibre on (Convocatoria_conv_id = conv_id);
drop view if exists vw_info_curso_libre_convocatoria;
create view vw_info_curso_libre_convocatoria as select progNombre, convNombre, curNombre, curTipoCurso, curCondicion, convFechaApertura, convFechaCierre, convPeriodo from Programa join Convocatoria on (Programa_progID = progID) join ConvocatoriaCursoLibre on (Convocatoria_conv_id = conv_id);
select * from vw_info_curso_libre_convocatoria;



#------------------------------------------------------------------
#------------------------------------------------------------------