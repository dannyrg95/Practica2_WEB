ALTER PROCEDURE RegistrarVendedor
	@Cedula		varchar(50),
	@Nombre		varchar(100),
	@Correo		varchar(100)
AS
BEGIN
	
	DECLARE @Estado BIT = 1

	IF NOT EXISTS(SELECT 1 FROM dbo.Vendedores WHERE Cedula = @Cedula)
	BEGIN
		
		INSERT INTO dbo.Vendedores(Cedula,Nombre,Correo,Estado)
		VALUES (@Cedula,@Nombre,@Correo,@Estado)

	END
END

GO

ALTER PROCEDURE RegistrarVehiculo
	@Marca		varchar(100),
	@Modelo		varchar(100),
	@Color		varchar(100),
	@Precio		decimal(18,2),
	@IdVendedor	bigint
AS
BEGIN
	
	DECLARE @VendedorExiste INT;
		SET @VendedorExiste = (SELECT COUNT(*) FROM dbo.Vendedores WHERE IdVendedor = @IdVendedor);

		IF @VendedorExiste = 0

		BEGIN
			RETURN;
		END


	IF (SELECT COUNT(Marca) FROM dbo.Vehiculos WHERE Marca = @Marca) < 2
	BEGIN

		INSERT INTO dbo.Vehiculos(Marca,Modelo,Color,Precio,IdVendedor)
		VALUES(@Marca,@Modelo,@Color,@Precio,@IdVendedor)
	
	END

END
GO

ALTER PROCEDURE ConsultarVehiculos
AS
BEGIN
    SELECT
        V.Cedula,
        V.Nombre,
        Ve.Marca,
        Ve.Modelo,
        Ve.Precio
    FROM dbo.Vendedores AS V
    JOIN dbo.Vehiculos AS Ve ON V.IdVendedor = Ve.IdVendedor;
END
GO
