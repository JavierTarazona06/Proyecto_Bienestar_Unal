use Bienestar;
#----------------------------------------------------------------------
#                       Santiago 
#----------------------------------------------------------------------

#Vista para acceder a la información de las convocatorias por grupo artistico institucional
drop view if exists vw_convocatoriaPorGAI;
create view vw_convocatoriaPorGAI as 
select bienestar.grupoartisticoinstitucional.GAI_id as GrupoID, bienestar.grupoartisticoinstitucional.gaiNombre as Nombre_grupo, bienestar.grupoartisticoinstitucional.gaiDisciplina as Disciplina,
bienestar.grupoartisticoinstitucional.gaiRequerimientoTecnico as Requerimiento_Tecnico, bienestar.convocatoria.convNombre as Nombre_convocatoria,
bienestar.convocatoria.convEstado as Estado
from ((bienestar.grupoartisticoinstitucional join bienestar.convocatoriagai on bienestar.grupoartisticoinstitucional.GAI_id = bienestar.convocatoriagai.GrupoArtisticoInstitucional_GAI_id)
join bienestar.convocatoria on bienestar.convocatoriagai.Convocatoria_conv_id = bienestar.convocatoria.conv_id);

select * from vw_convocatoriaPorGAI;

drop view if exists vw_convocatoriasCultura;
create view vw_convocatoriasCultura as select bienestar.convocatoria.conv_id as convId, bienestar.convocatoria.convNombre as convNombre,
bienestar.convocatoria.convFechaApertura as FechaApertura, bienestar.convocatoria.convFechaCierre as FechaCierre 
from bienestar.convocatoria where bienestar.convocatoria.convEstado = 1 and (bienestar.convocatoria.Programa_progID = 3 or bienestar.convocatoria.Programa_progID = 4);

select * from vw_convocatoriasCultura;