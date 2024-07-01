ALTER PROCEDURE RegistrarVendedor
	@Cedula		varchar(50),
	@Nombre		varchar(100),
	@Correo		varchar(100)
AS
BEGIN
	
	DECLARE @Estado BIT = 1

	/*IF NOT EXISTS(SELECT 1 FROM dbo.Vendedores WHERE Cedula = @Cedula)
	BEGIN*/
		
		INSERT INTO dbo.Vendedores(Cedula,Nombre,Correo,Estado)
		VALUES (@Cedula,@Nombre,@Correo,@Estado)

	END

GO


