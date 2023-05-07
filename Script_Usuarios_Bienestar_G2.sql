drop role if exists 'estudiante','no_estudiante','secretaria','direccion_economica','direccion_salud','direccion_deporte','direccion_cultural';
CREATE ROLE 'estudiante','no_estudiante','secretaria','direccion_economica','direccion_salud','direccion_deporte','direccion_cultural';


# -----------------------------------------------------------------------------
#							Javier
# -----------------------------------------------------------------------------

grant update on persona to 'estudiante';
grant update on estudiante to 'estudiante';

grant select on Carrera to 'estudiante';
grant select on Area to 'estudiante';
grant select on Programa to 'estudiante';
grant select on Programa_tiene_EventoTaller to 'estudiante';
grant select on EventoTaller to 'estudiante';
grant select on Programa_tiene_proyecto to 'estudiante';
grant select on Proyecto to 'estudiante';
grant select on Convocatoria to 'estudiante';
grant select on Estudiante_toma_convocatoria to 'estudiante';
grant select on TiendaBienestar to 'estudiante';
grant select on empleado_tiendaUN to 'estudiante';
grant select on Producto to 'estudiante';
grant select on producto_tiendaUN to 'estudiante';
grant select on Factura to 'estudiante';
grant select on factura_producto to 'estudiante';
grant select on FallaAlimentacion to 'estudiante';
grant select on ActividadCorresp to 'estudiante';
grant select on Corresponsabilidad to 'estudiante';

grant select,insert on ConvocatoriaGestionAlimentaria to 'estudiante';
grant select,insert on ConvocatoriaGestionTransporte to 'estudiante';
grant select,insert on ConvocatoriaGestionEconomica to 'estudiante';
grant select,insert on ConvocatoriaFomentoEmprendimeinto to 'estudiante';
grant select,insert on ConvocatoriaGestionAlojamiento to 'estudiante';

grant select,update on vw_info_estudiante to 'estudiante';
grant select,insert on vw_info_convocatoria_estudiante to 'estudiante';
grant select on vw_info_factura to 'estudiante';

#---------------

grant update on persona to 'no_estudiante';

grant select on Area to 'no_estudiante';
grant select on Programa to 'no_estudiante';
grant select on Programa_tiene_EventoTaller to 'no_estudiante';
grant select on EventoTaller to 'no_estudiante';
grant select on Programa_tiene_proyecto to 'no_estudiante';
grant select on Proyecto to 'no_estudiante';
grant select on Convocatoria to 'no_estudiante';
grant select on TiendaBienestar to 'no_estudiante';
grant select on empleado_tiendaUN to 'no_estudiante';
grant select on Producto to 'no_estudiante';
grant select on producto_tiendaUN to 'no_estudiante';
grant select on Factura to 'no_estudiante';
grant select on factura_producto to 'no_estudiante';

grant select on vw_info_factura to 'no_estudiante';

#---------------

grant select, insert, update on Persona to 'secretaria';
grant select, insert, update on persona_cargo to 'secretaria';
grant select, insert, update on Cargo to 'secretaria';
grant select, insert, update on Estudiante to 'secretaria';
grant select, insert, update on Carrera to 'secretaria';

grant select on Area to 'secretaria';
grant select on Programa to 'secretaria';

grant select, insert, update on Programa_tiene_EventoTaller to 'secretaria';
grant select, insert, update on EventoTaller to 'secretaria';
grant select, insert, update on Programa_tiene_proyecto to 'secretaria';

grant select on Proyecto to 'secretaria';

grant select, update on Convocatoria to 'secretaria';

grant all on Estudiante_toma_convocatoria to 'secretaria';

grant select, update on TiendaBienestar to 'secretaria';
grant select, insert, update on empleado_tiendaUN to 'secretaria';
grant select, update on Producto to 'secretaria';

grant select, insert, update on producto_tiendaUN to 'secretaria';
grant select, insert, update on Factura to 'secretaria';
grant select, insert, update on factura_producto to 'secretaria';

grant select, insert on FallaAlimentacion to 'secretaria';
grant select, insert on ActividadCorresp to 'secretaria';
grant select, insert, update on Corresponsabilidad to 'secretaria';
grant select, update on ConvocatoriaGestionAlimentaria to 'secretaria';
grant select, update on ConvocatoriaGestionTransporte to 'secretaria';
grant select, update on ConvocatoriaGestionEconomica to 'secretaria';
grant select, update on ConvocatoriaFomentoEmprendimeinto to 'secretaria';
grant select, update on ConvocatoriaGestionAlojamiento to 'secretaria';

