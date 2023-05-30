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


