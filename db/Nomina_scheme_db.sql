CREATE DATABASE nomina;
USE nomina;


-- Creación de la tabla Personal
CREATE TABLE Personal (
    Id_Cedula INT PRIMARY KEY,
    Nombre_Apellidos VARCHAR(255),
    Cargo_Empl VARCHAR(255),
    id_cargo INT,
    Dpto_Area VARCHAR(255),
    id_dpto INT,
    Salario DECIMAL(10, 2),
    Sub_Tpte DECIMAL(10, 2),
    Gastos_Rep DECIMAL(10, 2),
    Sobresueldo DECIMAL(10, 2),
    Viaticos DECIMAL(10, 2),
    Comisiones DECIMAL(10, 2),
    Primas DECIMAL(10, 2),
    Tipo_Contr VARCHAR(255),
    id_TipoCont INT,
    Cta_Banco VARCHAR(255),
    id_Ctabanco INT,
    Eps_Salud DECIMAL(10, 2),
    Pension DECIMAL(10, 2),
    Fdo_Sol DECIMAL(10, 2),
    Fecha_Ingreso DATE,
    Fecha_Retiro DATE
);

-- Creación de la tabla Cargo
CREATE TABLE Cargo (
    id_cargo INT PRIMARY KEY,
    nombre VARCHAR(255)
);

-- Creación de la tabla Departamento
CREATE TABLE Departamento (
    id_dpto INT PRIMARY KEY,
    nombre VARCHAR(255)
);

-- Creación de la tabla Devengados
CREATE TABLE Devengados (
    Id_Devengado INT PRIMARY KEY,
    Id_Cedula INT,
    Concepto VARCHAR(255),
    Salario DECIMAL(10, 2),
    Sub_Tpte DECIMAL(10, 2),
    Gastos_Rep DECIMAL(10, 2),
    Sobresueldo DECIMAL(10, 2),
    Viaticos DECIMAL(10, 2),
    Comisiones DECIMAL(10, 2),
    Primas DECIMAL(10, 2),
    FOREIGN KEY (Id_Cedula) REFERENCES Personal(Id_Cedula)
);

-- Creación de la tabla Descuentos
CREATE TABLE Descuentos (
    Id_Descuento INT PRIMARY KEY,
    Id_Cedula INT,
    Concepto VARCHAR(255),
    Eps_Salud DECIMAL(10, 2),
    Pension DECIMAL(10, 2),
    Fdo_Sol DECIMAL(10, 2),
    Bancos DECIMAL(10, 2),
    Fondo_Empleados DECIMAL(10, 2),
    FOREIGN KEY (Id_Cedula) REFERENCES Personal(Id_Cedula)
);

-- Creación de la tabla Tipo_Contrato
CREATE TABLE Tipo_Contrato (
    id_TipoCont INT PRIMARY KEY,
    nombre VARCHAR(255)
);

-- Creación de la tabla Tipo_Cuenta_Bancaria
CREATE TABLE Tipo_Cuenta_Bancaria (
    id_Ctabanco INT PRIMARY KEY,
    nombre VARCHAR(255)
);

-- Creación de la tabla Nomina
CREATE TABLE Nomina (
    id_nomina INT PRIMARY KEY,
    Fecha_Periodo DATE
);

-- Creación de la tabla Nomina_Empleado (Tabla intermedia)
CREATE TABLE Nomina_Empleado (
    id_nomina INT,
    Id_Cedula INT,
    Salario_bruto DECIMAL(10, 2),
    -- Otros atributos relacionados con la nómina y el empleado
    PRIMARY KEY (id_nomina, Id_Cedula),
    FOREIGN KEY (id_nomina) REFERENCES Nomina(id_nomina),
    FOREIGN KEY (Id_Cedula) REFERENCES Personal(Id_Cedula)
);

