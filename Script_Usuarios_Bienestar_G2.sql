use bienestar;

drop user if exists 'estudiante'@'localhost';
drop user if exists 'no_estudiante'@'localhost';
drop user if exists 'secretaria'@'localhost';
drop user if exists 'direccion_economica'@'localhost';
drop user if exists 'direccion_salud'@'localhost';
drop user if exists 'direccion_deporte'@'localhost';
drop user if exists 'direccion_cultural'@'localhost';
CREATE user 'estudiante'@'localhost' identified by 'root';
CREATE user 'no_estudiante'@'localhost' identified by 'root';
CREATE user 'secretaria'@'localhost' identified by 'root';
CREATE user 'direccion_economica'@'localhost' identified by 'root';
CREATE user 'direccion_salud'@'localhost' identified by 'root';
CREATE user 'direccion_deporte'@'localhost' identified by 'root';
CREATE user 'direccion_cultural'@'localhost' identified by 'root';

#-------------------------------------------------------------------
#Javier
#--------------------------------------------------------------------

grant select,update on bienestar.persona to 'estudiante'@'localhost';
grant select,update on bienestar.estudiante to 'estudiante'@'localhost';

grant select on bienestar.Carrera to 'estudiante'@'localhost';
grant select on bienestar.Area to 'estudiante'@'localhost';
grant select on bienestar.Programa to 'estudiante'@'localhost';
grant select on bienestar.Programa_tiene_EventoTaller to 'estudiante'@'localhost';
grant select on bienestar.EventoTaller to 'estudiante'@'localhost';
grant select on bienestar.Programa_tiene_proyecto to 'estudiante'@'localhost';
grant select on bienestar.Proyecto to 'estudiante'@'localhost';
grant select on bienestar.Convocatoria to 'estudiante'@'localhost';
grant select on bienestar.Estudiante_toma_convocatoria to 'estudiante'@'localhost';
grant select on bienestar.TiendaBienestar to 'estudiante'@'localhost';
grant select on bienestar.empleado_tiendaUN to 'estudiante'@'localhost';
grant select on bienestar.Producto to 'estudiante'@'localhost';
grant select on bienestar.producto_tiendaUN to 'estudiante'@'localhost';
grant select on bienestar.Factura to 'estudiante'@'localhost';
grant select on bienestar.factura_producto to 'estudiante'@'localhost';
grant select on bienestar.FallaAlimentacion to 'estudiante'@'localhost';
grant select on bienestar.ActividadCorresp to 'estudiante'@'localhost';
grant select on bienestar.Corresponsabilidad to 'estudiante'@'localhost';

grant select,insert on bienestar.ConvocatoriaGestionAlimentaria to 'estudiante'@'localhost';
grant select,insert on bienestar.ConvocatoriaGestionTransporte to 'estudiante'@'localhost';
grant select,insert on bienestar.ConvocatoriaGestionEconomica to 'estudiante'@'localhost';
grant select,insert on bienestar.ConvocatoriaFomentoEmprendimeinto to 'estudiante'@'localhost';
grant select,insert on bienestar.ConvocatoriaGestionAlojamiento to 'estudiante'@'localhost';

grant select,update on bienestar.vw_info_estudiante to 'estudiante'@'localhost';
grant select,insert on bienestar.vw_info_convocatoria_estudiante to 'estudiante'@'localhost';
grant select on bienestar.vw_info_factura to 'estudiante'@'localhost';

#---------------

grant select,update on bienestar.persona to 'no_estudiante'@'localhost';

grant select on bienestar.Area to 'no_estudiante'@'localhost';
grant select on bienestar.Programa to 'no_estudiante'@'localhost';
grant select on bienestar.Programa_tiene_EventoTaller to 'no_estudiante'@'localhost';
grant select on bienestar.EventoTaller to 'no_estudiante'@'localhost';
grant select on bienestar.Programa_tiene_proyecto to 'no_estudiante'@'localhost';
grant select on bienestar.Proyecto to 'no_estudiante'@'localhost';
grant select on bienestar.Convocatoria to 'no_estudiante'@'localhost';
grant select on bienestar.TiendaBienestar to 'no_estudiante'@'localhost';
grant select on bienestar.empleado_tiendaUN to 'no_estudiante'@'localhost';
grant select on bienestar.Producto to 'no_estudiante'@'localhost';
grant select on bienestar.producto_tiendaUN to 'no_estudiante'@'localhost';
grant select on bienestar.Factura to 'no_estudiante'@'localhost';
grant select on bienestar.factura_producto to 'no_estudiante'@'localhost';

grant select on bienestar.vw_info_factura to 'no_estudiante'@'localhost';

#---------------

