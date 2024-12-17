drop database somawoodma;

create database Somawoodma;

use Somawoodma;

create table Modelo (
    ID_Mod int auto_increment primary key,
    NombreM varchar(50),
    Distribuidor varchar(50),
    Caract varchar(60)
);

create table Maquina (
	ID_Maq int auto_increment primary key,
    CodigoM int ,
    ID_Mod int,
    Funcion varchar(100),
    Estado varchar(60),
    Marca varchar(60)
);

create table Domicilio (
    ID_Dom int auto_increment primary key,
    Ciudad varchar(50),
    Municipio varchar(50),
    Colonia varchar(50),
    Calle varchar(50),
    Numero Varchar(25),
    CP Varchar(25)
);

create table Cliente (
    ID_Cte int auto_increment primary key,
    ID_Dom int,
    ApePatC varchar(50),
    ApeMatC varchar(50),
    NombreC varchar(50),
    Empresa varchar(50),
    telefonoC varchar(30),
    correo_electronicoC varchar(50),
    foreign key (ID_Dom) references Domicilio (ID_Dom)
);

create table Empleado (
    CURP VARCHAR(30) primary key,
    id_dom int,
    ApePatE varchar(50),
    ApeMatE varchar(50),
    NombreE varchar(50),
    Sucursal varchar(50),
    telefonoE varchar(30),
    correo_electronicoE varchar(50),
    FechaNam date,
     foreign key (ID_Dom) references Domicilio (ID_Dom)
);


create table Documento (
    ID_Doc int auto_increment primary key,
    ID_Maq int,
    ID_Cte int,
    CURP varchar(30),
    HorasUso time,
    Descripcion varchar(500),
    Preventivo varchar(10),
    Correctivo varchar(10),
    Instalacion varchar(10),
    Garantia varchar(10),
    FechInicio date,
    ComentarioC varchar(500),
    foreign key (ID_Maq) references Maquina (ID_Maq),
    foreign key (ID_Cte) references Cliente (ID_Cte),
    foreign key (CURP) references Empleado (CURP)
);

create table Reporte (
    ID_Rep int auto_increment primary key,
    ID_Doc int,
    FechFin date,
    ComentarioT Varchar(500),
    foreign key (ID_Doc) references Documento (ID_Doc)
);

create table RelCteMaq (
    ID_Rcm int auto_increment primary key,
    ID_Cte int,
    id_maq int,
    foreign key (ID_Cte) references Cliente (ID_Cte),
    foreign key (id_maq) references Maquina (id_maq)
);

CREATE VIEW vista_cliente_domicilio AS
SELECT cliente.*, cliente.`ID_Cte` as id, domicilio.`Ciudad`, domicilio.`CP`, domicilio.`Calle`, domicilio.`Colonia`, domicilio.`Municipio`, domicilio.`Numero`, domicilio.`ID_Dom` AS idDom
FROM cliente
    INNER JOIN domicilio ON cliente.id_dom = domicilio.id_dom;

#DROP VIEW vista_cliente_domicilio;




CREATE VIEW vista_empleado_domicilio AS
SELECT empleado.*, empleado.`CURP` as id, domicilio.`Ciudad`, domicilio.`CP`, domicilio.`Calle`, domicilio.`Colonia`, domicilio.`Municipio`, domicilio.`Numero`, domicilio.`ID_Dom` AS idDom
FROM empleado
    left JOIN domicilio ON empleado.id_dom = domicilio.id_dom;

#DROP VIEW vista_empleado_domicilio;