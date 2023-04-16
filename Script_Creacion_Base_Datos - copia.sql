-- -----------------------------------------------------
DROP SCHEMA IF EXISTS bienestar ;
-- -----------------------------------------------------
-- -----------------------------------------------------
CREATE SCHEMA bienestar DEFAULT CHARACTER SET utf8 ;
USE bienestar ;

-- -----------------------------------------------------
-- Table bienestar.`RecGeneralBienUniv`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`RecGeneralBienUniv` ;

CREATE TABLE IF NOT EXISTS bienestar.`RecGeneralBienUniv` (
  `docID` INT NOT NULL,
  `recGenBienPeriodo` INT NOT NULL,
  PRIMARY KEY (`docID`),
  CONSTRAINT `fk_Decano_Docente1000`
    FOREIGN KEY (`docID`)
    REFERENCES bienestar.`Docente` (`docID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Decano_Docente1_idx` ON bienestar.`RecGeneralBienUniv` (`docID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Vicerrector`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Vicerrector` ;

CREATE TABLE IF NOT EXISTS bienestar.`Vicerrector` (
  `docID` INT NOT NULL,
  `VicerrectorPeriodo` INT NOT NULL,
  `recGenID` INT NOT NULL,
  PRIMARY KEY (`docID`),
  CONSTRAINT `fk_Decano_Docente100`
    FOREIGN KEY (`docID`)
    REFERENCES bienestar.`Docente` (`docID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vicerrector_RecGeneralBienUniv1`
    FOREIGN KEY (`recGenID`)
    REFERENCES bienestar.`RecGeneralBienUniv` (`docID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Decano_Docente1_idx` ON bienestar.`Vicerrector` (`docID` ASC) VISIBLE;

CREATE INDEX `fk_Vicerrector_RecGeneralBienUniv1_idx` ON bienestar.`Vicerrector` (`recGenID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`ComitNacDirectores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`ComitNacDirectores` ;

CREATE TABLE IF NOT EXISTS bienestar.`ComitNacDirectores` (
  `comiNacDirectoresID` INT NOT NULL,
  `conBienAnoCreacion` INT NOT NULL,
  PRIMARY KEY (`comiNacDirectoresID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`Directorbienestar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Directorbienestar` ;

CREATE TABLE IF NOT EXISTS bienestar.`Directorbienestar` (
  `docID` INT NOT NULL,
  `dirbienestarAnoInicio` INT NOT NULL,
  `dirbienestarNivel` ENUM("SEDE", "FACULTAD", "NACIONAL") NOT NULL,
  `comitNacDirectoresID` INT NOT NULL,
  `comitSedeDirectoresID` INT NOT NULL,
  PRIMARY KEY (`docID`),
  CONSTRAINT `fk_Directorbienestar_Docente1`
    FOREIGN KEY (`docID`)
    REFERENCES bienestar.`Docente` (`docID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Directorbienestar_ComitNacDirectores1`
    FOREIGN KEY (`comitNacDirectoresID`)
    REFERENCES bienestar.`ComitNacDirectores` (`comiNacDirectoresID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Directorbienestar_ComitSedeDirectores1`
    FOREIGN KEY (`comitSedeDirectoresID`)
    REFERENCES bienestar.`ComitSedeDirectores` (`comitSedeDirectoresID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Directorbienestar_Docente1_idx` ON bienestar.`Directorbienestar` (`docID` ASC) VISIBLE;

CREATE INDEX `fk_Directorbienestar_ComitNacDirectores1_idx` ON bienestar.`Directorbienestar` (`comitNacDirectoresID` ASC) VISIBLE;

CREATE INDEX `fk_Directorbienestar_ComitSedeDirectores1_idx` ON bienestar.`Directorbienestar` (`comitSedeDirectoresID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Estudiante` ;

CREATE TABLE IF NOT EXISTS bienestar.`Estudiante` (
  `estID` INT NOT NULL,
  `estCarrera` VARCHAR(45) NOT NULL,
  `estFacultad` VARCHAR(45) NOT NULL,
  `estPBM` TINYINT NOT NULL,
  `estTipoAdmision` VARCHAR(20) NOT NULL,
  `estEsEgresado` TINYINT NOT NULL,
  `estAnoGraduacion` INT NULL,
  `repEstudFacuID` INT NOT NULL,
  `reprEstudSedeID` INT NOT NULL,
  PRIMARY KEY (`estID`),
  CONSTRAINT `fk_Estudiante_Persona1`
    FOREIGN KEY (`estID`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`RepEmpFacultad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`RepEmpFacultad` ;

CREATE TABLE IF NOT EXISTS bienestar.`RepEmpFacultad` (
  `repEmpFacID` INT NOT NULL,
  `repEmpFacfacultad` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`repEmpFacID`),
  CONSTRAINT `fk_Gerente_Persona1000`
    FOREIGN KEY (`repEmpFacID`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Gerente_Persona1_idx` ON bienestar.`RepEmpFacultad` (`repEmpFacID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`ComAsesorBienUnivFacult`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`ComAsesorBienUnivFacult` ;

CREATE TABLE IF NOT EXISTS bienestar.`ComAsesorBienUnivFacult` (
  `comAsesorBienUnID` INT NOT NULL,
  `dirBienUnivSedeID` INT NOT NULL,
  `comAsesorBienUnFacultad` VARCHAR(45) NOT NULL,
  `docID` INT NOT NULL,
  `repEmpFacID` INT NOT NULL,
  `directBienID` INT NOT NULL,
  PRIMARY KEY (`comAsesorBienUnID`),
  CONSTRAINT `fk_ComAsesorBienUnivFacult_Docente1`
    FOREIGN KEY (`docID`)
    REFERENCES bienestar.`Docente` (`docID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ComAsesorBienUnivFacult_RepresentanteEmpleadosFacultad1`
    FOREIGN KEY (`repEmpFacID`)
    REFERENCES bienestar.`RepEmpFacultad` (`repEmpFacID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ComAsesorBienUnivFacult_DirBienUnivSede1`
    FOREIGN KEY (`dirBienUnivSedeID`)
    REFERENCES bienestar.`DirBienUnivSede` (`dirBienSedeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ComAsesorBienUnivFacult_Directorbienestar1`
    FOREIGN KEY (`directBienID`)
    REFERENCES bienestar.`Directorbienestar` (`docID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ComAsesorBienUnivFacult_Docente1_idx` ON bienestar.`ComAsesorBienUnivFacult` (`docID` ASC) VISIBLE;

CREATE INDEX `fk_ComAsesorBienUnivFacult_RepresentanteEmpleadosFacultad1_idx` ON bienestar.`ComAsesorBienUnivFacult` (`repEmpFacID` ASC) VISIBLE;

CREATE INDEX `fk_ComAsesorBienUnivFacult_DirBienUnivSede1_idx` ON bienestar.`ComAsesorBienUnivFacult` (`dirBienUnivSedeID` ASC) VISIBLE;

CREATE INDEX `fk_ComAsesorBienUnivFacult_Directorbienestar1_idx` ON bienestar.`ComAsesorBienUnivFacult` (`directBienID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`ReprEstudiantil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`ReprEstudiantil` ;

CREATE TABLE IF NOT EXISTS bienestar.`ReprEstudiantil` (
  `estID` INT NOT NULL,
  `repEstNivel` ENUM("PREGRADO", "POSGRADO") NOT NULL,
  `resEstConsejobienestarID` INT NULL,
  `repEstArea` ENUM("CARRERA", "FACULTAD", "SEDE", "CONSEJO") NOT NULL,
  `comAsesorBienUnivFacID` INT NULL,
  `comitSedeDirectoresID` INT NOT NULL,
  PRIMARY KEY (`estID`),
  CONSTRAINT `fk_ReprEstudiantil_ConBieneUniv1`
    FOREIGN KEY (`resEstConsejobienestarID`)
    REFERENCES bienestar.`ConBieneUniv` (`idConBieneUniv`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReprEstudiantil_Estudiante1`
    FOREIGN KEY (`estID`)
    REFERENCES bienestar.`Estudiante` (`estID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReprEstudiantil_ComAsesorBienUnivFacult1`
    FOREIGN KEY (`comAsesorBienUnivFacID`)
    REFERENCES bienestar.`ComAsesorBienUnivFacult` (`comAsesorBienUnID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReprEstudiantil_ComitSedeDirectores1`
    FOREIGN KEY (`comitSedeDirectoresID`)
    REFERENCES bienestar.`ComitSedeDirectores` (`comitSedeDirectoresID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ReprEstudiantil_ConBieneUniv1_idx` ON bienestar.`ReprEstudiantil` (`resEstConsejobienestarID` ASC) VISIBLE;

CREATE INDEX `fk_ReprEstudiantil_Estudiante1_idx` ON bienestar.`ReprEstudiantil` (`estID` ASC) VISIBLE;

CREATE INDEX `fk_ReprEstudiantil_ComAsesorBienUnivFacult1_idx` ON bienestar.`ReprEstudiantil` (`comAsesorBienUnivFacID` ASC) VISIBLE;

CREATE INDEX `fk_ReprEstudiantil_ComitSedeDirectores1_idx` ON bienestar.`ReprEstudiantil` (`comitSedeDirectoresID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`ComitNacMatricula`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`ComitNacMatricula` ;

CREATE TABLE IF NOT EXISTS bienestar.`ComitNacMatricula` (
  `comiNacDirectoresID` INT NOT NULL,
  `vicerrectorID` INT NOT NULL,
  `directorbienestarID` INT NOT NULL,
  `reprEstudiantilID` INT NOT NULL,
  PRIMARY KEY (`comiNacDirectoresID`),
  CONSTRAINT `fk_ComitNacMatricula_Vicerrector1`
    FOREIGN KEY (`vicerrectorID`)
    REFERENCES bienestar.`Vicerrector` (`docID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ComitNacMatricula_Directorbienestar1`
    FOREIGN KEY (`directorbienestarID`)
    REFERENCES bienestar.`Directorbienestar` (`docID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ComitNacMatricula_ReprEstudiantil1`
    FOREIGN KEY (`reprEstudiantilID`)
    REFERENCES bienestar.`ReprEstudiantil` (`estID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ComitNacMatricula_Vicerrector1_idx` ON bienestar.`ComitNacMatricula` (`vicerrectorID` ASC) VISIBLE;

CREATE INDEX `fk_ComitNacMatricula_Directorbienestar1_idx` ON bienestar.`ComitNacMatricula` (`directorbienestarID` ASC) VISIBLE;

CREATE INDEX `fk_ComitNacMatricula_ReprEstudiantil1_idx` ON bienestar.`ComitNacMatricula` (`reprEstudiantilID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Docente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Docente` ;

CREATE TABLE IF NOT EXISTS bienestar.`Docente` (
  `docID` INT NOT NULL,
  `docTenerTarjeta` TINYINT NOT NULL,
  `docFacultad` VARCHAR(45) NOT NULL,
  `docEsRepprofesoral` TINYINT NOT NULL,
  `docEsDecano` TINYINT NOT NULL,
  `conbienestarUniv` INT NULL,
  `comitNacMatriculaID` INT NULL,
  PRIMARY KEY (`docID`),
  CONSTRAINT `fk_Docente/Administrativo_Persona1`
    FOREIGN KEY (`docID`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Docente_ConBieneUniv1`
    FOREIGN KEY (`conbienestarUniv`)
    REFERENCES bienestar.`ConBieneUniv` (`idConBieneUniv`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Docente_ComitNacMatricula1`
    FOREIGN KEY (`comitNacMatriculaID`)
    REFERENCES bienestar.`ComitNacMatricula` (`comiNacDirectoresID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Docente_ConBieneUniv1_idx` ON bienestar.`Docente` (`conbienestarUniv` ASC) VISIBLE;

CREATE INDEX `fk_Docente_ComitNacMatricula1_idx` ON bienestar.`Docente` (`comitNacMatriculaID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`ComitSedeDirectores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`ComitSedeDirectores` ;

CREATE TABLE IF NOT EXISTS bienestar.`ComitSedeDirectores` (
  `comitSedeDirectoresID` INT NOT NULL,
  `comitSedeDirectoresAno` INT NOT NULL,
  `docID` INT NOT NULL,
  `conBienID` INT NOT NULL,
  PRIMARY KEY (`comitSedeDirectoresID`),
  CONSTRAINT `fk_ComitSedeDirectores_Docente1`
    FOREIGN KEY (`docID`)
    REFERENCES bienestar.`Docente` (`docID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ComitSedeDirectores_ConBieneUniv1`
    FOREIGN KEY (`conBienID`)
    REFERENCES bienestar.`ConBieneUniv` (`idConBieneUniv`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ComitSedeDirectores_Docente1_idx` ON bienestar.`ComitSedeDirectores` (`docID` ASC) VISIBLE;

CREATE INDEX `fk_ComitSedeDirectores_ConBieneUniv1_idx` ON bienestar.`ComitSedeDirectores` (`conBienID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`DirBienUnivSede`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`DirBienUnivSede` ;

CREATE TABLE IF NOT EXISTS bienestar.`DirBienUnivSede` (
  `dirBienSedeID` INT NOT NULL,
  `comitSedeDirectoresID` INT NOT NULL,
  `dirBienSedeAno` INT NOT NULL,
  `dirBienSedeSede` VARCHAR(45) NOT NULL,
  `directorbienestarID` INT NOT NULL,
  PRIMARY KEY (`dirBienSedeID`, `comitSedeDirectoresID`),
  CONSTRAINT `fk_DirBienUnivSede_ComitSedeDirectores2`
    FOREIGN KEY (`comitSedeDirectoresID`)
    REFERENCES bienestar.`ComitSedeDirectores` (`comitSedeDirectoresID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DirBienUnivSede_Directorbienestar1`
    FOREIGN KEY (`directorbienestarID`)
    REFERENCES bienestar.`Directorbienestar` (`docID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_DirBienUnivSede_ComitSedeDirectores2_idx` ON bienestar.`DirBienUnivSede` (`comitSedeDirectoresID` ASC) VISIBLE;

CREATE INDEX `fk_DirBienUnivSede_Directorbienestar1_idx` ON bienestar.`DirBienUnivSede` (`directorbienestarID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Gerente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Gerente` ;

CREATE TABLE IF NOT EXISTS bienestar.`Gerente` (
  `gerID` INT NOT NULL,
  `gerDependencia` VARCHAR(30) NOT NULL,
  `dirbienestarSedeID` INT NOT NULL,
  PRIMARY KEY (`gerID`),
  CONSTRAINT `fk_Gerente_Persona10`
    FOREIGN KEY (`gerID`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Gerente_DirBienUnivSede1`
    FOREIGN KEY (`dirbienestarSedeID`)
    REFERENCES bienestar.`DirBienUnivSede` (`dirBienSedeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Gerente_Persona1_idx` ON bienestar.`Gerente` (`gerID` ASC) VISIBLE;

CREATE INDEX `fk_Gerente_DirBienUnivSede1_idx` ON bienestar.`Gerente` (`dirbienestarSedeID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`ConBieneUniv`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`ConBieneUniv` ;

CREATE TABLE IF NOT EXISTS bienestar.`ConBieneUniv` (
  `idConBieneUniv` INT NOT NULL,
  `conBienAnoCreacion` INT NOT NULL,
  `estEgresadoID` INT NOT NULL,
  `dirbienestarID` INT NOT NULL,
  `geNacFinanAdminID` INT NOT NULL,
  `vicerrectorID` INT NOT NULL,
  `comNacDirectoresID` INT NOT NULL,
  `comnacMatriculaID` INT NOT NULL,
  PRIMARY KEY (`idConBieneUniv`),
  CONSTRAINT `fk_ConBieneUniv_Gerente1`
    FOREIGN KEY (`geNacFinanAdminID`)
    REFERENCES bienestar.`Gerente` (`gerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ConBieneUniv_Vicerrector1`
    FOREIGN KEY (`vicerrectorID`)
    REFERENCES bienestar.`Vicerrector` (`docID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ConBieneUniv_ComiNacDirectores1`
    FOREIGN KEY (`comNacDirectoresID`)
    REFERENCES bienestar.`ComitNacDirectores` (`comiNacDirectoresID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ConBieneUniv_ComitNacMatricula1`
    FOREIGN KEY (`comnacMatriculaID`)
    REFERENCES bienestar.`ComitNacMatricula` (`comiNacDirectoresID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ConBieneUniv_Estudiante1`
    FOREIGN KEY (`estEgresadoID`)
    REFERENCES bienestar.`Estudiante` (`estID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ConBieneUniv_Directorbienestar1`
    FOREIGN KEY (`dirbienestarID`)
    REFERENCES bienestar.`Directorbienestar` (`docID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ConBieneUniv_Gerente1_idx` ON bienestar.`ConBieneUniv` (`geNacFinanAdminID` ASC) VISIBLE;

CREATE INDEX `fk_ConBieneUniv_Vicerrector1_idx` ON bienestar.`ConBieneUniv` (`vicerrectorID` ASC) VISIBLE;

CREATE INDEX `fk_ConBieneUniv_ComiNacDirectores1_idx` ON bienestar.`ConBieneUniv` (`comNacDirectoresID` ASC) VISIBLE;

CREATE INDEX `fk_ConBieneUniv_ComitNacMatricula1_idx` ON bienestar.`ConBieneUniv` (`comnacMatriculaID` ASC) VISIBLE;

CREATE INDEX `fk_ConBieneUniv_Estudiante1_idx` ON bienestar.`ConBieneUniv` (`estEgresadoID` ASC) VISIBLE;

CREATE INDEX `fk_ConBieneUniv_Directorbienestar1_idx` ON bienestar.`ConBieneUniv` (`dirbienestarID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`TiendabienestarUN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`TiendabienestarUN` ;

CREATE TABLE IF NOT EXISTS bienestar.`TiendabienestarUN` (
  `tiendBienID` INT NOT NULL,
  `tiendBienCiudad` VARCHAR(45) NOT NULL,
  `tiendBienDireccion` VARCHAR(50) NOT NULL,
  `tiendBienHorario` VARCHAR(45) NOT NULL,
  `tiendBienDescripcion` VARCHAR(45) NOT NULL,
  `directorID` INT NOT NULL,
  `coordID` INT NOT NULL,
  `conBieneUnivID` INT NOT NULL,
  PRIMARY KEY (`tiendBienID`),
  CONSTRAINT `fk_TiendabienestarUN_Persona1`
    FOREIGN KEY (`directorID`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TiendabienestarUN_Persona2`
    FOREIGN KEY (`coordID`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TiendabienestarUN_ConBieneUniv1`
    FOREIGN KEY (`conBieneUnivID`)
    REFERENCES bienestar.`ConBieneUniv` (`idConBieneUniv`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_TiendabienestarUN_Persona1_idx` ON bienestar.`TiendabienestarUN` (`directorID` ASC) VISIBLE;

CREATE INDEX `fk_TiendabienestarUN_Persona2_idx` ON bienestar.`TiendabienestarUN` (`coordID` ASC) VISIBLE;

CREATE INDEX `fk_TiendabienestarUN_ConBieneUniv1_idx` ON bienestar.`TiendabienestarUN` (`conBieneUnivID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Area` ;

CREATE TABLE IF NOT EXISTS bienestar.`Area` (
  `areNombre` VARCHAR(100) NOT NULL,
  `areTelefono` INT NOT NULL,
  `areCorreoElectronico` VARCHAR(60) NOT NULL,
  `areExtension` INT NOT NULL,
  PRIMARY KEY (`areNombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`Persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Persona` ;

CREATE TABLE IF NOT EXISTS bienestar.`Persona` (
  `perID` INT NOT NULL,
  `perNombre` VARCHAR(45) NOT NULL,
  `perApellido` VARCHAR(45) NOT NULL,
  `perDireccion` VARCHAR(45) NOT NULL,
  `perBarrio` VARCHAR(45) NOT NULL,
  `perCiudad` VARCHAR(45) NOT NULL,
  `perTipoVivienda` ENUM("Casa", "Apartamento", "Apartaestudio", "Finca") NOT NULL,
  `perLocalidad` VARCHAR(45) NOT NULL,
  `perEmail` VARCHAR(20) NOT NULL,
  `perEntidadSalud` VARCHAR(45) NOT NULL,
  `perProcedencia` VARCHAR(45) NOT NULL,
  `perSede` VARCHAR(20) NOT NULL,
  `perIDTrabTienda` INT NULL,
  `perAreNombre` VARCHAR(100) NULL,
  PRIMARY KEY (`perID`),
  CONSTRAINT `fk_Persona_TiendabienestarUN1`
    FOREIGN KEY (`perIDTrabTienda`)
    REFERENCES bienestar.`TiendabienestarUN` (`tiendBienID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_Area1`
    FOREIGN KEY (`perAreNombre`)
    REFERENCES bienestar.`Area` (`areNombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Persona_TiendabienestarUN1_idx` ON bienestar.`Persona` (`perIDTrabTienda` ASC) VISIBLE;

CREATE INDEX `fk_Persona_Area1_idx` ON bienestar.`Persona` (`perAreNombre` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Ambulancia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Ambulancia` ;

CREATE TABLE IF NOT EXISTS bienestar.`Ambulancia` (
  `idAmbulancia` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`idAmbulancia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`PersonalSalud`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`PersonalSalud` ;

CREATE TABLE IF NOT EXISTS bienestar.`PersonalSalud` (
  `Persona_id` INT NOT NULL,
  `salProfesion` VARCHAR(45) NULL,
  `salEspecializacion` VARCHAR(45) NULL,
  `salTipo` VARCHAR(10) NOT NULL,
  `Ambulancia_id` VARCHAR(6) NULL,
  PRIMARY KEY (`Persona_id`),
  CONSTRAINT `fk_PersonalSalud_Persona`
    FOREIGN KEY (`Persona_id`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PersonalSalud_Ambulancia1`
    FOREIGN KEY (`Ambulancia_id`)
    REFERENCES bienestar.`Ambulancia` (`idAmbulancia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_PersonalSalud_Ambulancia1_idx` ON bienestar.`PersonalSalud` (`Ambulancia_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Urgencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Urgencia` ;

CREATE TABLE IF NOT EXISTS bienestar.`Urgencia` (
  `Persona_id` INT NOT NULL,
  `Ambulancia` VARCHAR(6) NOT NULL,
  `idUrgencia` INT NOT NULL,
  `urgFecha` DATETIME NOT NULL,
  `urgTipo` TINYINT NOT NULL,
  `urgRiesgo` TINYINT NOT NULL,
  `urgDiagnostico` VARCHAR(45) NOT NULL,
  `urgTraslado` VARCHAR(45) NOT NULL,
  `urgHoraRecogida` DATETIME NOT NULL,
  `urgHoraDejada` DATETIME NOT NULL,
  PRIMARY KEY (`Persona_id`),
  CONSTRAINT `fk_Urgencia_Ambulancia1`
    FOREIGN KEY (`Ambulancia`)
    REFERENCES bienestar.`Ambulancia` (`idAmbulancia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Urgencia_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Urgencia_Ambulancia1_idx` ON bienestar.`Urgencia` (`Ambulancia` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Incapacidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Incapacidad` ;

CREATE TABLE IF NOT EXISTS bienestar.`Incapacidad` (
  `Persona_id` INT NOT NULL,
  `incFecha` DATE NOT NULL,
  `incEnfermedad` VARCHAR(45) NOT NULL,
  `incDias` TINYINT NOT NULL,
  `incConvalidada` BIT NOT NULL,
  `incSoporteDireccion` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`Persona_id`),
  CONSTRAINT `fk_Incapacidad_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`PerfilRiesgoIntegral`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`PerfilRiesgoIntegral` ;

CREATE TABLE IF NOT EXISTS bienestar.`PerfilRiesgoIntegral` (
  `Persona_id` INT NOT NULL,
  `perFecha` DATE NOT NULL,
  `perResultadoDireccion` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`Persona_id`),
  CONSTRAINT `fk_PerfilRiesgoIntegral_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`Resultados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Resultados` ;

CREATE TABLE IF NOT EXISTS bienestar.`Resultados` (
  `PerfilRiesgoIntegral_id` INT NOT NULL,
  `resPregunta` VARCHAR(45) NOT NULL,
  `resRespuesta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PerfilRiesgoIntegral_id`),
  CONSTRAINT `fk_Resultados_PerfilRiesgoIntegral1`
    FOREIGN KEY (`PerfilRiesgoIntegral_id`)
    REFERENCES bienestar.`PerfilRiesgoIntegral` (`Persona_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`Discapacidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Discapacidad` ;

CREATE TABLE IF NOT EXISTS bienestar.`Discapacidad` (
  `Persona_id` INT NOT NULL,
  `disNombre` VARCHAR(45) NOT NULL,
  `disSoporteDireccion` VARCHAR(32) NOT NULL,
  `disVerificado` BIT NOT NULL,
  PRIMARY KEY (`Persona_id`),
  CONSTRAINT `fk_Discapacidad_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`AsesoriaAseguramientoSalud`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`AsesoriaAseguramientoSalud` ;

CREATE TABLE IF NOT EXISTS bienestar.`AsesoriaAseguramientoSalud` (
  `Persona_id` INT NOT NULL,
  `aseFecha` DATE NOT NULL,
  `aseResultado` VARCHAR(45) NOT NULL,
  `aseDescripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Persona_id`),
  CONSTRAINT `fk_AsesoriaAseguramientoSalud_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`HistoriaClinica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`HistoriaClinica` ;

CREATE TABLE IF NOT EXISTS bienestar.`HistoriaClinica` (
  `Persona_id` INT NOT NULL,
  `hisFechaApertura` DATE NOT NULL,
  PRIMARY KEY (`Persona_id`),
  CONSTRAINT `fk_HistoriaClinica_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_HistoriaClinica_Persona1_idx` ON bienestar.`HistoriaClinica` (`Persona_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`CitaMedica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`CitaMedica` ;

CREATE TABLE IF NOT EXISTS bienestar.`CitaMedica` (
  `idCitaMedica` INT NOT NULL,
  `Doctor` INT NOT NULL,
  `Paciente` INT NOT NULL,
  `citFecha` DATETIME NOT NULL,
  `citEspecialidad` VARCHAR(45) NOT NULL,
  `citDiagnostico` VARCHAR(80) NULL,
  `HistoriaClinica_id` INT NOT NULL,
  PRIMARY KEY (`idCitaMedica`),
  CONSTRAINT `fk_CitaMedica_PersonalSalud1`
    FOREIGN KEY (`Doctor`)
    REFERENCES bienestar.`PersonalSalud` (`Persona_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CitaMedica_Persona1`
    FOREIGN KEY (`Paciente`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CitaMedica_HistoriaClinica1`
    FOREIGN KEY (`HistoriaClinica_id`)
    REFERENCES bienestar.`HistoriaClinica` (`Persona_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_CitaMedica_PersonalSalud1_idx` ON bienestar.`CitaMedica` (`Doctor` ASC) VISIBLE;

CREATE INDEX `fk_CitaMedica_Persona1_idx` ON bienestar.`CitaMedica` (`Paciente` ASC) VISIBLE;

CREATE INDEX `fk_CitaMedica_HistoriaClinica1_idx` ON bienestar.`CitaMedica` (`HistoriaClinica_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`EvaluacionFisica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`EvaluacionFisica` ;

CREATE TABLE IF NOT EXISTS bienestar.`EvaluacionFisica` (
  `CitaMedica_id` INT NOT NULL,
  `evaPeso` TINYINT NOT NULL,
  `evaEstatura` TINYINT NOT NULL,
  `evaRitmoCardiaco` TINYINT NOT NULL,
  `evaVision` TINYINT NOT NULL,
  PRIMARY KEY (`CitaMedica_id`),
  CONSTRAINT `fk_EvaluacionFisica_CitaMedica1`
    FOREIGN KEY (`CitaMedica_id`)
    REFERENCES bienestar.`CitaMedica` (`idCitaMedica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`Medicamentos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Medicamentos` ;

CREATE TABLE IF NOT EXISTS bienestar.`Medicamentos` (
  `CitaMedica_id` INT NOT NULL,
  `medNombre` VARCHAR(45) NOT NULL,
  `medCantidad` TINYINT NOT NULL,
  `medIntervalos` TINYINT NOT NULL,
  PRIMARY KEY (`CitaMedica_id`),
  CONSTRAINT `fk_Medicamentos_CitaMedica1`
    FOREIGN KEY (`CitaMedica_id`)
    REFERENCES bienestar.`CitaMedica` (`idCitaMedica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`OrdenMedica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`OrdenMedica` ;

CREATE TABLE IF NOT EXISTS bienestar.`OrdenMedica` (
  `CitaMedica_id` INT NOT NULL,
  `ordExamen` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CitaMedica_id`),
  CONSTRAINT `fk_OrdenMedica_CitaMedica1`
    FOREIGN KEY (`CitaMedica_id`)
    REFERENCES bienestar.`CitaMedica` (`idCitaMedica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`AntecedentesFamiliares`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`AntecedentesFamiliares` ;

CREATE TABLE IF NOT EXISTS bienestar.`AntecedentesFamiliares` (
  `HistoriaClinica_id` INT NOT NULL,
  `antFamiliar` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`HistoriaClinica_id`),
  CONSTRAINT `fk_AntecedentesFamiliares_HistoriaClinica1`
    FOREIGN KEY (`HistoriaClinica_id`)
    REFERENCES bienestar.`HistoriaClinica` (`Persona_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`Enfermedad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Enfermedad` ;

CREATE TABLE IF NOT EXISTS bienestar.`Enfermedad` (
  `HistoriaClinica_id` INT NOT NULL,
  `enfNombre` VARCHAR(45) NOT NULL,
  `enfFechaInicio` DATE NOT NULL,
  PRIMARY KEY (`HistoriaClinica_id`),
  CONSTRAINT `fk_Enfermedad_HistoriaClinica1`
    FOREIGN KEY (`HistoriaClinica_id`)
    REFERENCES bienestar.`HistoriaClinica` (`Persona_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`EnfermedadDeFamiliar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`EnfermedadDeFamiliar` ;

CREATE TABLE IF NOT EXISTS bienestar.`EnfermedadDeFamiliar` (
  `Enfermedad_id` INT NOT NULL,
  `AntecedentesFamiliares_id` INT NOT NULL,
  PRIMARY KEY (`Enfermedad_id`, `AntecedentesFamiliares_id`),
  CONSTRAINT `fk_Enfermedad_has_AntecedentesFamiliares_Enfermedad1`
    FOREIGN KEY (`Enfermedad_id`)
    REFERENCES bienestar.`Enfermedad` (`HistoriaClinica_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enfermedad_has_AntecedentesFamiliares_AntecedentesFamiliar1`
    FOREIGN KEY (`AntecedentesFamiliares_id`)
    REFERENCES bienestar.`AntecedentesFamiliares` (`HistoriaClinica_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Enfermedad_has_AntecedentesFamiliares_AntecedentesFamili_idx` ON bienestar.`EnfermedadDeFamiliar` (`AntecedentesFamiliares_id` ASC) VISIBLE;

CREATE INDEX `fk_Enfermedad_has_AntecedentesFamiliares_Enfermedad1_idx` ON bienestar.`EnfermedadDeFamiliar` (`Enfermedad_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Actividad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Actividad` ;

CREATE TABLE IF NOT EXISTS bienestar.`Actividad` (
  `idActividad` INT NOT NULL,
  `actTipo` VARCHAR(45) NOT NULL,
  `actFecha` DATETIME NOT NULL,
  `actAlcance` INT NOT NULL,
  `actPresupuesto` INT NOT NULL,
  `actDescripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idActividad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`ActividadOrganizadores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`ActividadOrganizadores` ;

CREATE TABLE IF NOT EXISTS bienestar.`ActividadOrganizadores` (
  `Actividad_id` INT NOT NULL,
  `Organizador_id` INT NOT NULL,
  PRIMARY KEY (`Actividad_id`, `Organizador_id`),
  CONSTRAINT `fk_Actividad_has_Persona_Actividad1`
    FOREIGN KEY (`Actividad_id`)
    REFERENCES bienestar.`Actividad` (`idActividad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actividad_has_Persona_Persona1`
    FOREIGN KEY (`Organizador_id`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Actividad_has_Persona_Persona1_idx` ON bienestar.`ActividadOrganizadores` (`Organizador_id` ASC) VISIBLE;

CREATE INDEX `fk_Actividad_has_Persona_Actividad1_idx` ON bienestar.`ActividadOrganizadores` (`Actividad_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`ActividadParticipantes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`ActividadParticipantes` ;

CREATE TABLE IF NOT EXISTS bienestar.`ActividadParticipantes` (
  `Actividad_id` INT NOT NULL,
  `Participante_id` INT NOT NULL,
  PRIMARY KEY (`Actividad_id`, `Participante_id`),
  CONSTRAINT `fk_Actividad_has_Persona_Actividad2`
    FOREIGN KEY (`Actividad_id`)
    REFERENCES bienestar.`Actividad` (`idActividad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actividad_has_Persona_Persona2`
    FOREIGN KEY (`Participante_id`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Actividad_has_Persona_Persona2_idx` ON bienestar.`ActividadParticipantes` (`Participante_id` ASC) VISIBLE;

CREATE INDEX `fk_Actividad_has_Persona_Actividad2_idx` ON bienestar.`ActividadParticipantes` (`Actividad_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`PEAMA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`PEAMA` ;

CREATE TABLE IF NOT EXISTS bienestar.`PEAMA` (
  `Estudiante_id` INT NOT NULL,
  `peaEtapa` TINYINT NOT NULL,
  PRIMARY KEY (`Estudiante_id`),
  CONSTRAINT `fk_PEAMA_Estudiante1`
    FOREIGN KEY (`Estudiante_id`)
    REFERENCES bienestar.`Estudiante` (`estID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`TarjetaPremiumPass`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`TarjetaPremiumPass` ;

CREATE TABLE IF NOT EXISTS bienestar.`TarjetaPremiumPass` (
  `Docente_id` INT NOT NULL,
  `tarSaldo` INT NOT NULL,
  `tarActivada` BIT NOT NULL,
  PRIMARY KEY (`Docente_id`),
  CONSTRAINT `fk_table1_Docente1`
    FOREIGN KEY (`Docente_id`)
    REFERENCES bienestar.`Docente` (`docID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`Movimientos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Movimientos` ;

CREATE TABLE IF NOT EXISTS bienestar.`Movimientos` (
  `TarjetaPremiumPass_id` INT NOT NULL,
  `movFecha` DATETIME NOT NULL,
  `movEstablecimiento` VARCHAR(45) NOT NULL,
  `movMonto` INT NOT NULL,
  PRIMARY KEY (`TarjetaPremiumPass_id`),
  CONSTRAINT `fk_Movimientos_TarjetaPremiumPass1`
    FOREIGN KEY (`TarjetaPremiumPass_id`)
    REFERENCES bienestar.`TarjetaPremiumPass` (`Docente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`Publicacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Publicacion` ;

CREATE TABLE IF NOT EXISTS bienestar.`Publicacion` (
  `idPublicacion` INT NOT NULL,
  `pubTitulo` VARCHAR(45) NOT NULL,
  `pubFechaPublicacion` DATE NOT NULL,
  `pubTipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPublicacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`PersonaEscribir`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`PersonaEscribir` ;

CREATE TABLE IF NOT EXISTS bienestar.`PersonaEscribir` (
  `Persona_idPersona` INT NOT NULL,
  `Publicacion_idPublicacion` INT NOT NULL,
  PRIMARY KEY (`Persona_idPersona`, `Publicacion_idPublicacion`),
  CONSTRAINT `fk_Persona_has_Publicacion_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Publicacion_Publicacion1`
    FOREIGN KEY (`Publicacion_idPublicacion`)
    REFERENCES bienestar.`Publicacion` (`idPublicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Persona_has_Publicacion_Publicacion1_idx` ON bienestar.`PersonaEscribir` (`Publicacion_idPublicacion` ASC) VISIBLE;

CREATE INDEX `fk_Persona_has_Publicacion_Persona1_idx` ON bienestar.`PersonaEscribir` (`Persona_idPersona` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Jefebienestar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Jefebienestar` ;

CREATE TABLE IF NOT EXISTS bienestar.`Jefebienestar` (
  `jefID` INT NOT NULL,
  `jefDependencia` VARCHAR(30) NOT NULL,
  `jefEsJuridico` TINYINT NOT NULL,
  `jefEsPlaneacion` TINYINT NOT NULL,
  `gerenteID` INT NOT NULL,
  `comiNacDirectoresID` INT NOT NULL,
  `DirBienSedeID` INT NOT NULL,
  `comitNacMatriculaID` INT NULL,
  PRIMARY KEY (`jefID`),
  CONSTRAINT `fk_Gerente_Persona1`
    FOREIGN KEY (`jefID`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jefe bienestar_Gerente1`
    FOREIGN KEY (`gerenteID`)
    REFERENCES bienestar.`Gerente` (`gerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jefebienestar_ComiNacDirectores1`
    FOREIGN KEY (`comiNacDirectoresID`)
    REFERENCES bienestar.`ComitNacDirectores` (`comiNacDirectoresID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jefebienestar_DirBienUnivSede1`
    FOREIGN KEY (`DirBienSedeID`)
    REFERENCES bienestar.`DirBienUnivSede` (`dirBienSedeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jefebienestar_ComitNacMatricula2`
    FOREIGN KEY (`comitNacMatriculaID`)
    REFERENCES bienestar.`ComitNacMatricula` (`comiNacDirectoresID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Gerente_Persona1_idx` ON bienestar.`Jefebienestar` (`jefID` ASC) VISIBLE;

CREATE INDEX `fk_Jefe bienestar_Gerente1_idx` ON bienestar.`Jefebienestar` (`gerenteID` ASC) VISIBLE;

CREATE INDEX `fk_Jefebienestar_ComiNacDirectores1_idx` ON bienestar.`Jefebienestar` (`comiNacDirectoresID` ASC) VISIBLE;

CREATE INDEX `fk_Jefebienestar_DirBienUnivSede1_idx` ON bienestar.`Jefebienestar` (`DirBienSedeID` ASC) VISIBLE;

CREATE INDEX `fk_Jefebienestar_ComitNacMatricula2_idx` ON bienestar.`Jefebienestar` (`comitNacMatriculaID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Funcionario` ;

CREATE TABLE IF NOT EXISTS bienestar.`Funcionario` (
  `funID` INT NOT NULL,
  `funDependencia` VARCHAR(30) NOT NULL,
  `funRepEmpFacdPersona` INT NOT NULL,
  `funDirBienUnSedeID` INT NOT NULL,
  PRIMARY KEY (`funID`),
  CONSTRAINT `fk_Gerente_Persona100`
    FOREIGN KEY (`funID`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionario_Representante Empleados Facultad1`
    FOREIGN KEY (`funRepEmpFacdPersona`)
    REFERENCES bienestar.`RepEmpFacultad` (`repEmpFacID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionario_DirBienUnivSede1`
    FOREIGN KEY (`funDirBienUnSedeID`)
    REFERENCES bienestar.`DirBienUnivSede` (`dirBienSedeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Gerente_Persona1_idx` ON bienestar.`Funcionario` (`funID` ASC) VISIBLE;

CREATE INDEX `fk_Funcionario_Representante Empleados Facultad1_idx` ON bienestar.`Funcionario` (`funRepEmpFacdPersona` ASC) VISIBLE;

CREATE INDEX `fk_Funcionario_DirBienUnivSede1_idx` ON bienestar.`Funcionario` (`funDirBienUnSedeID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`DirAcademico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`DirAcademico` ;

CREATE TABLE IF NOT EXISTS bienestar.`DirAcademico` (
  `docID` INT NOT NULL,
  `comitSedeDirectoresID` INT NOT NULL,
  PRIMARY KEY (`docID`),
  CONSTRAINT `fk_Decano_Docente100000`
    FOREIGN KEY (`docID`)
    REFERENCES bienestar.`Docente` (`docID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DirAcademico_ComitSedeDirectores1`
    FOREIGN KEY (`comitSedeDirectoresID`)
    REFERENCES bienestar.`ComitSedeDirectores` (`comitSedeDirectoresID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Decano_Docente1_idx` ON bienestar.`DirAcademico` (`docID` ASC) VISIBLE;

CREATE INDEX `fk_DirAcademico_ComitSedeDirectores1_idx` ON bienestar.`DirAcademico` (`comitSedeDirectoresID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Normatividad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Normatividad` ;

CREATE TABLE IF NOT EXISTS bienestar.`Normatividad` (
  `normID` INT NOT NULL,
  `conBieneID` INT NULL,
  `comiNacDirectoresID` INT NULL,
  `comitSedeDirectoresID` INT NULL,
  `comitNacMatriculaID` INT NULL,
  `norDescripcion` VARCHAR(45) NOT NULL,
  `norTipo` VARCHAR(15) NOT NULL,
  `norAño` TINYINT NOT NULL,
  `norNumero` TINYINT NOT NULL,
  `norFechaEntradaVigencia` DATE NOT NULL,
  `norLink` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`normID`),
  CONSTRAINT `fk_Normatividad_ConBieneUniv1`
    FOREIGN KEY (`conBieneID`)
    REFERENCES bienestar.`ConBieneUniv` (`idConBieneUniv`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Normatividad_ComiNacDirectores1`
    FOREIGN KEY (`comiNacDirectoresID`)
    REFERENCES bienestar.`ComitNacDirectores` (`comiNacDirectoresID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Normatividad_ComitSedeDirectores1`
    FOREIGN KEY (`comitSedeDirectoresID`)
    REFERENCES bienestar.`ComitSedeDirectores` (`comitSedeDirectoresID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Normatividad_ComitNacMatricula1`
    FOREIGN KEY (`comitNacMatriculaID`)
    REFERENCES bienestar.`ComitNacMatricula` (`comiNacDirectoresID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Normatividad_ConBieneUniv1_idx` ON bienestar.`Normatividad` (`conBieneID` ASC) VISIBLE;

CREATE INDEX `fk_Normatividad_ComiNacDirectores1_idx` ON bienestar.`Normatividad` (`comiNacDirectoresID` ASC) VISIBLE;

CREATE INDEX `fk_Normatividad_ComitSedeDirectores1_idx` ON bienestar.`Normatividad` (`comitSedeDirectoresID` ASC) VISIBLE;

CREATE INDEX `fk_Normatividad_ComitNacMatricula1_idx` ON bienestar.`Normatividad` (`comitNacMatriculaID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`DirBienUnivSede_has_Normatividad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`DirBienUnivSede_has_Normatividad` ;

CREATE TABLE IF NOT EXISTS bienestar.`DirBienUnivSede_has_Normatividad` (
  `dirBienUnivSedeID` INT NOT NULL,
  `normID` INT NOT NULL,
  PRIMARY KEY (`dirBienUnivSedeID`, `normID`),
  CONSTRAINT `fk_DirBienUnivSede_has_Normatividad_DirBienUnivSede1`
    FOREIGN KEY (`dirBienUnivSedeID`)
    REFERENCES bienestar.`DirBienUnivSede` (`dirBienSedeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DirBienUnivSede_has_Normatividad_Normatividad1`
    FOREIGN KEY (`normID`)
    REFERENCES bienestar.`Normatividad` (`normID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_DirBienUnivSede_has_Normatividad_Normatividad1_idx` ON bienestar.`DirBienUnivSede_has_Normatividad` (`normID` ASC) VISIBLE;

CREATE INDEX `fk_DirBienUnivSede_has_Normatividad_DirBienUnivSede1_idx` ON bienestar.`DirBienUnivSede_has_Normatividad` (`dirBienUnivSedeID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Normatividad_has_ComAsesorBienUnivFacult`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Normatividad_has_ComAsesorBienUnivFacult` ;

CREATE TABLE IF NOT EXISTS bienestar.`Normatividad_has_ComAsesorBienUnivFacult` (
  `normID` INT NOT NULL,
  `comAsesorBienUnivFacultID` INT NOT NULL,
  PRIMARY KEY (`normID`, `comAsesorBienUnivFacultID`),
  CONSTRAINT `fk_Normatividad_has_ComAsesorBienUnivFacult_Normatividad1`
    FOREIGN KEY (`normID`)
    REFERENCES bienestar.`Normatividad` (`normID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Normatividad_has_ComAsesorBienUnivFacult_ComAsesorBienUniv1`
    FOREIGN KEY (`comAsesorBienUnivFacultID`)
    REFERENCES bienestar.`ComAsesorBienUnivFacult` (`comAsesorBienUnID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Normatividad_has_ComAsesorBienUnivFacult_ComAsesorBienUn_idx` ON bienestar.`Normatividad_has_ComAsesorBienUnivFacult` (`comAsesorBienUnivFacultID` ASC) VISIBLE;

CREATE INDEX `fk_Normatividad_has_ComAsesorBienUnivFacult_Normatividad1_idx` ON bienestar.`Normatividad_has_ComAsesorBienUnivFacult` (`normID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`EventoCultural`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`EventoCultural` ;

CREATE TABLE IF NOT EXISTS bienestar.`EventoCultural` (
  `eveCulID` INT NOT NULL,
  `eveCulNombre` VARCHAR(50) NOT NULL,
  `eveCulLugar` VARCHAR(45) NOT NULL,
  `eveCulFecha` DATE NOT NULL,
  `eveCulhorInicio` TIME NOT NULL,
  `eveCulhorFin` TIME NOT NULL,
  `eveCulTipo` ENUM("Evento", "Actividad Lúdica", "Instrucción", "Promoción Interculturalidad", "Expresión Talentos") NOT NULL,
  `eveCulDescripcion` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`eveCulID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`perGestionaEveCul`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`perGestionaEveCul` ;

CREATE TABLE IF NOT EXISTS bienestar.`perGestionaEveCul` (
  `eveCulID` INT NOT NULL,
  `perID` INT NOT NULL,
  `gestEveCulCargo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`eveCulID`, `perID`),
  CONSTRAINT `fk_EventoCultural_has_Persona_EventoCultural1`
    FOREIGN KEY (`eveCulID`)
    REFERENCES bienestar.`EventoCultural` (`eveCulID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EventoCultural_has_Persona_Persona1`
    FOREIGN KEY (`perID`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_EventoCultural_has_Persona_Persona1_idx` ON bienestar.`perGestionaEveCul` (`perID` ASC) VISIBLE;

CREATE INDEX `fk_EventoCultural_has_Persona_EventoCultural1_idx` ON bienestar.`perGestionaEveCul` (`eveCulID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`perAsisteEveCul`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`perAsisteEveCul` ;

CREATE TABLE IF NOT EXISTS bienestar.`perAsisteEveCul` (
  `eveCulID` INT NOT NULL,
  `perID` INT NOT NULL,
  `asiEveCulComentario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`eveCulID`, `perID`),
  CONSTRAINT `fk_EventoCultural_has_Persona_EventoCultural2`
    FOREIGN KEY (`eveCulID`)
    REFERENCES bienestar.`EventoCultural` (`eveCulID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EventoCultural_has_Persona_Persona2`
    FOREIGN KEY (`perID`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_EventoCultural_has_Persona_Persona2_idx` ON bienestar.`perAsisteEveCul` (`perID` ASC) VISIBLE;

CREATE INDEX `fk_EventoCultural_has_Persona_EventoCultural2_idx` ON bienestar.`perAsisteEveCul` (`eveCulID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`perParticipaEveCul`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`perParticipaEveCul` ;

CREATE TABLE IF NOT EXISTS bienestar.`perParticipaEveCul` (
  `eveCulID` INT NOT NULL,
  `perID` INT NOT NULL,
  `partEveCulTalento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`eveCulID`, `perID`),
  CONSTRAINT `fk_EventoCultural_has_Persona_EventoCultural3`
    FOREIGN KEY (`eveCulID`)
    REFERENCES bienestar.`EventoCultural` (`eveCulID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EventoCultural_has_Persona_Persona3`
    FOREIGN KEY (`perID`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_EventoCultural_has_Persona_Persona3_idx` ON bienestar.`perParticipaEveCul` (`perID` ASC) VISIBLE;

CREATE INDEX `fk_EventoCultural_has_Persona_EventoCultural3_idx` ON bienestar.`perParticipaEveCul` (`eveCulID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`ConvGAI`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`ConvGAI` ;

CREATE TABLE IF NOT EXISTS bienestar.`ConvGAI` (
  `convGaiID` INT NOT NULL,
  `convGaiNombre` VARCHAR(50) NOT NULL,
  `convGaiDisciplina` VARCHAR(45) NOT NULL,
  `docID` INT NOT NULL,
  PRIMARY KEY (`convGaiID`),
  CONSTRAINT `fk_ConvocGAI (GrArtInst)_Docente1`
    FOREIGN KEY (`docID`)
    REFERENCES bienestar.`Docente` (`docID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ConvocGAI (GrArtInst)_Docente1_idx` ON bienestar.`ConvGAI` (`docID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`gaiTieneActividad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`gaiTieneActividad` ;

CREATE TABLE IF NOT EXISTS bienestar.`gaiTieneActividad` (
  `convGaiID` INT NOT NULL,
  `actividadID` INT NOT NULL,
  PRIMARY KEY (`convGaiID`, `actividadID`),
  CONSTRAINT `fk_ConvocGAI (GrArtInst)_has_Actividad_ConvocGAI (GrArtInst)1`
    FOREIGN KEY (`convGaiID`)
    REFERENCES bienestar.`ConvGAI` (`convGaiID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ConvocGAI (GrArtInst)_has_Actividad_Actividad1`
    FOREIGN KEY (`actividadID`)
    REFERENCES bienestar.`Actividad` (`idActividad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ConvocGAI (GrArtInst)_has_Actividad_Actividad1_idx` ON bienestar.`gaiTieneActividad` (`actividadID` ASC) VISIBLE;

CREATE INDEX `fk_ConvocGAI (GrArtInst)_has_Actividad_ConvocGAI (GrArtInst_idx` ON bienestar.`gaiTieneActividad` (`convGaiID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`GaiTieneAspirante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`GaiTieneAspirante` ;

CREATE TABLE IF NOT EXISTS bienestar.`GaiTieneAspirante` (
  `convGaiID` INT NOT NULL,
  `estID` INT NOT NULL,
  `convGaiTalento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`convGaiID`, `estID`),
  CONSTRAINT `fk_ConvocGAI (GrArtInst)_has_Estudiante_ConvocGAI (GrArtInst)1`
    FOREIGN KEY (`convGaiID`)
    REFERENCES bienestar.`ConvGAI` (`convGaiID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ConvocGAI (GrArtInst)_has_Estudiante_Estudiante1`
    FOREIGN KEY (`estID`)
    REFERENCES bienestar.`Estudiante` (`estID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ConvocGAI (GrArtInst)_has_Estudiante_Estudiante1_idx` ON bienestar.`GaiTieneAspirante` (`estID` ASC) VISIBLE;

CREATE INDEX `fk_ConvocGAI (GrArtInst)_has_Estudiante_ConvocGAI (GrArtIns_idx` ON bienestar.`GaiTieneAspirante` (`convGaiID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`gaiTieneEstudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`gaiTieneEstudiante` ;

CREATE TABLE IF NOT EXISTS bienestar.`gaiTieneEstudiante` (
  `convGaiID` INT NOT NULL,
  `estID` INT NOT NULL,
  `GaiActividadFecha` DATE NOT NULL,
  PRIMARY KEY (`convGaiID`, `estID`),
  CONSTRAINT `fk_ConvocGAI (GrArtInst)_has_Estudiante_ConvocGAI (GrArtInst)2`
    FOREIGN KEY (`convGaiID`)
    REFERENCES bienestar.`ConvGAI` (`convGaiID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ConvocGAI (GrArtInst)_has_Estudiante_Estudiante2`
    FOREIGN KEY (`estID`)
    REFERENCES bienestar.`Estudiante` (`estID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ConvocGAI (GrArtInst)_has_Estudiante_Estudiante2_idx` ON bienestar.`gaiTieneEstudiante` (`estID` ASC) VISIBLE;

CREATE INDEX `fk_ConvocGAI (GrArtInst)_has_Estudiante_ConvocGAI (GrArtIns_idx` ON bienestar.`gaiTieneEstudiante` (`convGaiID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Producto` ;

CREATE TABLE IF NOT EXISTS bienestar.`Producto` (
  `prodID` INT NOT NULL,
  `prodPrecio` DOUBLE NOT NULL,
  `prodDetalle` VARCHAR(45) NOT NULL,
  `prodTotalVendido` DOUBLE NOT NULL,
  PRIMARY KEY (`prodID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`tiendBienOfrProd`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`tiendBienOfrProd` ;

CREATE TABLE IF NOT EXISTS bienestar.`tiendBienOfrProd` (
  `prodID` INT NOT NULL,
  `TiendabienestarUN_idTiendabienestarUN` INT NOT NULL,
  `ofrDescuento` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`prodID`, `TiendabienestarUN_idTiendabienestarUN`),
  CONSTRAINT `fk_Producto_has_TiendabienestarUN_Producto1`
    FOREIGN KEY (`prodID`)
    REFERENCES bienestar.`Producto` (`prodID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_has_TiendabienestarUN_TiendabienestarUN1`
    FOREIGN KEY (`TiendabienestarUN_idTiendabienestarUN`)
    REFERENCES bienestar.`TiendabienestarUN` (`tiendBienID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Producto_has_TiendabienestarUN_TiendabienestarUN1_idx` ON bienestar.`tiendBienOfrProd` (`TiendabienestarUN_idTiendabienestarUN` ASC) VISIBLE;

CREATE INDEX `fk_Producto_has_TiendabienestarUN_Producto1_idx` ON bienestar.`tiendBienOfrProd` (`prodID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Factura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Factura` ;

CREATE TABLE IF NOT EXISTS bienestar.`Factura` (
  `factID` INT NOT NULL,
  `factFecha` DATE NOT NULL,
  `factHora` TIME NOT NULL,
  `factDetalle` VARCHAR(50) NOT NULL,
  `tiendbienestarID` INT NOT NULL,
  `clientePerID` INT NOT NULL,
  PRIMARY KEY (`factID`),
  CONSTRAINT `fk_Factura_TiendabienestarUN1`
    FOREIGN KEY (`tiendbienestarID`)
    REFERENCES bienestar.`TiendabienestarUN` (`tiendBienID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Persona1`
    FOREIGN KEY (`clientePerID`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Factura_TiendabienestarUN1_idx` ON bienestar.`Factura` (`tiendbienestarID` ASC) VISIBLE;

CREATE INDEX `fk_Factura_Persona1_idx` ON bienestar.`Factura` (`clientePerID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`FacVendProd`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`FacVendProd` ;

CREATE TABLE IF NOT EXISTS bienestar.`FacVendProd` (
  `factID` INT NOT NULL,
  `prodID` INT NOT NULL,
  PRIMARY KEY (`factID`, `prodID`),
  CONSTRAINT `fk_Factura_has_Producto_Factura1`
    FOREIGN KEY (`factID`)
    REFERENCES bienestar.`Factura` (`factID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_has_Producto_Producto1`
    FOREIGN KEY (`prodID`)
    REFERENCES bienestar.`Producto` (`prodID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Factura_has_Producto_Producto1_idx` ON bienestar.`FacVendProd` (`prodID` ASC) VISIBLE;

CREATE INDEX `fk_Factura_has_Producto_Factura1_idx` ON bienestar.`FacVendProd` (`factID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`GestionEconomica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`GestionEconomica` ;

CREATE TABLE IF NOT EXISTS bienestar.`GestionEconomica` (
  `gesEconoID` INT NOT NULL,
  `gesEconoPlazo` INT NOT NULL,
  `estID` INT NOT NULL,
  PRIMARY KEY (`gesEconoID`, `estID`),
  CONSTRAINT `fk_GestionEconomica_Estudiante1`
    FOREIGN KEY (`estID`)
    REFERENCES bienestar.`Estudiante` (`estID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_GestionEconomica_Estudiante1_idx` ON bienestar.`GestionEconomica` (`estID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`AuxilioEconomico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`AuxilioEconomico` ;

CREATE TABLE IF NOT EXISTS bienestar.`AuxilioEconomico` (
  `auxEconID` INT NOT NULL,
  `auxEconMonto` DOUBLE NOT NULL,
  `auxEconHorCorrespon` INT NOT NULL,
  PRIMARY KEY (`auxEconID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`GestionAlojamiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`GestionAlojamiento` ;

CREATE TABLE IF NOT EXISTS bienestar.`GestionAlojamiento` (
  `gesAlojID` INT NOT NULL,
  `gesAlojDireccion` VARCHAR(55) NOT NULL,
  `gesAlojMonto` DOUBLE NOT NULL,
  `gesAlojHorCorrespon` INT NOT NULL,
  PRIMARY KEY (`gesAlojID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`GestionTransporte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`GestionTransporte` ;

CREATE TABLE IF NOT EXISTS bienestar.`GestionTransporte` (
  `gesTranID` INT NOT NULL,
  `gesTranMonto` DOUBLE NOT NULL,
  `gesTranHorCorrespon` INT NOT NULL,
  PRIMARY KEY (`gesTranID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`FomentoEmprendimiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`FomentoEmprendimiento` ;

CREATE TABLE IF NOT EXISTS bienestar.`FomentoEmprendimiento` (
  `fomEmpID` INT NOT NULL,
  `fomEmpNombre` VARCHAR(50) NOT NULL,
  `fomEmpAreAcademica` VARCHAR(30) NOT NULL,
  `fomEmpTema` VARCHAR(30) NOT NULL,
  `fomEmpDescripcion` VARCHAR(60) NOT NULL,
  `liderEstID` INT NOT NULL,
  `liderDocID` INT NOT NULL,
  `fomEmpMonto` DOUBLE NOT NULL,
  PRIMARY KEY (`fomEmpID`),
  CONSTRAINT `fk_FomentoEmprendimiento_Estudiante1`
    FOREIGN KEY (`liderEstID`)
    REFERENCES bienestar.`Estudiante` (`estID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FomentoEmprendimiento_Docente1`
    FOREIGN KEY (`liderDocID`)
    REFERENCES bienestar.`Docente` (`docID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FomentoEmprendimiento_Estudiante1_idx` ON bienestar.`FomentoEmprendimiento` (`liderEstID` ASC) VISIBLE;

CREATE INDEX `fk_FomentoEmprendimiento_Docente1_idx` ON bienestar.`FomentoEmprendimiento` (`liderDocID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Corresponsabilidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Corresponsabilidad` ;

CREATE TABLE IF NOT EXISTS bienestar.`Corresponsabilidad` (
  `correspID` INT NOT NULL,
  `correspFecSolicitud` DATE NOT NULL,
  `correspFecLimCumplir` DATE NOT NULL,
  `correspHorAsignadas` INT NOT NULL,
  `correspHorRealizadas` INT NOT NULL,
  `gesEconID` INT NOT NULL,
  `auxEconID` INT NULL,
  `gesAlojID` INT NULL,
  `gesTranID` INT NULL,
  `fomEmpID` INT NULL,
  PRIMARY KEY (`correspID`, `gesEconID`),
  CONSTRAINT `fk_Corresponsabilidad_GestionEconomica1`
    FOREIGN KEY (`gesEconID`)
    REFERENCES bienestar.`GestionEconomica` (`gesEconoID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Corresponsabilidad_AuxilioEconomico1`
    FOREIGN KEY (`auxEconID`)
    REFERENCES bienestar.`AuxilioEconomico` (`auxEconID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Corresponsabilidad_GestionAlojamiento1`
    FOREIGN KEY (`gesAlojID`)
    REFERENCES bienestar.`GestionAlojamiento` (`gesAlojID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Corresponsabilidad_GestionTransporte1`
    FOREIGN KEY (`gesTranID`)
    REFERENCES bienestar.`GestionTransporte` (`gesTranID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Corresponsabilidad_FomentoEmprendimiento1`
    FOREIGN KEY (`fomEmpID`)
    REFERENCES bienestar.`FomentoEmprendimiento` (`fomEmpID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Corresponsabilidad_GestionEconomica1_idx` ON bienestar.`Corresponsabilidad` (`gesEconID` ASC) VISIBLE;

CREATE INDEX `fk_Corresponsabilidad_AuxilioEconomico1_idx` ON bienestar.`Corresponsabilidad` (`auxEconID` ASC) VISIBLE;

CREATE INDEX `fk_Corresponsabilidad_GestionAlojamiento1_idx` ON bienestar.`Corresponsabilidad` (`gesAlojID` ASC) VISIBLE;

CREATE INDEX `fk_Corresponsabilidad_GestionTransporte1_idx` ON bienestar.`Corresponsabilidad` (`gesTranID` ASC) VISIBLE;

CREATE INDEX `fk_Corresponsabilidad_FomentoEmprendimiento1_idx` ON bienestar.`Corresponsabilidad` (`fomEmpID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`HoraRealizada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`HoraRealizada` ;

CREATE TABLE IF NOT EXISTS bienestar.`HoraRealizada` (
  `horRealID` INT NOT NULL,
  `horRealLugar` VARCHAR(30) NOT NULL,
  `horRealFecha` DATE NOT NULL,
  `horRealActRealizada` VARCHAR(50) NOT NULL,
  `correspID` INT NOT NULL,
  `auditorID` INT NOT NULL,
  PRIMARY KEY (`horRealID`, `correspID`),
  CONSTRAINT `fk_HoraRealizada_Corresponsabilidad1`
    FOREIGN KEY (`correspID`)
    REFERENCES bienestar.`Corresponsabilidad` (`correspID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_HoraRealizada_Persona1`
    FOREIGN KEY (`auditorID`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_HoraRealizada_Corresponsabilidad1_idx` ON bienestar.`HoraRealizada` (`correspID` ASC) VISIBLE;

CREATE INDEX `fk_HoraRealizada_Persona1_idx` ON bienestar.`HoraRealizada` (`auditorID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`GestionAlimentaria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`GestionAlimentaria` ;

CREATE TABLE IF NOT EXISTS bienestar.`GestionAlimentaria` (
  `gesAlimID` INT NOT NULL,
  `gesAlimComedor` VARCHAR(10) NOT NULL,
  `gesAlimDescuento` INT NOT NULL,
  `gesAlimHorCorrespon` INT NOT NULL,
  `gesAlimBeneficio` ENUM("DESAYUNO", "ALMUERZO", "CENA") NOT NULL,
  PRIMARY KEY (`gesAlimID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`GesAlimHasCorresp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`GesAlimHasCorresp` ;

CREATE TABLE IF NOT EXISTS bienestar.`GesAlimHasCorresp` (
  `gesAlimID` INT NOT NULL,
  `correspID` INT NOT NULL,
  `desEconID` INT NOT NULL,
  PRIMARY KEY (`gesAlimID`, `correspID`, `desEconID`),
  CONSTRAINT `fk_GestionAlimentaria_has_Corresponsabilidad_GestionAlimentar1`
    FOREIGN KEY (`gesAlimID`)
    REFERENCES bienestar.`GestionAlimentaria` (`gesAlimID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GestionAlimentaria_has_Corresponsabilidad_Corresponsabilid1`
    FOREIGN KEY (`correspID` , `desEconID`)
    REFERENCES bienestar.`Corresponsabilidad` (`correspID` , `gesEconID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_GestionAlimentaria_has_Corresponsabilidad_Corresponsabil_idx` ON bienestar.`GesAlimHasCorresp` (`correspID` ASC, `desEconID` ASC) VISIBLE;

CREATE INDEX `fk_GestionAlimentaria_has_Corresponsabilidad_GestionAliment_idx` ON bienestar.`GesAlimHasCorresp` (`gesAlimID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`FallaAmilentacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`FallaAmilentacion` ;

CREATE TABLE IF NOT EXISTS bienestar.`FallaAmilentacion` (
  `fallAlimID` INT NOT NULL,
  `fallAlimFecha` DATE NOT NULL,
  `fallAlimBeneficio` ENUM("DESAYUNO", "ALMUERZO", "CENA") NOT NULL,
  `destAlim_has_Corr` INT NOT NULL,
  `correspID` INT NOT NULL,
  `gesEconID` INT NOT NULL,
  PRIMARY KEY (`fallAlimID`, `destAlim_has_Corr`, `correspID`, `gesEconID`),
  CONSTRAINT `fk_FallaAmilentacion_GestionAlimentaria_has_Corresponsabilidad1`
    FOREIGN KEY (`destAlim_has_Corr` , `correspID` , `gesEconID`)
    REFERENCES bienestar.`GesAlimHasCorresp` (`gesAlimID` , `correspID` , `desEconID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FallaAmilentacion_GestionAlimentaria_has_Corresponsabili_idx` ON bienestar.`FallaAmilentacion` (`destAlim_has_Corr` ASC, `correspID` ASC, `gesEconID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`estFormaEquipoFomEmp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`estFormaEquipoFomEmp` ;

CREATE TABLE IF NOT EXISTS bienestar.`estFormaEquipoFomEmp` (
  `FomentoEmprendimiento_idFomEmprende` INT NOT NULL,
  `estID` INT NOT NULL,
  `estRol` VARCHAR(20) NULL,
  PRIMARY KEY (`FomentoEmprendimiento_idFomEmprende`, `estID`),
  CONSTRAINT `fk_FomentoEmprendimiento_has_Estudiante_FomentoEmprendimiento1`
    FOREIGN KEY (`FomentoEmprendimiento_idFomEmprende`)
    REFERENCES bienestar.`FomentoEmprendimiento` (`fomEmpID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FomentoEmprendimiento_has_Estudiante_Estudiante1`
    FOREIGN KEY (`estID`)
    REFERENCES bienestar.`Estudiante` (`estID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FomentoEmprendimiento_has_Estudiante_Estudiante1_idx` ON bienestar.`estFormaEquipoFomEmp` (`estID` ASC) VISIBLE;

CREATE INDEX `fk_FomentoEmprendimiento_has_Estudiante_FomentoEmprendimien_idx` ON bienestar.`estFormaEquipoFomEmp` (`FomentoEmprendimiento_idFomEmprende` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`AlianzasEstrategicas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`AlianzasEstrategicas` ;

CREATE TABLE IF NOT EXISTS bienestar.`AlianzasEstrategicas` (
  `aliEstID` INT NOT NULL,
  `aliEstNombre` VARCHAR(40) NOT NULL,
  `aliEstEntidad` VARCHAR(50) NOT NULL,
  `aliEstEstado` ENUM("ACTIVO", "NO ACTIVO") NOT NULL,
  `aliEstDescripcion` VARCHAR(55) NOT NULL,
  `ConBieneUnivID` INT NOT NULL,
  PRIMARY KEY (`aliEstID`),
  CONSTRAINT `fk_AlianzasEstrategicas_ConBieneUniv1`
    FOREIGN KEY (`ConBieneUnivID`)
    REFERENCES bienestar.`ConBieneUniv` (`idConBieneUniv`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_AlianzasEstrategicas_ConBieneUniv1_idx` ON bienestar.`AlianzasEstrategicas` (`ConBieneUnivID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Programa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Programa` ;

CREATE TABLE IF NOT EXISTS bienestar.`Programa` (
  `progNombre` VARCHAR(70) NOT NULL,
  `progExtension` INT NULL,
  `progCorreoElectronico` VARCHAR(60) NULL,
  PRIMARY KEY (`progNombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table bienestar.`TorneoInterno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`TorneoInterno` ;

CREATE TABLE IF NOT EXISTS bienestar.`TorneoInterno` (
  `toridTorneoInterno` INT NOT NULL,
  `Programa_progNombre` VARCHAR(70) NOT NULL,
  `torPeriodo` VARCHAR(10) NOT NULL,
  `torSede/Facultad` VARCHAR(60) NOT NULL,
  `torDeporte` VARCHAR(35) NOT NULL,
  `torNombreTorneo` VARCHAR(90) NOT NULL,
  `torEstado` TINYINT NOT NULL,
  `torModalidad` VARCHAR(45) NULL,
  `torRama` VARCHAR(45) NOT NULL,
  `torNivel` VARCHAR(45) NULL,
  `torFechaInicio` DATE NOT NULL,
  `torFechaFinalizacion` DATE NOT NULL,
  PRIMARY KEY (`toridTorneoInterno`, `Programa_progNombre`),
  CONSTRAINT `fk_TorneoInterno_Programa1`
    FOREIGN KEY (`Programa_progNombre`)
    REFERENCES bienestar.`Programa` (`progNombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_TorneoInterno_Programa1_idx` ON bienestar.`TorneoInterno` (`Programa_progNombre` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`CursoLibre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`CursoLibre` ;

CREATE TABLE IF NOT EXISTS bienestar.`CursoLibre` (
  `cursidCursoLibre` INT NOT NULL,
  `Programa_progNombre` VARCHAR(70) NOT NULL,
  `curNombre` VARCHAR(45) NOT NULL,
  `curTipoCurso` VARCHAR(45) NOT NULL,
  `curPeriodo` VARCHAR(30) NOT NULL,
  `curCondicion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cursidCursoLibre`, `Programa_progNombre`),
  CONSTRAINT `fk_CursoLibre_Programa1`
    FOREIGN KEY (`Programa_progNombre`)
    REFERENCES bienestar.`Programa` (`progNombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_CursoLibre_Programa1_idx` ON bienestar.`CursoLibre` (`Programa_progNombre` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`ConvocatoriaSeleccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`ConvocatoriaSeleccion` ;

CREATE TABLE IF NOT EXISTS bienestar.`ConvocatoriaSeleccion` (
  `convidConvocatoriaSeleccion` INT NOT NULL,
  `convDeporte` VARCHAR(45) NOT NULL,
  `convFecha` DATETIME(5) NOT NULL,
  `convLugar` VARCHAR(50) NOT NULL,
  `convHora` TIME NOT NULL,
  `Programa_progNombre` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`convidConvocatoriaSeleccion`, `Programa_progNombre`),
  CONSTRAINT `fk_ConcocatoriaSelección_Programa1`
    FOREIGN KEY (`Programa_progNombre`)
    REFERENCES bienestar.`Programa` (`progNombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ConcocatoriaSelección_Programa1_idx` ON bienestar.`ConvocatoriaSeleccion` (`Programa_progNombre` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Evento/Taller`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Evento/Taller` ;

CREATE TABLE IF NOT EXISTS bienestar.`Evento/Taller` (
  `evetaidEvento/Taller` INT NOT NULL,
  `Programa_progNombre` VARCHAR(70) NOT NULL,
  `evetaNombre` VARCHAR(60) NOT NULL,
  `evetaTipo Evento/Taller` VARCHAR(45) NOT NULL,
  `eveDescripcion` LONGTEXT NOT NULL,
  PRIMARY KEY (`evetaidEvento/Taller`, `Programa_progNombre`),
  CONSTRAINT `fk_Evento/Taller_Programa1`
    FOREIGN KEY (`Programa_progNombre`)
    REFERENCES bienestar.`Programa` (`progNombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Evento/Taller_Programa1_idx` ON bienestar.`Evento/Taller` (`Programa_progNombre` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Proyecto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Proyecto` ;

CREATE TABLE IF NOT EXISTS bienestar.`Proyecto` (
  `proyIdProyecto` INT NOT NULL,
  `Programa_progNombre` VARCHAR(70) NOT NULL,
  `proyNombre` VARCHAR(60) NOT NULL,
  `proyEjecucion` DECIMAL NOT NULL,
  `proyFechaInicio` DATE NOT NULL,
  `proyFechaFinalizacion` DATE NOT NULL,
  `proyPresupuesto` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`proyIdProyecto`, `Programa_progNombre`),
  CONSTRAINT `fk_Proyecto_Programa1`
    FOREIGN KEY (`Programa_progNombre`)
    REFERENCES bienestar.`Programa` (`progNombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Proyecto_Programa1_idx` ON bienestar.`Proyecto` (`Programa_progNombre` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Contacto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Contacto` ;

CREATE TABLE IF NOT EXISTS bienestar.`Contacto` (
  `NombreÁrea` VARCHAR(90) NOT NULL,
  `contNombre` VARCHAR(60) NOT NULL,
  `contTelefono` INT NOT NULL,
  `contExtension` INT NOT NULL,
  `contEmail` VARCHAR(50) NOT NULL,
  `conBieneID` INT NULL,
  PRIMARY KEY (`NombreÁrea`),
  CONSTRAINT `fk_Contacto_ConBieneUniv1`
    FOREIGN KEY (`conBieneID`)
    REFERENCES bienestar.`ConBieneUniv` (`idConBieneUniv`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Contacto_ConBieneUniv1_idx` ON bienestar.`Contacto` (`conBieneID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Anexo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Anexo` ;

CREATE TABLE IF NOT EXISTS bienestar.`Anexo` (
  `anexoID` INT NOT NULL,
  `Normatividad_id` INT NOT NULL,
  `aneNombre` VARCHAR(45) NOT NULL,
  `aneLink` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`anexoID`),
  CONSTRAINT `fk_Anexos_Normatividad1`
    FOREIGN KEY (`Normatividad_id`)
    REFERENCES bienestar.`Normatividad` (`normID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Anexos_Normatividad1_idx` ON bienestar.`Anexo` (`Normatividad_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`estTieneRepEst`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`estTieneRepEst` ;

CREATE TABLE IF NOT EXISTS bienestar.`estTieneRepEst` (
  `estID` INT NOT NULL,
  `reprEstudID` INT NOT NULL,
  PRIMARY KEY (`estID`, `reprEstudID`),
  CONSTRAINT `fk_Estudiante_has_ReprEstudiantil_Estudiante1`
    FOREIGN KEY (`estID`)
    REFERENCES bienestar.`Estudiante` (`estID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estTieneRepEst_ReprEstudiantil1`
    FOREIGN KEY (`reprEstudID`)
    REFERENCES bienestar.`ReprEstudiantil` (`estID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Estudiante_has_ReprEstudiantil_Estudiante1_idx` ON bienestar.`estTieneRepEst` (`estID` ASC) VISIBLE;

CREATE INDEX `fk_estTieneRepEst_ReprEstudiantil1_idx` ON bienestar.`estTieneRepEst` (`reprEstudID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`Area_ofrece_Programa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`Area_ofrece_Programa` ;

CREATE TABLE IF NOT EXISTS bienestar.`Area_ofrece_Programa` (
  `Area_areNombre` VARCHAR(100) NOT NULL,
  `Programa_progNombre` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`Area_areNombre`, `Programa_progNombre`),
  CONSTRAINT `fk_Área_has_Programa_Área1`
    FOREIGN KEY (`Area_areNombre`)
    REFERENCES bienestar.`Area` (`areNombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Área_has_Programa_Programa1`
    FOREIGN KEY (`Programa_progNombre`)
    REFERENCES bienestar.`Programa` (`progNombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Área_has_Programa_Programa1_idx` ON bienestar.`Area_ofrece_Programa` (`Programa_progNombre` ASC) VISIBLE;

CREATE INDEX `fk_Área_has_Programa_Área1_idx` ON bienestar.`Area_ofrece_Programa` (`Area_areNombre` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table bienestar.`AntencionEnSalud`
-- -----------------------------------------------------
DROP TABLE IF EXISTS bienestar.`AntencionEnSalud` ;

CREATE TABLE IF NOT EXISTS bienestar.`AntencionEnSalud` (
  `Persona_id` INT NOT NULL,
  `ateFecha` DATETIME NOT NULL,
  `ateSoporteDireccion` VARCHAR(32) NOT NULL,
  `ateVerificado` BIT NOT NULL,
  CONSTRAINT `fk_table1_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES bienestar.`Persona` (`perID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_table1_Persona1_idx` ON bienestar.`AntencionEnSalud` (`Persona_id` ASC) VISIBLE;

USE bienestar ;