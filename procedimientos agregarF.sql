use Somawoodma;

DELIMITER ;
DROP PROCEDURE  if exists agregar_modelo;
DELIMITER //

#Agregar Modelo
CREATE PROCEDURE agregar_modelo (
	IN p_NombreM varchar(50),
	IN p_Distribuidor varchar(50),
	IN p_Caract varchar(60)
)
BEGIN
    DECLARE existe_Mod INT;
    DECLARE id INT;

    SELECT COUNT(*) INTO existe_Mod FROM Modelo WHERE NombreM = p_NombreM;

    IF existe_Mod = 0 THEN 
		INSERT INTO Modelo ( NombreM, Distribuidor, Caract)
		VALUES ( p_NombreM, p_Distribuidor, p_Caract);
		SET id = 0;
    ELSE 
        SET id = 1;
    END IF;
    SELECT * from Modelo;
END //



DELIMITER ;
DROP PROCEDURE if exists agregar_maquina;

DELIMITER //

CREATE PROCEDURE agregar_maquina (
	IN p_codigoM int,
    IN p_ID_Mod INT,
    IN p_Funcion VARCHAR(100),
    IN p_Estado VARCHAR(60),
    IN p_Marca VARCHAR(60)
)
BEGIN
    DECLARE existe_Mod INT;
    DECLARE idQ INT;
    
    SELECT COUNT(*) INTO existe_Mod FROM Modelo WHERE ID_Mod = p_ID_Mod;
    
    IF existe_Mod > 0 THEN
        INSERT INTO Maquina (codigoM,ID_Mod, Funcion, Estado, Marca)
        VALUES (p_codigoM,p_ID_Mod, p_Funcion, p_Estado, p_Marca);
        
        SELECT LAST_INSERT_ID() AS id_maq;
    ELSE
        SELECT -1 AS id_maq;
    END IF;
    SELECT * FROM Maquina;
END //

DELIMITER ;



DELIMITER ;
DROP PROCEDURE if exists agregar_cliente;
DELIMITER //

#Agregar Cliente
CREATE PROCEDURE agregar_cliente (
	IN p_id_dom int,
	IN p_ApePatC varchar(50),
	IN p_ApeMatC varchar(50),
	IN p_NombreC varchar(50),
	IN p_Empresa varchar(50),
    IN p_TelefonoC varchar (30),
    IN p_correo_electronicoC varchar (50)
)
BEGIN
    DECLARE existe_Cte INT;
    DECLARE id INT;

    SELECT COUNT(*) INTO existe_Cte FROM Cliente WHERE ApePatC = p_ApePatC AND ApeMatC = p_ApeMatC;

	IF existe_Cte = 0 THEN
			INSERT INTO Cliente (id_dom,ApePatC, ApeMatC, NombreC, Empresa, telefonoC, correo_electronicoC)
			VALUES (p_id_dom,p_ApePatC, p_ApeMatC, p_NombreC, p_Empresa, p_telefonoC, p_correo_electronicoC);
			SET id = 0;
	ELSE
		SET id = 1;
	END IF;
    SELECT * from Cliente;
END //


DELIMITER ;
DROP PROCEDURE if exists agregar_empleado;
DELIMITER //

#Agregar Empleado
CREATE PROCEDURE agregar_empleado (
	 
	IN p_CURP VARCHAR(30),
    IN p_ID_Dom int,
	IN p_ApePatE varchar(50),
	IN p_ApeMatE varchar(50),
	IN p_NombreE varchar(50), 
    IN p_Sucursal varchar (50),
    IN p_TelefonoE varchar(30),
    IN p_correo_electronicoE varchar(50),
    IN p_FechaNam date
)
BEGIN
    DECLARE existe_Edo INT;
    DECLARE id INT;

    SELECT COUNT(*) INTO existe_Edo FROM Empleado WHERE CURP = p_CURP;

	IF existe_Edo = 0 THEN
			INSERT INTO Empleado (CURP,ID_DOM,ApePatE, ApeMatE, NombreE, Sucursal, TelefonoE, correo_electronicoE, FechaNam)
			VALUES (p_CURP,p_ID_Dom,p_ApePatE, p_ApeMatE, p_NombreE, p_Sucursal, p_TelefonoE, p_correo_electronicoE, p_FechaNam);
			SET id = 0;
	ELSE
		SET id = 1;
	END IF;
    SELECT * from Empleado;
END //


DELIMITER ;
DROP PROCEDURE if exists agregar_domicilio;
DELIMITER //

#Agregar Domicilio
CREATE PROCEDURE agregar_domicilio (
	IN p_Ciudad varchar(50),
	IN p_Municipio varchar (50),
	IN p_Colonia varchar (50),
	IN p_Calle varchar (50),
	IN p_Numero Varchar(25),
	IN p_CP varchar (25)
)
BEGIN
    
   
	INSERT INTO Domicilio (Ciudad, Municipio, Colonia, Calle, Numero,CP)
	VALUES (p_Ciudad, p_Municipio, p_Colonia, p_Calle, p_Numero,p_CP);
	
   
END //


DELIMITER ;
DROP PROCEDURE if exists agregar_documento;
DELIMITER //

#Agregar Documento
CREATE PROCEDURE agregar_documento (
	IN p_ID_Maq int,
	IN p_ID_Cte int,
	IN p_CURP varchar(30),
	IN p_HorasUso time,
	IN p_Descripcion varchar(50),
	IN p_Preventivo varchar(10),
	IN p_Correctivo varchar(10),
	IN p_Instalacion varchar(10),
	IN p_Garantia varchar(10),
	IN p_FechInicio date,
	IN p_ComentarioC varchar(500)
)
BEGIN

	INSERT INTO Documento (ID_Maq, ID_Cte, CURP, HorasUso, Descripcion, Preventivo, Correctivo, Instalacion, Garantia, FechInicio, ComentarioC)
	VALUES (p_ID_Maq, p_ID_Cte, p_CURP, p_HorasUso, p_Descripcion, p_Preventivo, p_Correctivo, p_Instalacion, p_Garantia, p_FechInicio, p_ComentarioC);
			
    SELECT * from Sucursal;
END //



DELIMITER ;
DROP PROCEDURE if exists agregar_reporte;
DELIMITER //

#Agregar Reporte
CREATE PROCEDURE agregar_reporte (
    IN p_ID_Doc int,
	IN p_FechFin date,
	IN p_ComentarioT Varchar(500)
)
BEGIN
    DECLARE existe_rep INT;
    DECLARE existe_doc INT;
    DECLARE idR INT;
    DECLARE id INT;

    SELECT COUNT(*) INTO existe_rep FROM reporte WHERE ID_Doc = p_ID_Doc;
    SELECT COUNT(*) INTO existe_doc FROM Documento WHERE ID_Doc = p_ID_Doc;

    IF existe_rep > 0 THEN
		IF existe_doc = 0 THEN
				INSERT INTO Reporte (ID_Doc, FechFin, ComentarioT)
				VALUES (p_ID_Doc, p_FechFin, p_ComentarioT);
				SET idR = 0;
		ELSE
			SET idR = 1;
		END IF;
	ELSE
		SET id = 2;
	END IF;
    SELECT * from Maquina;
END //