grant select, insert, update on bienestar.Persona to 'secretaria'@'localhost';
grant select, insert, update on bienestar.persona_cargo to 'secretaria'@'localhost';
grant select, insert, update on bienestar.Cargo to 'secretaria'@'localhost';
grant select, insert, update on bienestar.Estudiante to 'secretaria'@'localhost';
grant select, insert, update on bienestar.Carrera to 'secretaria'@'localhost';

grant select on bienestar.Area to 'secretaria'@'localhost';
grant select on bienestar.Programa to 'secretaria'@'localhost';

grant select, insert, update on bienestar.Programa_tiene_EventoTaller to 'secretaria'@'localhost';
grant select, insert, update on bienestar.EventoTaller to 'secretaria'@'localhost';
grant select, insert, update on bienestar.Programa_tiene_proyecto to 'secretaria'@'localhost';

grant select on bienestar.Proyecto to 'secretaria'@'localhost';

grant select, update on bienestar.Convocatoria to 'secretaria'@'localhost';

grant all on bienestar.Estudiante_toma_convocatoria to 'secretaria'@'localhost';

grant select, update on bienestar.TiendaBienestar to 'secretaria'@'localhost';
grant select, insert, update on bienestar.empleado_tiendaUN to 'secretaria'@'localhost';
grant select, update on bienestar.Producto to 'secretaria'@'localhost';

grant select, insert, update on bienestar.producto_tiendaUN to 'secretaria'@'localhost';
grant select, insert, update on bienestar.Factura to 'secretaria'@'localhost';
grant select, insert, update on bienestar.factura_producto to 'secretaria'@'localhost';

grant select, insert on bienestar.FallaAlimentacion to 'secretaria'@'localhost';
grant select, insert on bienestar.ActividadCorresp to 'secretaria'@'localhost';
grant select, insert, update on bienestar.Corresponsabilidad to 'secretaria'@'localhost';
grant select, update on bienestar.ConvocatoriaGestionAlimentaria to 'secretaria'@'localhost';
grant select, update on bienestar.ConvocatoriaGestionTransporte to 'secretaria'@'localhost';
grant select, update on bienestar.ConvocatoriaGestionEconomica to 'secretaria'@'localhost';
grant select, update on bienestar.ConvocatoriaFomentoEmprendimeinto to 'secretaria'@'localhost';
grant select, update on bienestar.ConvocatoriaGestionAlojamiento to 'secretaria'@'localhost';

grant select, insert, update on bienestar.vw_info_estudiante to 'secretaria'@'localhost';
grant select, update on bienestar.vw_info_convocatoria_estudiante to 'secretaria'@'localhost';
grant select, insert, update on bienestar.vw_info_factura to 'secretaria'@'localhost';

#-----------------

grant all on bienestar.Persona to 'direccion_economica'@'localhost';
grant all on bienestar.persona_cargo to 'direccion_economica'@'localhost';
grant all on bienestar.Cargo to 'direccion_economica'@'localhost';
grant all on bienestar.Estudiante to 'direccion_economica'@'localhost';
grant all on bienestar.Carrera to 'direccion_economica'@'localhost';
grant all on bienestar.Area to 'direccion_economica'@'localhost';
grant all on bienestar.Programa to 'direccion_economica'@'localhost';
grant all on bienestar.Programa_tiene_EventoTaller to 'direccion_economica'@'localhost';
grant all on bienestar.EventoTaller to 'direccion_economica'@'localhost';
grant all on bienestar.Programa_tiene_proyecto to 'direccion_economica'@'localhost';
grant all on bienestar.Proyecto to 'direccion_economica'@'localhost';
grant all on bienestar.Convocatoria to 'direccion_economica'@'localhost';
grant all on bienestar.Estudiante_toma_convocatoria to 'direccion_economica'@'localhost';
grant all on bienestar.TiendaBienestar to 'direccion_economica'@'localhost';
grant all on bienestar.empleado_tiendaUN to 'direccion_economica'@'localhost';
grant all on bienestar.Producto to 'direccion_economica'@'localhost';
grant all on bienestar.producto_tiendaUN to 'direccion_economica'@'localhost';
grant all on bienestar.Factura to 'direccion_economica'@'localhost';
grant all on bienestar.factura_producto to 'direccion_economica'@'localhost';

grant select, insert, update on bienestar.FallaAlimentacion to 'direccion_economica'@'localhost';
grant select, insert, update on bienestar.ActividadCorresp to 'direccion_economica'@'localhost';
grant select, insert, update on bienestar.Corresponsabilidad to 'direccion_economica'@'localhost';
grant all on bienestar.ConvocatoriaGestionAlimentaria to 'direccion_economica'@'localhost';
grant all on bienestar.ConvocatoriaGestionTransporte to 'direccion_economica'@'localhost';
grant all on bienestar.ConvocatoriaGestionEconomica to 'direccion_economica'@'localhost';
grant all on bienestar.ConvocatoriaFomentoEmprendimeinto to 'direccion_economica'@'localhost';
grant all on bienestar.ConvocatoriaGestionAlojamiento to 'direccion_economica'@'localhost';

