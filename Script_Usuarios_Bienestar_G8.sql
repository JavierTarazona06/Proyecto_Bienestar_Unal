-- Tomás ------
-- user admin del Iparm
create user "adminIPARM"@"localhost" identified by "root";
grant all on vw_direcciónIparm  to "adminIPARM"@"localhost" ;

-- create user madre Ana
create user "Ana"@"localhost" identified by "root";
grant select on vw_userAna to "Ana"@"localhost";
grant select on  vw_childAna to "Ana"@"localhost";
grant select on vw_inscripChildAna to "Ana"@"localhost";

-- Tomás --

#----------------------------------------------------------------------
#                       Sebastián
#----------------------------------------------------------------------
create user "direccionAI"@"localhost" identified by "root";
grant all on convocatoria to "direccionAI"@"localhost";
grant all on proyectoestudiantil to "direccionAI"@"localhost";
grant all on grupoproyectoestudiantil to "direccionAI"@"localhost";
grant all on apoyogp to "direccionAI"@"localhost";
grant all on integrantegpe to "direccionAI"@"localhost";
grant all on actividadai to "direccionAI"@"localhost";
grant all on participacionactividadai to "direccionAI"@"localhost";
grant all on asesoria to "direccionAI"@"localhost";
grant all on convocatoriapromotorconvivencia to "direccionAI"@"localhost";
grant all on estudiante_toma_convocatoria to "direccionAI"@"localhost";
grant all on promotorconvivencia to "direccionAI"@"localhost";

create user 'estudiante'@'localhost' identified by 'root';
grant select on vw_actividadesdisponiblesAI to "estudiante"@"localhost";
grant select on vw_gruposproyectosest to "estudiante"@"localhost";
grant select on convocatoriapromotorconvivencia to "estudiante"@"localhost";

create user 'asesor'@'localhost' identified by 'root';
grant all on asesoria to 'asesor'@'localhost';