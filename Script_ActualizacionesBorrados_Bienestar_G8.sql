-- Acompañamiento Integral --
update convocatoriapromotorconvivencia set pcEstimuloEconomico=750000 where pcHorasRequeridas = 8;

update asesoria set asLugar="Salón 105" where asLugar="Salón 305";

update grupoproyectoestudiantil set gpNombre="Hystoria" where gpID=3;

delete from participacionactividadai where ActividadID=5;
delete from actividadai where actNombre like "%Cultivando%";

delete from asesoria where asTipo="Escuela de Padres";

#--------------------------------------------------------------
#                Santiago
#--------------------------------------------------------------
update grupoartisticoinstitucional set gaiNombre="Danza folclórica" where gaiNombre = "Danzas Folclóricas";

delete from grupoartisticoinstitucional where gaiNombre="Danza folclórica";
delete from convocatoria where conv_id = 778;