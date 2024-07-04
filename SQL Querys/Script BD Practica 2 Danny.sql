USE [master]
GO
/****** Object:  Database [Practica2]    Script Date: 3/7/2024 22:26:15 ******/
CREATE DATABASE [Practica2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practica2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Practica2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Practica2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Practica2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Practica2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Practica2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Practica2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Practica2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Practica2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Practica2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Practica2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Practica2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Practica2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Practica2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Practica2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Practica2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Practica2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Practica2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Practica2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Practica2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Practica2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Practica2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Practica2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Practica2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Practica2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Practica2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Practica2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Practica2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Practica2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Practica2] SET  MULTI_USER 
GO
ALTER DATABASE [Practica2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Practica2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Practica2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Practica2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Practica2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Practica2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Practica2] SET QUERY_STORE = ON
GO
ALTER DATABASE [Practica2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Practica2]
GO
/****** Object:  Table [dbo].[Vehiculos]    Script Date: 3/7/2024 22:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculos](
	[IdVehiculo] [bigint] IDENTITY(1,1) NOT NULL,
	[Marca] [varchar](100) NOT NULL,
	[Modelo] [varchar](100) NOT NULL,
	[Color] [varchar](100) NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[IdVendedor] [bigint] NOT NULL,
 CONSTRAINT [PK_Vehiculos] PRIMARY KEY CLUSTERED 
(
	[IdVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedores]    Script Date: 3/7/2024 22:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedores](
	[IdVendedor] [bigint] IDENTITY(1,1) NOT NULL,
	[Cedula] [varchar](50) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Vendedores] PRIMARY KEY CLUSTERED 
(
	[IdVendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Vehiculos] ON 
GO
INSERT [dbo].[Vehiculos] ([IdVehiculo], [Marca], [Modelo], [Color], [Precio], [IdVendedor]) VALUES (2, N'Volkswagen', N'Tiguan', N'Gris', CAST(8000000.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Vehiculos] ([IdVehiculo], [Marca], [Modelo], [Color], [Precio], [IdVendedor]) VALUES (3, N'Volkswagen', N'Tiguan', N'Gris', CAST(8000000.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Vehiculos] ([IdVehiculo], [Marca], [Modelo], [Color], [Precio], [IdVendedor]) VALUES (4, N'Hyundai', N'Tucson', N'Blanco', CAST(8000000.00 AS Decimal(18, 2)), 11)
GO
INSERT [dbo].[Vehiculos] ([IdVehiculo], [Marca], [Modelo], [Color], [Precio], [IdVendedor]) VALUES (5, N'Hyundai', N'Tucson', N'Blanco', CAST(8000000.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Vehiculos] ([IdVehiculo], [Marca], [Modelo], [Color], [Precio], [IdVendedor]) VALUES (6, N'Toyota', N'Supra', N'Negro', CAST(8000000.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Vehiculos] ([IdVehiculo], [Marca], [Modelo], [Color], [Precio], [IdVendedor]) VALUES (7, N'Toyota', N'Supra', N'Negro', CAST(8000000.00 AS Decimal(18, 2)), 1)
GO
SET IDENTITY_INSERT [dbo].[Vehiculos] OFF
GO
SET IDENTITY_INSERT [dbo].[Vendedores] ON 
GO
INSERT [dbo].[Vendedores] ([IdVendedor], [Cedula], [Nombre], [Correo], [Estado]) VALUES (1, N'116160205', N'Danny Rojas Garcia', N'drojas@ufide.ac.cr', 1)
GO
INSERT [dbo].[Vendedores] ([IdVendedor], [Cedula], [Nombre], [Correo], [Estado]) VALUES (3, N'116160209', N'Jorge Ulate Salazar', N'julate@ufide.ac.cr', 1)
GO
INSERT [dbo].[Vendedores] ([IdVendedor], [Cedula], [Nombre], [Correo], [Estado]) VALUES (9, N'116160210', N'David Arley Obregon', N'darley@ufide.ac.cr', 1)
GO
INSERT [dbo].[Vendedores] ([IdVendedor], [Cedula], [Nombre], [Correo], [Estado]) VALUES (11, N'116879987', N'Danny Prueba API', N'dprueba@ufide.ac.cr', 1)
GO
INSERT [dbo].[Vendedores] ([IdVendedor], [Cedula], [Nombre], [Correo], [Estado]) VALUES (13, N'106290775', N'Mario Rojas Prueba', N'mrojas@ufide.ac.cr', 1)
GO
INSERT [dbo].[Vendedores] ([IdVendedor], [Cedula], [Nombre], [Correo], [Estado]) VALUES (14, N'string', N'string', N'string', 1)
GO
SET IDENTITY_INSERT [dbo].[Vendedores] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Vendedores]    Script Date: 3/7/2024 22:26:15 ******/
ALTER TABLE [dbo].[Vendedores] ADD  CONSTRAINT [UK_Vendedores] UNIQUE NONCLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Vehiculos]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculos_Vendedores] FOREIGN KEY([IdVendedor])
REFERENCES [dbo].[Vendedores] ([IdVendedor])
GO
ALTER TABLE [dbo].[Vehiculos] CHECK CONSTRAINT [FK_Vehiculos_Vendedores]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarVehiculos]    Script Date: 3/7/2024 22:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarVehiculos]
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
/****** Object:  StoredProcedure [dbo].[RegistrarVehiculo]    Script Date: 3/7/2024 22:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarVehiculo]
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
/****** Object:  StoredProcedure [dbo].[RegistrarVendedor]    Script Date: 3/7/2024 22:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarVendedor]
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
USE [master]
GO
ALTER DATABASE [Practica2] SET  READ_WRITE 
GO
