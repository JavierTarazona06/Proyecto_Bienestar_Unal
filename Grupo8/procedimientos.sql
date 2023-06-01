#Se crea un procedimento para cambiar el estado de las convocatorias que ya caducaron
Drop procedure if exists actualizarEstadoConvocatoria;
DELIMITER //
CREATE PROCEDURE actualizarEstadoConvocatoria()
BEGIN
    DECLARE fecha_actual DATE;
    -- Obtener la fecha actual
    SET fecha_actual = CURDATE();
    UPDATE convocatoria
    SET convEstado = 0
    WHERE convFechaCierre < fecha_actual;
END //
DELIMITER ;

#El siguiente proceso elimina el programa de Grupo Artistico institucional y todas las convocatorias relacionadas.
#Este proceso puede ser util para hacer modificaciones a todo el programa sin perder la información de los grupos artisticos
Drop procedure if exists eliminarProgramaGAI;
DELIMITER //
CREATE PROCEDURE eliminarProgramaGAI(
    IN programaID INT
)
BEGIN
    DECLARE IDConvocatoria int;
    SELECT conv_id into IDConvocatoria from convocatoria where programaID = Programa_progID ;
    DELETE FROM convocatoriagai where IDConvocatoria = Convocatoria_conv_id;
    DELETE FROM grupoartisticoinstitucional where programaID = progID;
    DELETE FROM convocatoria WHERE programaID = Programa_progID;
    DELETE FROM programa WHERE programaID = progID;
    
END //
DELIMITER ;

#El siguiente procedimiento muestra la convocatoria que se repete más veces, lo cual puede ser interesante para un estudiante que busca entrar a un programa de manera más segura
drop procedure if exists contarElementos;
DELIMITER //
CREATE PROCEDURE contarElementos()
BEGIN
    DECLARE max_elemento VARCHAR(255);
    DECLARE max_cantidad INT;
    DROP TABLE if exists tmp_elementos;
    CREATE TEMPORARY TABLE tmp_elementos (
        convocatoria VARCHAR(255),
        cantidad INT
    );
    
    INSERT INTO tmp_elementos
    SELECT convNombre, COUNT(*) AS cantidad
    FROM convocatoria
    GROUP BY convNombre;
    
    SELECT convocatoria, cantidad INTO max_elemento, max_cantidad
    FROM tmp_elementos
    ORDER BY cantidad DESC
    LIMIT 1;
    
    SELECT max_elemento, max_cantidad;
END //

DELIMITER ;

#La siguiente función retorna el número de participantes de alguna actividad
DELIMITER $$

CREATE FUNCTION fc_cantParticipantes(actID INT)  RETURNS INT READS SQL DATA DETERMINISTIC
BEGIN
	DECLARE participantes INT;
	SET participantes = (SELECT COUNT(EstudianteID) FROM ParticipacionActividadAI WHERE ActividadID = actID);
	
    RETURN participantes;
END $$

DELIMITER ;

#El siguiente procedimiento retorna las actividades que se realizaron (o realizarán) en un intervalo de fechas
DELIMITER $$
CREATE PROCEDURE pa_fecharangoActAI(fecha_min DATETIME, fecha_max DATETIME)
BEGIN
	SELECT * FROM actividadai where actFecha >= fecha_min AND actFecha <= fecha_max;
END $$
DELIMITER ;


#El siguiente procedimiento retorna las asesorías que se realizaron en un intervalo de fechas
DELIMITER $$
CREATE PROCEDURE pa_fecharangoAsesoria(fecha_min DATETIME, fecha_max DATETIME)
BEGIN
	SELECT * FROM asesoria where asFecha >= fecha_min AND asFecha <= fecha_max;
END $$
DELIMITER ;