grant select, insert, update on vw_info_estudiante to 'secretaria';
grant select, update on vw_info_convocatoria_estudiante to 'secretaria';
grant select, insert, update on vw_info_factura to 'secretaria';

#-----------------

grant all on Persona to 'direccion_economica';
grant all on persona_cargo to 'direccion_economica';
grant all on Cargo to 'direccion_economica';
grant all on Estudiante to 'direccion_economica';
grant all on Carrera to 'direccion_economica';
grant all on Area to 'direccion_economica';
grant all on Programa to 'direccion_economica';
grant all on Programa_tiene_EventoTaller to 'direccion_economica';
grant all on EventoTaller to 'direccion_economica';
grant all on Programa_tiene_proyecto to 'direccion_economica';
grant all on Proyecto to 'direccion_economica';
grant all on Convocatoria to 'direccion_economica';
grant all on Estudiante_toma_convocatoria to 'direccion_economica';
grant all on TiendaBienestar to 'direccion_economica';
grant all on empleado_tiendaUN to 'direccion_economica';
grant all on Producto to 'direccion_economica';
grant all on producto_tiendaUN to 'direccion_economica';
grant all on Factura to 'direccion_economica';
grant all on factura_producto to 'direccion_economica';

grant select, insert, update on FallaAlimentacion to 'direccion_economica';
grant select, insert, update on ActividadCorresp to 'direccion_economica';
grant select, insert, update on Corresponsabilidad to 'direccion_economica';
grant all on ConvocatoriaGestionAlimentaria to 'direccion_economica';
grant all on ConvocatoriaGestionTransporte to 'direccion_economica';
grant all on ConvocatoriaGestionEconomica to 'direccion_economica';
grant all on ConvocatoriaFomentoEmprendimeinto to 'direccion_economica';
grant all on ConvocatoriaGestionAlojamiento to 'direccion_economica';

grant all on vw_info_estudiante to 'direccion_economica';
grant all on vw_info_convocatoria_estudiante to 'direccion_economica';
grant all on vw_info_factura to 'direccion_economica';

# -----------------------------------------------------------------------------
#								Valeria
# -----------------------------------------------------------------------------

GRANT SELECT, UPDATE ON perfilriesgointegral TO 'estudiante';
GRANT SELECT ON historiaclinica TO 'estudiante';
GRANT SELECT ON personalsalud TO 'estudiante';
GRANT SELECT ON ordenmedica TO 'estudiante';
GRANT SELECT ON medicamentos TO 'estudiante';
GRANT SELECT, UPDATE ON citamedica TO 'estudiante';

GRANT SELECT, UPDATE ON vw_citamedica_disponible TO 'estudiante';
GRANT SELECT ON vw_doctor_procedimiento TO 'estudiante';
# -----------------------------------------------------------------------------

GRANT SELECT, UPDATE ON perfilriesgointegral TO 'no_estudiante';
GRANT SELECT ON historiaclinica TO 'no_estudiante';
GRANT SELECT ON personalsalud TO 'no_estudiante';
GRANT SELECT ON ordenmedica TO 'no_estudiante';
GRANT SELECT ON medicamentos TO 'no_estudiante';
GRANT SELECT, UPDATE ON citamedica TO 'no_estudiante';

GRANT SELECT, UPDATE ON vw_citamedica_disponible TO 'no_estudiante';
GRANT SELECT ON vw_doctor_procedimiento TO 'no_estudiante';
# -----------------------------------------------------------------------------

GRANT SELECT, UPDATE ON discapacidad TO 'secretaria';
GRANT SELECT, UPDATE ON incapacidad TO 'secretaria';
GRANT SELECT, UPDATE ON atencionensalud TO 'secretaria';
GRANT SELECT, UPDATE ON perfilriesgointegral TO 'secretaria';
GRANT SELECT, INSERT, UPDATE ON historiaclinica TO 'secretaria';
GRANT ALL ON enfermedad TO 'secretaria';
GRANT SELECT, UPDATE ON personalsalud TO 'secretaria';
GRANT ALL ON citamedica TO 'secretaria';
GRANT SELECT, INSERT, UPDATE ON ordenmedica TO 'secretaria';
GRANT SELECT, INSERT, UPDATE ON medicamentos TO 'secretaria';
GRANT SELECT, INSERT, UPDATE ON evaluacionfisica TO 'secretaria';
GRANT SELECT, INSERT, UPDATE ON urgencia TO 'secretaria';
GRANT SELECT, UPDATE ON ambulancia TO 'secretaria';

