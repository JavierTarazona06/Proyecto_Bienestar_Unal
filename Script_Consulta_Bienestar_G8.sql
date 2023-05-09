use Bienestar;

#----------------------------------------------------------------------
#                                  Sebastián
#----------------------------------------------------------------------

#1 - Número de estudiantes por grupo estudiantil; nombre y linea de acción del grupo; nombre y descripción del proyecto.
select gpNombre, gpLineadeAccion, count(EstudianteID) as integrantes, peNombre, peDescripcion from (integrantegpe join grupoproyectoestudiantil on (integrantegpe.GrupoID=grupoproyectoestudiantil.gpID)) join proyectoestudiantil on (grupoproyectoestudiantil.proyectoID = proyectoestudiantil.peID) group by gpNombre;

#2 - Nombre, email y facultad de las personas que asistieron a la actividad "Encendiendo la llama del cambio"
select perNombre, perApellido, perEmail, perFacultad, actNombre, actFecha from (actividadai join participacionactividadai on (actividadai.actID = participacionactividadai.ActividadID)) join persona on(participacionactividadai.EstudianteID = persona.perID)  where actNombre like "%llama%";

#3 - Estudiantes que fueron aceptados en las convocatorias de promotores de convivencia
select perNombre, perApellido, perEmail, perFacultad, pcHorasRequeridas, pcDuracionVinculacion, pcEstimuloEconomico, pcDescripcion from ((convocatoriapromotorconvivencia join convocatoria on (convocatoria.conv_id = convocatoriapromotorconvivencia.convID)) join promotorconvivencia on (promotorconvivencia.ConvocatoriaID = convocatoria.conv_id)) join persona on (promotorconvivencia.EstudianteID = persona.perID);

#4 - Tipo de asesoria, fecha y lugar; nombre y correo de la persona y del asesor involucrados en la asesoria.
select asTipo, asFecha, asLugar, persona.perNombre, persona.perApellido, persona.perEmail, asesor.perNombre as asesorNombre, asesor.perApellido as asesorApellido, asesor.perEmail as asesorEmail from (asesoria join persona on (asesoria.EstudianteID = persona.perID)) join persona as asesor on (asesoria.AsesorID = asesor.perID);

#--------------------------------------
#           Santiago 
#--------------------------------------
-- selección para ver que convocatorias estan activas para cada grupo artistico institucional
select grupoartisticoinstitucional.gaiNombre,convocatoria.convNombre, convocatoria.convFechaApertura, convocatoria.convFechaCierre, convocatoria.convEstado 
from (grupoartisticoinstitucional join convocatoriagai on grupoartisticoinstitucional.GAI_id = convocatoriagai.GrupoArtisticoInstitucional_GAI_id)
join convocatoria on convocatoriagai.Convocatoria_conv_id=convocatoria.conv_id;  
-- selección para ver el director y la displina de cada convocatoria, con su periodo
select grupoartisticoinstitucional.gaiNombreDirector, grupoartisticoinstitucional.gaiDisciplina , convocatoria.convNombre, convocatoria.convPeriodo
from (grupoartisticoinstitucional join convocatoriagai on grupoartisticoinstitucional.GAI_id = convocatoriagai.GrupoArtisticoInstitucional_GAI_id)
join convocatoria on convocatoriagai.Convocatoria_conv_id=convocatoria.conv_id;
-- seleccion para ver la disciplina y el tipo de los grupos artisticos institucionales de las convocatorias activas
select grupoartisticoinstitucional.gaiNombre,grupoartisticoinstitucional.gaiDisciplina, grupoartisticoinstitucional.eveCulTipo
from ((grupoartisticoinstitucional join convocatoriagai on grupoartisticoinstitucional.GAI_id = convocatoriagai.GrupoArtisticoInstitucional_GAI_id)
join convocatoria on convocatoriagai.Convocatoria_conv_id=convocatoria.conv_id) where convocatoria.convEstado=1;
-- selección para si hay una convocatoria activa para el grupo de Danzas folclóricas
select grupoartisticoinstitucional.gaiNombre,convocatoria.convNombre,convocatoria.convEstado
from ((grupoartisticoinstitucional join convocatoriagai on grupoartisticoinstitucional.GAI_id = convocatoriagai.GrupoArtisticoInstitucional_GAI_id)
join convocatoria on convocatoriagai.Convocatoria_conv_id=convocatoria.conv_id) where grupoartisticoinstitucional.gaiNombre = "Danzas folclóricas";