-- Definición de las relaciones entre las tablas
ALTER TABLE Personal
ADD CONSTRAINT FK_Cargo FOREIGN KEY (id_cargo) REFERENCES Cargo(id_cargo);
ALTER TABLE Personal
ADD CONSTRAINT FK_Departamento FOREIGN KEY (id_dpto) REFERENCES Departamento(id_dpto);
ALTER TABLE Personal
ADD CONSTRAINT FK_TipoContrato FOREIGN KEY (id_TipoCont) REFERENCES Tipo_Contrato(id_TipoCont);
ALTER TABLE Personal
ADD CONSTRAINT FK_CuentaBancaria FOREIGN KEY (id_Ctabanco) REFERENCES Tipo_Cuenta_Bancaria(id_Ctabanco);

SELECT * FROM PERSONAL;



-- Llenar la tabla Cargo
INSERT INTO Cargo (id_cargo, nombre) VALUES
(1, 'Gerente'),
(2, 'Analista'),
(3, 'Asistente');

-- Llenar la tabla Departamento
INSERT INTO Departamento (id_dpto, nombre) VALUES
(1, 'Ventas'),
(2, 'Recursos Humanos'),
(3, 'Finanzas');

-- Llenar la tabla Tipo_Contrato
INSERT INTO Tipo_Contrato (id_TipoCont, nombre) VALUES
(1, 'Indefinido'),
(2, 'Temporal');

-- Llenar la tabla Tipo_Cuenta_Bancaria
INSERT INTO Tipo_Cuenta_Bancaria (id_Ctabanco, nombre) VALUES
(1, 'Corriente'),
(2, 'Ahorros');

-- Llenar la tabla Personal
INSERT INTO Personal (Id_Cedula, Nombre_Apellidos, Cargo_Empl, id_cargo, Dpto_Area, id_dpto, Salario, Sub_Tpte, Gastos_Rep, Sobresueldo, Viaticos, Comisiones, Primas, Tipo_Contr, id_TipoCont, Cta_Banco, id_Ctabanco, Eps_Salud, Pension, Fdo_Sol, Fecha_Ingreso, Fecha_Retiro) VALUES
(12345, 'Juan Pérez', 'Gerente', 1, 'Ventas', 1, 50000.00, 2000.00, 500.00, 1000.00, 800.00, 1500.00, 300.00, 'Indefinido', 1, '1234567890', 1, 100.00, 50.00, 20.00, '2020-01-15', NULL),
(67890, 'María Rodriguez', 'Analista', 2, 'Recursos Humanos', 2, 35000.00, 1500.00, 400.00, 800.00, 700.00, 1200.00, 250.00, 'Temporal', 2, '0987654321', 2, 90.00, 40.00, 15.00, '2021-03-20', NULL);

-- Llenar la tabla Devengados
INSERT INTO Devengados (Id_Devengado, Id_Cedula, Concepto, Salario, Sub_Tpte, Gastos_Rep, Sobresueldo, Viaticos, Comisiones, Primas) VALUES
(1, 12345, 'Devengado 1', 50000.00, 2000.00, 500.00, 1000.00, 800.00, 1500.00, 300.00),
(2, 67890, 'Devengado 2', 35000.00, 1500.00, 400.00, 800.00, 700.00, 1200.00, 250.00);

-- Llenar la tabla Descuentos
INSERT INTO Descuentos (Id_Descuento, Id_Cedula, Concepto, Eps_Salud, Pension, Fdo_Sol, Bancos, Fondo_Empleados) VALUES
(1, 12345, 'Descuento 1', 100.00, 50.00, 20.00, 30.00, 10.00),
(2, 67890, 'Descuento 2', 90.00, 40.00, 15.00, 25.00, 8.00);

-- Llenar la tabla Nomina
INSERT INTO Nomina (id_nomina, Fecha_Periodo) VALUES
(1, '2023-09-01'),
(2, '2023-09-15');

-- Llenar la tabla Nomina_Empleado
INSERT INTO Nomina_Empleado (id_nomina, Id_Cedula, Salario_bruto) VALUES
(1, 12345, 50000.00),
(1, 67890, 35000.00),
(2, 12345, 50000.00),
(2, 67890, 35000.00);


