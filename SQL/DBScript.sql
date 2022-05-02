--Creo las tablas necesarias para la DB.
CREATE TABLE Tanque(
Tn_CodigoTanq char(1) PRIMARY KEY NOT NULL,
Tn_Lleno money NOT NULL,
Tn_3_4 money NOT NULL,
Tn_Medio money NOT NULL,
Tn_1_4 money NOT NULL
);

CREATE TABLE Categoria(
Ca_codicate char(1) PRIMARY KEY NOT NULL,
Ca_descate varchar(25) NOT NULL,
Ca_valorkilo money NOT NULL,
Ca_valordia money NOT NULL,
Ca_valormes money NOT NULL
);

CREATE TABLE Usuario(
U_Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
U_Nombre varchar(20) NOT NULL,
U_Apellido varchar(20) NOT NULL,
U_Direccion varchar(20) NOT NULL,
U_Telefono INT NOT NULL
);

CREATE TABLE Pago(
P_Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
P_ValorPago money NOT NULL,
P_FechaPago DATETIME NOT NULL
);

GO

--Creo las tablas que se relacionan.
CREATE TABLE Vehiculo(
Ve_Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
CaCodicate char(1) NOT NULL,
CodigoTanq char(1) NOT NULL,
Ve_placa char(10) NOT NULL,
Ve_marca varchar(20) NOT NULL,
Ve_modelo INT NOT NULL,
Ve_Estado Bit NOT NULL,
Ve_Foto varchar(40) NOT NULL,
CONSTRAINT PK_Vehiculo_CaCodicate FOREIGN KEY (CaCodicate) REFERENCES Categoria (Ca_codicate),
CONSTRAINT PK_Vehiculo_CodigoTanq FOREIGN KEY (CodigoTanq) REFERENCES Tanque (Tn_CodigoTanq)
);

GO

CREATE TABLE Contrato(
C_Id INT NOT NULL IDENTITY(1,1),
PagoId Int NOT NULL,
UsuarioId INT NOT NULL,
VehiculoId INT NOT NULL,
C_FechaEntrada DATETIME NOT NULL,
C_FechaSalida DATETIME NOT NULL,
C_Liquidacion money NOT NULL,
CONSTRAINT PK_PagoId FOREIGN KEY (PagoId) REFERENCES Pago (P_Id),
CONSTRAINT PK_UsuarioId FOREIGN KEY (UsuarioId) REFERENCES Usuario (U_Id),
CONSTRAINT fk_VehiculoId FOREIGN KEY (VehiculoId) REFERENCES Vehiculo (Ve_Id)
);

GO

--Inserto la Data en las tablas creadas.
INSERT INTO Tanque(Tn_CodigoTanq,Tn_Lleno,Tn_3_4,Tn_Medio,Tn_1_4) VALUES ('a',65000,59000,32500,16250);
INSERT INTO Tanque(Tn_CodigoTanq,Tn_Lleno,Tn_3_4,Tn_Medio,Tn_1_4) VALUES ('b',60000,50000,30000,15250);

INSERT INTO Categoria(Ca_codicate,Ca_descate,Ca_valorkilo,Ca_valordia,Ca_valormes) VALUES('a','Nombre1',4500,30000,19000);
INSERT INTO Categoria(Ca_codicate,Ca_descate,Ca_valorkilo,Ca_valordia,Ca_valormes) VALUES('b','Nombre2',7800,67000,22000);

INSERT INTO Usuario(U_Nombre,U_Apellido,U_Direccion,U_Telefono) VALUES ('John Mario','Mayorga Forero','CL 92 Sur # 14A - 78',7688953);
INSERT INTO Usuario(U_Nombre,U_Apellido,U_Direccion,U_Telefono) VALUES ('Juana María','Ariztizabal Garzón','CL 134 # 7 - 34',1232709);

INSERT INTO Pago(P_ValorPago,P_FechaPago) VALUES (750000,'2019-08-18');
INSERT INTO Pago(P_ValorPago,P_FechaPago) VALUES (920000,'2019-08-19');

INSERT INTO Vehiculo(CaCodicate,CodigoTanq,Ve_placa,Ve_marca,Ve_modelo,Ve_Estado,Ve_Foto) VALUES ('a','a','ABC-123','Ford',2018,1,'D://Desktop/MiCarrito.jpeg');
INSERT INTO Vehiculo(CaCodicate,CodigoTanq,Ve_placa,Ve_marca,Ve_modelo,Ve_Estado,Ve_Foto) VALUES ('b','b','DEF-456','Mazda',2019,1,'D://Desktop/ElMazda.png');

INSERT INTO Contrato(PagoId,UsuarioId,VehiculoId,C_FechaEntrada,C_FechaSalida,C_Liquidacion) VALUES (1,1,1,'2019/08/16','2019/08/18',750000);
INSERT INTO Contrato(PagoId,UsuarioId,VehiculoId,C_FechaEntrada,C_FechaSalida,C_Liquidacion) VALUES (2,2,2,'2019/08/14','2019/08/16',920000);

GO
