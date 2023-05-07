select * from persona;
select * from estudiante;
select * from carrera;
select * from area;
select * from programa;
select * from fallaalimentacion;
select * from actividadcorresp;
select * from convocatoria;
select * from convocatoriagestionalimentaria;
select * from convocatoriagestionalojamiento;
select * from convocatoriagestioneconomica;
select * from tiendabienestar;
select * from factura;
select * from producto;
select * from factura_producto;
select * from convocatoria;

#----------------------------------------------------------------------
#                                  Javier
#----------------------------------------------------------------------

#1
select COUNT(idEst),sum(cgeCobertura),AVG(cgeCobertura) from convocatoriagestioneconomica join convocatoria using(conv_id) join estudiante_toma_convocatoria using (conv_id);

select COUNT(idEst),sum(cgeCobertura),AVG(cgeCobertura),estFacultad from convocatoriagestioneconomica join convocatoria using(conv_id) join estudiante_toma_convocatoria using (conv_id) join estudiante on (idEst = estID) group by estFacultad;

#2

select count(prodID) as conteo,prodDetalle,sum(prodPrecio) as precio from factura join factura_producto using (factID) join producto using (prodID) where factFecha>'2023-02-15' and factFecha<'2023-05-15' group by prodDetalle having conteo>=2 order by precio desc;

select sum(precio) from (select count(prodID) as conteo,prodDetalle,sum(prodPrecio) as precio from factura join factura_producto using (factID) join producto using (prodID) where factFecha>'2023-02-15' and factFecha<'2023-05-15' group by prodDetalle having conteo>=2 order by precio desc) as tbNew;

#3

select count(estID),perNombre,perApellido from fallaalimentacion join estudiante using (estID) join persona on (estID=perID) group by estID having count(estID)>=4;

select count(fallAlID) as conteo,fallAlLugar from fallaalimentacion group by fallAlLugar order by count(fallAlID) desc;

#4

select count(conv_id),AVG(cgalCobertura),avg(cgalCosto),cgalLocalidadAlojamiento from convocatoriagestionalojamiento where cgalLocalidadAlojamiento in ('Ciudad Bolívar', 'Bosa', 'Kenedy', 'Tunjuelito', 'Antonio Nariño', 'Rafael Uribe Uribe', 'San Cristóbal', 'Usme', 'Puente Aranda', 'Los Mártires') group by cgalLocalidadAlojamiento;

#----------------------------------------------------------------------
#                                  Valeria
#----------------------------------------------------------------------

# 5. Consultar cuales fueron los incapacidades dadas durante la pandemia, cuantas ser dieron por cada una y la duración promedio de cada una.
SELECT incEnfermedad AS tipo_incapacidad, COUNT(incEnfermedad) AS cantidad, SUM(incDias) AS promedio_dias 
FROM incapacidad WHERE '2019-12-30' < incFecha AND incFecha > '2021-12-30' GROUP BY incEnfermedad ORDER BY promedio_dias DESC;

# 6. Consultar cual es la enfermedad más común y para dicha enfermedad ver cuales son las citas médicas más solicitadas.
SELECT enfNombre AS enfermedad, COUNT(enfNombre) AS cantidad FROM enfermedad GROUP BY enfNombre ORDER BY cantidad DESC LIMIT 1;

SELECT citEspecialidad AS tipo_cita, COUNT(citEspecialidad) AS cantidad_citas
FROM citamedica JOIN 
(SELECT perID FROM historiaclinica JOIN enfermedad ON perID=HistoriaClinicaID JOIN (
SELECT COUNT(enfNombre) AS cantidad, enfNombre FROM enfermedad GROUP BY enfNombre ORDER BY cantidad DESC LIMIT 1) 
AS max_enfermedad ON max_enfermedad.enfNombre = enfermedad.enfNombre) 
AS enfermos ON pacienteID=perID
GROUP BY (citEspecialidad);

# 7. Para las personas con alguna discapacidad ver cuantos días de incapacidad han tenido y la cantidad de citas que han requerido, eso agrupado por el tipo de incapacidad.
SELECT disNombre AS discapacidad, SUM(incDias) AS numero_dias_incapacitado, COUNT(idCitaMedica) AS cantidad_citas_medicas
FROM discapacidad NATURAL JOIN incapacidad JOIN citamedica ON pacienteID=perID GROUP BY (disNombre);




