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


#Javier
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


#Carlos
#----------------------------------------------------------------------

#5

-- 5. Consultar la cantidad de estudiantes que se presentan a convocatorias de selecciones deportivas agrupados por deporte.
select count(idEst) from Estudiante_Toma_Convocatoria join (Convocatoria join ConvocatoriaSeleccion on (conv_id = Convocatoria_conv_id)) using (conv_id) group by idEst;

-- 6. Consultar el promedio de horas de corresponsabilidad cumplidas por estudiantes que participaron en convocatorias de gestión alimentaria.
select avg(horPendCorresp) from (Corresponsabilidad join (Estudiante_Toma_Convocatoria join (Convocatoria join ConvocatoriaGestionAlimentaria  using (conv_id)) using (conv_id)) using(idEst));

-- 7. Consultar la cantidad de estudiantes con fallas alimentarias que participaron en convocatorias a selecciones deportivas de fútbol o fútbol sala.
select count(idEst) from (FallaAlimentacion join (Estudiante_Toma_Convocatoria join (Convocatoria join ConvocatoriaSeleccion on (conv_id = Convocatoria_conv_id)) using (conv_id)) on (estID = idEst)) where convDeporte = "futbol" or convDeporte = "fubol sala" group by convDeporte ;

-- where convDeporte = 'Futbol


#----------------------------------------------------------------------