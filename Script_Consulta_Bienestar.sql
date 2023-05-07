select * from persona;
select * from estudiante;
select * from carrera;
select * from area;
select * from programa;
select * from tiendabienestar;
select * from producto;
select * from factura;
select * from factura_producto;
select * from fallaalimentacion;
select * from actividadcorresp;
select * from convocatoria;
select * from convocatoriagestionalimentaria;
select * from convocatoriagestionalojamiento;
select * from convocatoriagestioneconomica;


#Javier
#----------------------------------------------------------------------

#1

select * from convocatoriagestioneconomica join convocatoria using(conv_id) join estudiante_toma_convocatoria using (conv_id);
select * from convocatoriagestioneconomica join convocatoria using(conv_id) join estudiante_toma_convocatoria using (conv_id) join estudiante on (idEst = estID);

select COUNT(idEst),sum(cgeCobertura),AVG(cgeCobertura) from convocatoriagestioneconomica join convocatoria using(conv_id) join estudiante_toma_convocatoria using (conv_id);

select COUNT(idEst),sum(cgeCobertura),AVG(cgeCobertura),estFacultad from convocatoriagestioneconomica join convocatoria using(conv_id) join estudiante_toma_convocatoria using (conv_id) join estudiante on (idEst = estID) group by estFacultad;

#2
select * from factura join factura_producto using (factID) join producto using (prodID);

select count(prodID) as conteo,prodDetalle,sum(prodPrecio) as precio from factura join factura_producto using (factID) join producto using (prodID) where factFecha>'2023-02-15' and factFecha<'2023-05-15' group by prodDetalle having conteo>=2 order by precio desc;

#3

select * from fallaalimentacion join estudiante using (estID) join persona on (estID=perID);
select count(estID),perNombre,perApellido from fallaalimentacion join estudiante using (estID) join persona on (estID=perID) group by estID;
select count(estID),perNombre,perApellido from fallaalimentacion join estudiante using (estID) join persona on (estID=perID) group by estID having count(estID)>=4;

#----------------------------------------------------------------------
#----------------------------------------------------------------------