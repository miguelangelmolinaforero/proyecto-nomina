ALTER PROCEDURE InformacionCompletaEmpleados
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


ALTER PROCEDURE [dbo].[DevengosTotalesPorEmpleado]
AS
BEGIN
    SELECT Id_Cedula, 
           Salario + Sub_Tpte + Gastos_Rep + Sobresueldo + Viaticos + Comisiones + Primas AS TotalDevengos,
           Nombre_Apellidos AS Nombre_Empleado
    FROM Personal;
END;


ALTER PROCEDURE [dbo].[DescuentosTotalesPorEmpleado]
AS
BEGIN
    SELECT Id_Cedula, 
           Eps_Salud + Pension + Fdo_Sol AS TotalDescuentos,
           Nombre_Apellidos AS Nombre_Empleado
    FROM Personal;
END;


ALTER PROCEDURE MostrarPrimasOrdenadas
AS
BEGIN
    SELECT Id_Cedula, Nombre_Apellidos AS Nombre_Empleado, Primas
    FROM Personal
    ORDER BY Primas DESC;
END;


ALTER PROCEDURE MostrarMayoresSueldos
AS
BEGIN
    SELECT Id_Cedula, Nombre_Apellidos AS Nombre_Empleado, Salario
    FROM Personal
    ORDER BY Salario DESC;
END;