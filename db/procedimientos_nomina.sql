CREATE PROCEDURE InformacionCompletaEmpleados
AS
BEGIN
    SELECT p.Id_Cedula, p.Nombre_Apellidos, p.Cargo_Empl, c.nombre AS Cargo, p.Dpto_Area, d.nombre AS Departamento, p.Salario, p.Sub_Tpte, p.Gastos_Rep, 
           p.Sobresueldo, p.Viaticos, p.Comisiones, p.Primas, tc.nombre AS Tipo_Contrato, cb.nombre AS Tipo_Cuenta_Bancaria, p.Eps_Salud, p.Pension, 
           p.Fdo_Sol, p.Fecha_Ingreso, p.Fecha_Retiro
    FROM Personal p
    LEFT JOIN Cargo c ON p.id_cargo = c.id_cargo
    LEFT JOIN Departamento d ON p.id_dpto = d.id_dpto
    LEFT JOIN Tipo_Contrato tc ON p.id_TipoCont = tc.id_TipoCont
    LEFT JOIN Tipo_Cuenta_Bancaria cb ON p.id_Ctabanco = cb.id_Ctabanco
END;


CREATE PROCEDURE InformacionDevengadosEmpleados
AS
BEGIN
	SELECT dvg.Id_Devengado, dvg.Id_Cedula, p.Nombre_Apellidos AS Nombre_Empleado, dvg.Concepto, dvg.Salario, dvg.Sub_Tpte, dvg.Gastos_Rep, 
			   dvg.Sobresueldo, dvg.Viaticos, dvg.Comisiones, dvg.Primas
	FROM Devengados dvg
	INNER JOIN Personal p ON dvg.Id_Cedula = p.Id_Cedula
END



CREATE PROCEDURE InformacionDescuentosEmpleados
AS
BEGIN
	SELECT dsc.Id_Descuento, dsc.Id_Cedula, p.Nombre_Apellidos AS Nombre_Empleado, dsc.Concepto, dsc.Eps_Salud, dsc.Pension, 
           dsc.Fdo_Sol, dsc.Bancos, dsc.Fondo_Empleados
    FROM Descuentos dsc
    INNER JOIN Personal p ON dsc.Id_Cedula = p.Id_Cedula
END


CREATE PROCEDURE [dbo].[DevengosTotalesPorEmpleado]
AS
BEGIN
    SELECT Id_Cedula, 
           Salario + Sub_Tpte + Gastos_Rep + Sobresueldo + Viaticos + Comisiones + Primas AS TotalDevengos,
           Nombre_Apellidos AS Nombre_Empleado
    FROM Personal;
END;


CREATE PROCEDURE [dbo].[DescuentosTotalesPorEmpleado]
AS
BEGIN
    SELECT Id_Cedula, 
           Eps_Salud + Pension + Fdo_Sol AS TotalDescuentos,
           Nombre_Apellidos AS Nombre_Empleado
    FROM Personal;
END;


CREATE PROCEDURE MostrarPrimasOrdenadas
AS
BEGIN
    SELECT Id_Cedula, Nombre_Apellidos AS Nombre_Empleado, Primas
    FROM Personal
    ORDER BY Primas DESC;
END;


CREATE PROCEDURE MostrarMayoresSueldos
AS
BEGIN
    SELECT Id_Cedula, Nombre_Apellidos AS Nombre_Empleado, Salario
    FROM Personal
    ORDER BY Salario DESC;
END;



INSERT INTO Personal (Id_Cedula, Nombre_Apellidos, Cargo_Empl, id_cargo, Dpto_Area, id_dpto, Salario, Sub_Tpte, Gastos_Rep, Sobresueldo, Viaticos, Comisiones, Primas, Tipo_Contr, id_TipoCont, Cta_Banco, id_Ctabanco, Eps_Salud, Pension, Fdo_Sol, Fecha_Ingreso, Fecha_Retiro) VALUES
(54321, 'Ana Gómez', 'Analista', 2, 'Ventas', 1, 48000.00, 1800.00, 550.00, 900.00, 700.00, 1300.00, 280.00, 'Indefinido', 1, '1357924680', 1, 110.00, 45.00, 25.00, '2019-12-05', NULL),
(98765, 'Carlos Martínez', 'Asistente', 3, 'Recursos Humanos', 2, 32000.00, 1400.00, 420.00, 750.00, 600.00, 1100.00, 220.00, 'Temporal', 2, '2468013579', 2, 85.00, 35.00, 18.00, '2022-05-10', NULL),
(13579, 'Luisa Sánchez', 'Analista', 2, 'Finanzas', 3, 42000.00, 1600.00, 500.00, 850.00, 650.00, 1250.00, 260.00, 'Indefinido', 1, '9876543210', 1, 95.00, 42.00, 22.00, '2020-08-20', NULL),
(24680, 'Pedro López', 'Asistente', 3, 'Ventas', 1, 30000.00, 1200.00, 380.00, 700.00, 550.00, 1000.00, 200.00, 'Temporal', 2, '0123456789', 2, 75.00, 30.00, 15.00, '2023-01-30', NULL),
(11111, 'Laura Fernandez', 'Gerente', 1, 'Recursos Humanos', 2, 55000.00, 2200.00, 600.00, 1200.00, 1000.00, 1800.00, 350.00, 'Indefinido', 1, '1112223334', 1, 120.00, 60.00, 30.00, '2018-10-12', NULL),
(22222, 'Roberto Castro', 'Analista', 2, 'Finanzas', 3, 38000.00, 1500.00, 450.00, 800.00, 600.00, 1150.00, 240.00, 'Temporal', 2, '4445556667', 2, 88.00, 38.00, 20.00, '2021-07-25', NULL),
(33333, 'Marcela Ramirez', 'Gerente', 1, 'Ventas', 1, 60000.00, 2500.00, 700.00, 1400.00, 1200.00, 2000.00, 400.00, 'Indefinido', 1, '7778889990', 1, 130.00, 70.00, 35.00, '2019-03-18', NULL),
(44444, 'Sofia Herrera', 'Asistente', 3, 'Recursos Humanos', 2, 28000.00, 1100.00, 350.00, 650.00, 500.00, 900.00, 180.00, 'Temporal', 2, '0001112223', 2, 70.00, 28.00, 14.00, '2020-12-08', NULL);