GRANT ALL ON vw_citamedica_disponible TO 'secretaria';
GRANT SELECT ON vw_medicamentos_solicitados TO 'secretaria';
GRANT SELECT, UPDATE ON vw_doctor_procedimiento TO 'secretaria';

# -----------------------------------------------------------------------------

grant all on Persona to 'direccion_salud';
grant all on persona_cargo to 'direccion_salud';
grant all on Cargo to 'direccion_salud';
grant all on Estudiante to 'direccion_salud';
grant all on Carrera to 'direccion_salud';
grant all on Area to 'direccion_salud';
grant all on Programa to 'direccion_salud';
grant all on Programa_tiene_EventoTaller to 'direccion_salud';
grant all on EventoTaller to 'direccion_salud';
grant all on Programa_tiene_proyecto to 'direccion_salud';
grant all on Proyecto to 'direccion_salud';
grant all on Convocatoria to 'direccion_salud';
grant all on Estudiante_toma_convocatoria to 'direccion_salud';

GRANT ALL ON Discapacidad TO 'direccion_salud';
GRANT ALL ON Incapacidad TO 'direccion_salud';
GRANT ALL ON AtencionEnSalud TO 'direccion_salud';
GRANT ALL ON PerfilRiesgoIntegral TO 'direccion_salud';
GRANT ALL ON HistoriaClinica TO 'direccion_salud';
GRANT ALL ON Enfermedad TO 'direccion_salud';
GRANT ALL ON PersonalSalud TO 'direccion_salud';
GRANT ALL ON CitaMedica TO 'direccion_salud';
GRANT ALL ON OrdenMedica TO 'direccion_salud';
GRANT ALL ON Medicamentos TO 'direccion_salud';
GRANT ALL ON EvaluacionFisica TO 'direccion_salud';
GRANT ALL ON Urgencia TO 'direccion_salud';
GRANT ALL ON Ambulancia TO 'direccion_salud';

GRANT ALL ON vw_citamedica_disponible TO 'direccion_salud';
GRANT ALL ON vw_medicamentos_solicitados TO 'direccion_salud';
GRANT ALL ON vw_doctor_procedimiento TO 'direccion_salud';

# -----------------------------------------------------------------------------
#							Carlos
# -----------------------------------------------------------------------------

grant all on Persona to 'direccion_deporte';
grant all on persona_cargo to 'direccion_deporte';
grant all on Cargo to 'direccion_deporte';
grant all on Estudiante to 'direccion_deporte';
grant all on Carrera to 'direccion_deporte';
grant all on Area to 'direccion_deporte';
grant all on Programa to 'direccion_deporte';
grant all on Programa_tiene_EventoTaller to 'direccion_deporte';
grant all on EventoTaller to 'direccion_deporte';
grant all on Programa_tiene_proyecto to 'direccion_deporte';
grant all on Proyecto to 'direccion_deporte';
grant all on Convocatoria to 'direccion_deporte';
grant all on Estudiante_toma_convocatoria to 'direccion_deporte';

grant all on Persona to 'direccion_cultural';
grant all on persona_cargo to 'direccion_cultural';
grant all on Cargo to 'direccion_cultural';
grant all on Estudiante to 'direccion_cultural';
grant all on Carrera to 'direccion_cultural';
grant all on Area to 'direccion_cultural';
grant all on Programa to 'direccion_cultural';
grant all on Programa_tiene_EventoTaller to 'direccion_cultural';
grant all on EventoTaller to 'direccion_cultural';
grant all on Programa_tiene_proyecto to 'direccion_cultural';
grant all on Proyecto to 'direccion_cultural';
grant all on Convocatoria to 'direccion_cultural';
grant all on Estudiante_toma_convocatoria to 'direccion_cultural';

#--------------------------------------------------------------------