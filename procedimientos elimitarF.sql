
USE Somawoodma;


DELIMITER ;
DROP PROCEDURE if exists eliminar_modelo;
DELIMITER //

#Editar Modelo
CREATE PROCEDURE eliminar_modelo (
	IN p_ID_Mod INT
)
BEGIN
    
	DELETE FROM  Modelo   WHERE ID_Mod = p_ID_Mod;
		
END //


DELIMITER ;
DROP PROCEDURE if exists eliminar_maquina;
DELIMITER //

#Editar Maquina
CREATE PROCEDURE eliminar_maquina (
	IN p_ID_MAQ int
)
BEGIN

	DELETE FROM Maquina  WHERE ID_MAQ = p_ID_MAQ;
			
END //

 
DELIMITER ;
DROP PROCEDURE if exists eliminar_cliente;
DELIMITER //

#Editar Cliente
CREATE PROCEDURE eliminar_cliente (
	In p_ID_Cte int
)
BEGIN

	DELETE FROM Cliente WHERE ID_Cte = p_ID_Cte;
			
END //


DELIMITER ;
DROP PROCEDURE if exists eliminar_empleado;
DELIMITER //

#Editar Empleado
CREATE PROCEDURE eliminar_empleado (
	IN p_CURP varchar (50)
)
BEGIN
    
	DELETE FROM Empleado  WHERE CURP LIKE p_CURP;
			
END //

#REVISAR
DELIMITER ;
DROP PROCEDURE if exists eliminar_domicilio;
DELIMITER //

#Agregar domicilio
CREATE PROCEDURE eliminar_domicilio (
	IN ID_Dom int
)
BEGIN
    
	DELETE FROM Domicilio where ID_Dom = p_ID_Dom;
		
END //



DELIMITER ;
DROP PROCEDURE if exists ieliminar_documento;
DELIMITER //

#Agregar Documento
CREATE PROCEDURE eliminar_documento (
	IN p_ID_Doc int
)
BEGIN
    
    DELETE FROM Documento WHERE ID_Doc = p_ID_Doc;
    
END //



DELIMITER ;
DROP PROCEDURE if exists eliminar_reporte;
DELIMITER //

#Agregar Documento
CREATE PROCEDURE eliminar_reporte (
	IN p_ID_Rep int
)
BEGIN
    
    DELETE FROM Reporte WHERE ID_Rep = p_ID_Rep;
   
END //

