USE Somawoodma;

DELIMITER ;
DROP PROCEDURE if exists editar_modelo;

DELIMITER //

#Editar Modelo
CREATE PROCEDURE editar_modelo (
	IN p_ID_Mod INT,
    IN p_NombreM varchar(50),
	IN p_Distribuidor varchar(50),
	IN p_Caract varchar(60)
)
BEGIN
   
	UPDATE Modelo SET NombreM = p_NombreM, Distribuidor = p_Distribuidor, Caract = p_Caract  WHERE ID_Mod = p_ID_Mod;
		
END //

DELIMITER;

DROP PROCEDURE if exists editar_maquina;

DELIMITER //

#Editar Maquina
CREATE PROCEDURE editar_maquina (
	IN p_ID_Maq int,
    IN p_CodigoM int,
	IN p_ID_Mod int ,
	IN p_Funcion varchar (100),
	IN p_Estado varchar(60),
	IN p_Marca varchar (60)
)
BEGIN
    
	UPDATE Maquina SET CodigoM = p_CodigoM, ID_Mod = p_ID_Mod,  Funcion = p_Funcion, Estado = p_Estado, Marca = p_Marca  WHERE ID_Maq = p_ID_Maq;
		
END //

DELIMITER;

DROP PROCEDURE if exists editar_cliente;

DELIMITER //

#Editar Cliente
CREATE PROCEDURE editar_cliente (
	IN p_ID_Cte int,
    IN p_ApePatC varchar(50),
	IN p_ApeMatC varchar(50),
	IN p_NombreC varchar(50),
	IN p_Empresa varchar(50),
    IN p_TelefonoC varchar (30),
    IN p_correo_electronicoC varchar (50)
)
BEGIN
   
		UPDATE Cliente SET ApePatC = p_ApePatC, ApeMatC = p_ApeMatC, NombreC = p_NombreC, Empresa = p_Empresa, TelefonoC = p_TelefonoC, correo_electronicoC = p_correo_electronicoC  WHERE ID_Cte = p_ID_Cte;
		
END //

DELIMITER;

DROP PROCEDURE if exists editar_empleado;

DELIMITER //

#Editar Empleado
CREATE PROCEDURE editar_empleado (
	IN p_CURP_Bsq VARCHAR(30),
    IN p_CURP VARCHAR(30),
    IN P_ID_DOM int,
	IN p_ApePatE varchar(50),
	IN p_ApeMatE varchar(50),
	IN p_NombreE varchar(50), 
    IN p_Sucursal varchar (50),
    IN p_TelefonoE varchar(30),
    IN p_correo_electronicoE varchar(50),
    IN p_FechaNam date
)
BEGIN
    
	UPDATE Empleado 
	SET  id_dom = p_id_dom, ApePatE = p_ApePatE, ApeMatE = p_ApeMatE, NombreE = p_NombreE, Sucursal = p_Sucursal, TelefonoE = p_TelefonoE, correo_electronicoE = p_correo_electronicoE, FechaNam = p_FechaNam  
	WHERE CURP = p_CURP;
			
END //

DELIMITER;

DROP PROCEDURE if exists editar_domicilio;
DELIMITER //

CREATE PROCEDURE editar_domicilio (
    IN id INT,
    IN p_Ciudad VARCHAR(50),
    IN p_Municipio VARCHAR(50),
    IN p_Colonia VARCHAR(50),
    IN p_Calle VARCHAR(50),
    IN p_Numero VARCHAR(25),
    IN p_CP VARCHAR(25)
)
BEGIN
    UPDATE Domicilio
    SET Ciudad = p_Ciudad,
        Municipio = p_Municipio, 
        Colonia = p_Colonia,
        Calle = p_Calle, 
        Numero = p_Numero, 
        CP = p_CP 
    WHERE ID_Dom = id;
END //

DELIMITER ;

UPDATE Domicilio
SET
    Ciudad = "p_Ciudad",
    Municipio = "p_Municipio",
    Colonia = "p_Colonia",
    Calle = "p_Calle",
    Numero = "p_Numero",
    CP = "p_CP"
where
    ID_Dom = 1;

DELIMITER ;

DROP PROCEDURE if exists editar_documento;

DELIMITER //

#Agregar Documento
CREATE PROCEDURE editar_documento (
	IN p_ID_Doc int,
    IN p_CodigoM int,
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
    
    UPDATE Documento SET CodigoM = p_CodigoM, ID_Cte = p_ID_Cte, CURP = p_CURP , HorasUso = p_HorasUso, Descripcion = p_Descripcion, Preventivo = p_Preventivo, 
    Correctivo = p_Correctivo, Instalacion = p_Instalacion, Garantia = p_Instalacion, FechInicio = p_FechInicio , ComentarioC = p_ComentarioC WHERE ID_Doc = p_ID_Doc;
    
    SELECT * from Documento;
END //

DELIMITER;

DROP PROCEDURE if exists editar_reporte;

DELIMITER //

#Agregar domicilio
CREATE PROCEDURE editar_reporte (
	IN p_ID_Rep int,
    IN p_ID_Doc int,
	IN FechFin date,
	IN ComentarioT Varchar(500)
)
BEGIN
    
		UPDATE Domicilio SET ID_Doc = p_ID_Doc, FechFin = p_FechFin, ComentarioT = p_ComentarioT where ID_Rep = p_ID_Rep;
		
	
    SELECT * from Maquina;
END //