grant all on bienestar.vw_info_estudiante to 'direccion_economica'@'localhost';
grant all on bienestar.vw_info_convocatoria_estudiante to 'direccion_economica'@'localhost';
grant all on bienestar.vw_info_factura to 'direccion_economica'@'localhost';

#--------------------------------------------------------------------

#-------------------------------------------------------------------
#Valeria
#--------------------------------------------------------------------

grant all on bienestar.Persona to 'direccion_salud'@'localhost';
grant all on bienestar.persona_cargo to 'direccion_salud'@'localhost';
grant all on bienestar.Cargo to 'direccion_salud'@'localhost';
grant all on bienestar.Estudiante to 'direccion_salud'@'localhost';
grant all on bienestar.Carrera to 'direccion_salud'@'localhost';
grant all on bienestar.Area to 'direccion_salud'@'localhost';
grant all on bienestar.Programa to 'direccion_salud'@'localhost';
grant all on bienestar.Programa_tiene_EventoTaller to 'direccion_salud'@'localhost';
grant all on bienestar.EventoTaller to 'direccion_salud'@'localhost';
grant all on bienestar.Programa_tiene_proyecto to 'direccion_salud'@'localhost';
grant all on bienestar.Proyecto to 'direccion_salud'@'localhost';
grant all on bienestar.Convocatoria to 'direccion_salud'@'localhost';
grant all on bienestar.Estudiante_toma_convocatoria to 'direccion_salud'@'localhost';

grant all on bienestar.vw_info_estudiante to 'direccion_salud'@'localhost';
grant all on bienestar.vw_info_convocatoria_estudiante to 'direccion_salud'@'localhost';

#--------------------------------------------------------------------


#-------------------------------------------------------------------
#Carlos
#--------------------------------------------------------------------

grant all on bienestar.Persona to 'direccion_deporte'@'localhost';
grant all on bienestar.persona_cargo to 'direccion_deporte'@'localhost';
grant all on bienestar.Cargo to 'direccion_deporte'@'localhost';
grant all on bienestar.Estudiante to 'direccion_deporte'@'localhost';
grant all on bienestar.Carrera to 'direccion_deporte'@'localhost';
grant all on bienestar.Area to 'direccion_deporte'@'localhost';
grant all on bienestar.Programa to 'direccion_deporte'@'localhost';
grant all on bienestar.Programa_tiene_EventoTaller to 'direccion_deporte'@'localhost';
grant all on bienestar.EventoTaller to 'direccion_deporte'@'localhost';
grant all on bienestar.Programa_tiene_proyecto to 'direccion_deporte'@'localhost';
grant all on bienestar.Proyecto to 'direccion_deporte'@'localhost';
grant all on bienestar.Convocatoria to 'direccion_deporte'@'localhost';
grant all on bienestar.Estudiante_toma_convocatoria to 'direccion_deporte'@'localhost';

grant all on bienestar.vw_info_estudiante to 'direccion_deporte'@'localhost';
grant all on bienestar.vw_info_convocatoria_estudiante to 'direccion_deporte'@'localhost';

grant all on bienestar.Persona to 'direccion_cultural'@'localhost';
grant all on bienestar.persona_cargo to 'direccion_cultural'@'localhost';
grant all on bienestar.Cargo to 'direccion_cultural'@'localhost';
grant all on bienestar.Estudiante to 'direccion_cultural'@'localhost';
grant all on bienestar.Carrera to 'direccion_cultural'@'localhost';
grant all on bienestar.Area to 'direccion_cultural'@'localhost';
grant all on bienestar.Programa to 'direccion_cultural'@'localhost';
grant all on bienestar.Programa_tiene_EventoTaller to 'direccion_cultural'@'localhost';
grant all on bienestar.EventoTaller to 'direccion_cultural'@'localhost';
grant all on bienestar.Programa_tiene_proyecto to 'direccion_cultural'@'localhost';
grant all on bienestar.Proyecto to 'direccion_cultural'@'localhost';
grant all on bienestar.Convocatoria to 'direccion_cultural'@'localhost';
grant all on bienestar.Estudiante_toma_convocatoria to 'direccion_cultural'@'localhost';

grant all on bienestar.vw_info_estudiante to 'direccion_cultural'@'localhost';
grant all on bienestar.vw_info_convocatoria_estudiante to 'direccion_cultural'@'localhost';

#--------------------------------------------------------------------

FLUSH PRIVILEGES;

show grants for 'estudiante'@'localhost';
show grants for 'no_estudiante'@'localhost';
show grants for 'secretaria'@'localhost';
show grants for 'direccion_economica'@'localhost';
show grants for 'direccion_salud'@'localhost';
show grants for 'direccion_deporte'@'localhost';
show grants for 'direccion_cultural'@'localhost';