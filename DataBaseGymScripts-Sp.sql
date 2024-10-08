USE [master]
GO
/****** Object:  Database [db_aaaf3a_gymproyect2]    Script Date: 8/24/2024 11:09:42 AM ******/
CREATE DATABASE [db_aaaf3a_gymproyect2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_aaaf3a_gymproyect2_Data', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_aaaf3a_gymproyect2_DATA.mdf' , SIZE = 13440KB , MAXSIZE = 1024000KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'db_aaaf3a_gymproyect2_Log', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_aaaf3a_gymproyect2_Log.LDF' , SIZE = 3072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_aaaf3a_gymproyect2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET  MULTI_USER 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_aaaf3a_gymproyect2]
GO
/****** Object:  Table [dbo].[CitasMedicionCorporal]    Script Date: 8/24/2024 11:09:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CitasMedicionCorporal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CorreoElectronico] [varchar](255) NULL,
	[EntrenadorCorreo] [varchar](255) NULL,
	[FechaCita] [datetime] NOT NULL,
	[Estado] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClasesGrupales]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClasesGrupales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](255) NULL,
	[Cupo] [int] NOT NULL,
	[Horario] [datetime] NOT NULL,
	[EntrenadorCorreo] [varchar](255) NULL,
	[UsuarioCorreo] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cupones]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cupones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](50) NOT NULL,
	[DescuentoId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[Usado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Descuentos]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Descuentos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](255) NULL,
	[Porcentaje] [decimal](5, 2) NOT NULL,
	[FechaInicio] [datetime] NULL,
	[FechaFin] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DisponibilidadEntrenadores]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DisponibilidadEntrenadores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CorreoElectronico] [varchar](255) NULL,
	[DiaSemana] [nvarchar](10) NULL,
	[HoraInicio] [time](7) NULL,
	[HoraFin] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EjercicioEquipos]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EjercicioEquipos](
	[EjercicioId] [int] NOT NULL,
	[EquipoId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EjercicioId] ASC,
	[EquipoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ejercicios]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ejercicios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Tipo] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](255) NULL,
	[Peso] [decimal](10, 2) NULL,
	[Tiempo] [int] NULL,
	[AMRAP] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntrenamientoDetalles]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntrenamientoDetalles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EntrenamientoId] [int] NULL,
	[EjercicioId] [int] NULL,
	[Sets] [int] NULL,
	[Repeticiones] [int] NULL,
	[Tiempo] [int] NULL,
	[Peso] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entrenamientos]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrenamientos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CorreoElectronico] [varchar](255) NULL,
	[FechaEntrenamiento] [datetime] NOT NULL,
	[RutinaId] [int] NULL,
	[Observaciones] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipos]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](255) NULL,
	[GrupoMuscular] [nvarchar](20) NULL,
	[Cantidad] [int] NULL,
	[Disponibilidad] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inscripciones]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inscripciones](
	[ClaseId] [int] NOT NULL,
	[CorreoElectronico] [varchar](255) NOT NULL,
	[FechaInscripcion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaseId] ASC,
	[CorreoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedidasCorporales]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedidasCorporales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CorreoElectronico] [varchar](255) NULL,
	[FechaMedicion] [datetime] NOT NULL,
	[Peso] [decimal](5, 2) NULL,
	[Altura] [decimal](5, 2) NULL,
	[EntrenadorCorreo] [varchar](255) NULL,
	[IMC] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OTP]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OTP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CorreoElectronico] [varchar](255) NULL,
	[CodigoOTP] [nvarchar](6) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[Usado] [bit] NOT NULL,
	[FechaUso] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CorreoElectronico] [varchar](255) NULL,
	[FechaPago] [datetime] NOT NULL,
	[Monto] [decimal](10, 2) NOT NULL,
	[MetodoPago] [nvarchar](50) NULL,
	[EstadoPago] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgresoUsuario]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgresoUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CorreoElectronico] [varchar](255) NULL,
	[FechaProgreso] [datetime] NOT NULL,
	[Peso] [decimal](5, 2) NULL,
	[MasaMuscular] [decimal](5, 2) NULL,
	[PorcentajeGrasa] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RutinaDetalles]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RutinaDetalles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RutinaId] [int] NULL,
	[EjercicioId] [int] NULL,
	[Sets] [int] NULL,
	[Repeticiones] [int] NULL,
	[Tiempo] [int] NULL,
	[Peso] [decimal](10, 2) NULL,
	[DiaSemana] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rutinas]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rutinas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CorreoElectronico] [varchar](255) NULL,
	[MedicionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[EntrenadorCorreo] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salts]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salts](
	[CorreoElectronico] [varchar](255) NOT NULL,
	[Salt] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CorreoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioRoles]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioRoles](
	[CorreoElectronico] [varchar](255) NOT NULL,
	[RolId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CorreoElectronico] ASC,
	[RolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[CorreoElectronico] [varchar](255) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Contrasena] [nvarchar](200) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[Telefono] [nvarchar](20) NULL,
	[TipoUsuario] [nvarchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
	[HaPagado] [bit] NOT NULL,
	[CorreoVerificado] [bit] NOT NULL,
	[TelefonoVerificado] [bit] NOT NULL,
	[VerificationCode] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CorreoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cupones] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Cupones] ADD  DEFAULT ((0)) FOR [Usado]
GO
ALTER TABLE [dbo].[Entrenamientos] ADD  DEFAULT (getdate()) FOR [FechaEntrenamiento]
GO
ALTER TABLE [dbo].[Inscripciones] ADD  DEFAULT (getdate()) FOR [FechaInscripcion]
GO
ALTER TABLE [dbo].[MedidasCorporales] ADD  DEFAULT (getdate()) FOR [FechaMedicion]
GO
ALTER TABLE [dbo].[OTP] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[OTP] ADD  DEFAULT ((0)) FOR [Usado]
GO
ALTER TABLE [dbo].[Pagos] ADD  DEFAULT (getdate()) FOR [FechaPago]
GO
ALTER TABLE [dbo].[Pagos] ADD  DEFAULT ('Pendiente') FOR [EstadoPago]
GO
ALTER TABLE [dbo].[ProgresoUsuario] ADD  DEFAULT (getdate()) FOR [FechaProgreso]
GO
ALTER TABLE [dbo].[Rutinas] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [HaPagado]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [CorreoVerificado]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [TelefonoVerificado]
GO
ALTER TABLE [dbo].[CitasMedicionCorporal]  WITH CHECK ADD  CONSTRAINT [FK_CitasMedicionCorporal_Entrenador] FOREIGN KEY([EntrenadorCorreo])
REFERENCES [dbo].[Usuarios] ([CorreoElectronico])
GO
ALTER TABLE [dbo].[CitasMedicionCorporal] CHECK CONSTRAINT [FK_CitasMedicionCorporal_Entrenador]
GO
ALTER TABLE [dbo].[CitasMedicionCorporal]  WITH CHECK ADD  CONSTRAINT [FK_CitasMedicionCorporal_Usuario] FOREIGN KEY([CorreoElectronico])
REFERENCES [dbo].[Usuarios] ([CorreoElectronico])
GO
ALTER TABLE [dbo].[CitasMedicionCorporal] CHECK CONSTRAINT [FK_CitasMedicionCorporal_Usuario]
GO
ALTER TABLE [dbo].[ClasesGrupales]  WITH CHECK ADD  CONSTRAINT [FK_ClasesGrupales_Instructor] FOREIGN KEY([EntrenadorCorreo])
REFERENCES [dbo].[Usuarios] ([CorreoElectronico])
GO
ALTER TABLE [dbo].[ClasesGrupales] CHECK CONSTRAINT [FK_ClasesGrupales_Instructor]
GO
ALTER TABLE [dbo].[Cupones]  WITH CHECK ADD  CONSTRAINT [FK_Cupones_Descuento] FOREIGN KEY([DescuentoId])
REFERENCES [dbo].[Descuentos] ([Id])
GO
ALTER TABLE [dbo].[Cupones] CHECK CONSTRAINT [FK_Cupones_Descuento]
GO
ALTER TABLE [dbo].[DisponibilidadEntrenadores]  WITH CHECK ADD  CONSTRAINT [FK_DisponibilidadEntrenadores_Entrenador] FOREIGN KEY([CorreoElectronico])
REFERENCES [dbo].[Usuarios] ([CorreoElectronico])
GO
ALTER TABLE [dbo].[DisponibilidadEntrenadores] CHECK CONSTRAINT [FK_DisponibilidadEntrenadores_Entrenador]
GO
ALTER TABLE [dbo].[EjercicioEquipos]  WITH CHECK ADD  CONSTRAINT [FK_EjercicioEquipos_Ejercicio] FOREIGN KEY([EjercicioId])
REFERENCES [dbo].[Ejercicios] ([Id])
GO
ALTER TABLE [dbo].[EjercicioEquipos] CHECK CONSTRAINT [FK_EjercicioEquipos_Ejercicio]
GO
ALTER TABLE [dbo].[EjercicioEquipos]  WITH CHECK ADD  CONSTRAINT [FK_EjercicioEquipos_Equipo] FOREIGN KEY([EquipoId])
REFERENCES [dbo].[Equipos] ([Id])
GO
ALTER TABLE [dbo].[EjercicioEquipos] CHECK CONSTRAINT [FK_EjercicioEquipos_Equipo]
GO
ALTER TABLE [dbo].[EntrenamientoDetalles]  WITH CHECK ADD  CONSTRAINT [FK_EntrenamientoDetalles_Ejercicio] FOREIGN KEY([EjercicioId])
REFERENCES [dbo].[Ejercicios] ([Id])
GO
ALTER TABLE [dbo].[EntrenamientoDetalles] CHECK CONSTRAINT [FK_EntrenamientoDetalles_Ejercicio]
GO
ALTER TABLE [dbo].[EntrenamientoDetalles]  WITH CHECK ADD  CONSTRAINT [FK_EntrenamientoDetalles_Entrenamiento] FOREIGN KEY([EntrenamientoId])
REFERENCES [dbo].[Entrenamientos] ([Id])
GO
ALTER TABLE [dbo].[EntrenamientoDetalles] CHECK CONSTRAINT [FK_EntrenamientoDetalles_Entrenamiento]
GO
ALTER TABLE [dbo].[Entrenamientos]  WITH CHECK ADD  CONSTRAINT [FK_Entrenamientos_Rutina] FOREIGN KEY([RutinaId])
REFERENCES [dbo].[Rutinas] ([Id])
GO
ALTER TABLE [dbo].[Entrenamientos] CHECK CONSTRAINT [FK_Entrenamientos_Rutina]
GO
ALTER TABLE [dbo].[Entrenamientos]  WITH CHECK ADD  CONSTRAINT [FK_Entrenamientos_Usuario] FOREIGN KEY([CorreoElectronico])
REFERENCES [dbo].[Usuarios] ([CorreoElectronico])
GO
ALTER TABLE [dbo].[Entrenamientos] CHECK CONSTRAINT [FK_Entrenamientos_Usuario]
GO
ALTER TABLE [dbo].[Inscripciones]  WITH CHECK ADD  CONSTRAINT [FK_Inscripciones_Clase] FOREIGN KEY([ClaseId])
REFERENCES [dbo].[ClasesGrupales] ([Id])
GO
ALTER TABLE [dbo].[Inscripciones] CHECK CONSTRAINT [FK_Inscripciones_Clase]
GO
ALTER TABLE [dbo].[Inscripciones]  WITH CHECK ADD  CONSTRAINT [FK_Inscripciones_Usuario] FOREIGN KEY([CorreoElectronico])
REFERENCES [dbo].[Usuarios] ([CorreoElectronico])
GO
ALTER TABLE [dbo].[Inscripciones] CHECK CONSTRAINT [FK_Inscripciones_Usuario]
GO
ALTER TABLE [dbo].[MedidasCorporales]  WITH CHECK ADD  CONSTRAINT [FK_MedidasCorporales_Entrenador] FOREIGN KEY([EntrenadorCorreo])
REFERENCES [dbo].[Usuarios] ([CorreoElectronico])
GO
ALTER TABLE [dbo].[MedidasCorporales] CHECK CONSTRAINT [FK_MedidasCorporales_Entrenador]
GO
ALTER TABLE [dbo].[MedidasCorporales]  WITH CHECK ADD  CONSTRAINT [FK_MedidasCorporales_Usuario] FOREIGN KEY([CorreoElectronico])
REFERENCES [dbo].[Usuarios] ([CorreoElectronico])
GO
ALTER TABLE [dbo].[MedidasCorporales] CHECK CONSTRAINT [FK_MedidasCorporales_Usuario]
GO
ALTER TABLE [dbo].[OTP]  WITH CHECK ADD  CONSTRAINT [FK_OTP_Usuario] FOREIGN KEY([CorreoElectronico])
REFERENCES [dbo].[Usuarios] ([CorreoElectronico])
GO
ALTER TABLE [dbo].[OTP] CHECK CONSTRAINT [FK_OTP_Usuario]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_Usuario] FOREIGN KEY([CorreoElectronico])
REFERENCES [dbo].[Usuarios] ([CorreoElectronico])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [FK_Pagos_Usuario]
GO
ALTER TABLE [dbo].[ProgresoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ProgresoUsuario_Usuario] FOREIGN KEY([CorreoElectronico])
REFERENCES [dbo].[Usuarios] ([CorreoElectronico])
GO
ALTER TABLE [dbo].[ProgresoUsuario] CHECK CONSTRAINT [FK_ProgresoUsuario_Usuario]
GO
ALTER TABLE [dbo].[Rutinas]  WITH CHECK ADD  CONSTRAINT [FK_Rutinas_Medicion] FOREIGN KEY([MedicionId])
REFERENCES [dbo].[MedidasCorporales] ([Id])
GO
ALTER TABLE [dbo].[Rutinas] CHECK CONSTRAINT [FK_Rutinas_Medicion]
GO
ALTER TABLE [dbo].[Rutinas]  WITH CHECK ADD  CONSTRAINT [FK_Rutinas_Usuario] FOREIGN KEY([CorreoElectronico])
REFERENCES [dbo].[Usuarios] ([CorreoElectronico])
GO
ALTER TABLE [dbo].[Rutinas] CHECK CONSTRAINT [FK_Rutinas_Usuario]
GO
ALTER TABLE [dbo].[Salts]  WITH NOCHECK ADD  CONSTRAINT [FK_Salt_Usuario] FOREIGN KEY([CorreoElectronico])
REFERENCES [dbo].[Usuarios] ([CorreoElectronico])
GO
ALTER TABLE [dbo].[Salts] CHECK CONSTRAINT [FK_Salt_Usuario]
GO
ALTER TABLE [dbo].[UsuarioRoles]  WITH NOCHECK ADD FOREIGN KEY([CorreoElectronico])
REFERENCES [dbo].[Usuarios] ([CorreoElectronico])
GO
ALTER TABLE [dbo].[UsuarioRoles]  WITH CHECK ADD FOREIGN KEY([RolId])
REFERENCES [dbo].[Roles] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[ActualizarMedidaCorporal]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarMedidaCorporal]
    @Id INT,
    @CorreoElectronico VARCHAR(255),
    @FechaMedicion DATETIME,
    @Peso DECIMAL(5, 2),
    @Altura DECIMAL(5, 2),
    @EntrenadorCorreo VARCHAR(255)
AS
BEGIN
    UPDATE dbo.MedidasCorporales
    SET 
        CorreoElectronico = @CorreoElectronico,
        FechaMedicion = @FechaMedicion,
        Peso = @Peso,
        Altura = @Altura,
        EntrenadorCorreo = @EntrenadorCorreo
    WHERE Id = @Id;
END

GO
/****** Object:  StoredProcedure [dbo].[AutenticarUsuario]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AutenticarUsuario]
    @CorreoElectronico NVARCHAR(255),
    @Contrasena NVARCHAR(200)
AS
BEGIN
    DECLARE @Salt NVARCHAR(256);
    DECLARE @HashContrasena VARBINARY(256);

    -- Obtener el Salt correspondiente al CorreoElectronico
    SELECT @Salt = Salt
    FROM Salts
    WHERE CorreoElectronico = @CorreoElectronico;

    IF @Salt IS NOT NULL
    BEGIN
        -- Combinar la contraseña con el salt y aplicar la función hash
        SET @HashContrasena = HASHBYTES('SHA2_256', @Contrasena + @Salt);

        -- Verificar las credenciales
        SELECT 
            U.Nombre
		FROM Usuarios U
        WHERE U.CorreoElectronico = @CorreoElectronico AND U.Contrasena = @HashContrasena;
    END
    ELSE
    BEGIN
        -- Si no se encuentra el usuario, devolver datos específicos
        SELECT 
            Nombre = 'Usuario no encontrado'
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateCitaMedicionCorporal]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateCitaMedicionCorporal]
    @CorreoElectronico VARCHAR(255),
    @EntrenadorCorreo VARCHAR(255),
    @FechaCita DATETIME,
    @Estado NVARCHAR(20)
AS
BEGIN
    INSERT INTO CitasMedicionCorporal (CorreoElectronico, EntrenadorCorreo, FechaCita, Estado)
    VALUES (@CorreoElectronico, @EntrenadorCorreo, @FechaCita, @Estado);
END
GO
/****** Object:  StoredProcedure [dbo].[CreateClaseGrupal]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateClaseGrupal]
    @Nombre NVARCHAR(100),
    @Descripcion NVARCHAR(255),
    @Cupo INT,
    @Horario DATETIME,
    @UsuarioCorreo VARCHAR(255),
    @EntrenadorCorreo VARCHAR(255)
AS
BEGIN
    INSERT INTO ClasesGrupales (Nombre, Descripcion, Cupo, Horario, UsuarioCorreo, EntrenadorCorreo)
    VALUES (@Nombre, @Descripcion, @Cupo, @Horario, @UsuarioCorreo, @EntrenadorCorreo);
END
GO
/****** Object:  StoredProcedure [dbo].[CreateNewOTP]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateNewOTP]
    @CorreoElectronico VARCHAR(255),
    @CodigoOTP NVARCHAR(6),
    @FechaCreacion DATETIME,
    @Usado BIT
AS
BEGIN
    INSERT INTO OTP (CorreoElectronico, CodigoOTP, FechaCreacion, Usado)
    VALUES (@CorreoElectronico, @CodigoOTP, @FechaCreacion, @Usado);
END
GO
/****** Object:  StoredProcedure [dbo].[CreateOTP]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateOTP]
    @CorreoElectronico VARCHAR(255),
    @CodigoOTP NVARCHAR(6),
    @FechaCreacion DATETIME,
    @Usado BIT
AS
BEGIN
    INSERT INTO OTP (CorreoElectronico, CodigoOTP, FechaCreacion, Usado)
    VALUES (@CorreoElectronico, @CodigoOTP, @FechaCreacion, @Usado);
END
GO
/****** Object:  StoredProcedure [dbo].[CreateRole]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateRole]
    @Nombre NVARCHAR(50),
    @Descripcion NVARCHAR(255)
AS
BEGIN
    INSERT INTO Roles (Nombre, Descripcion)
    VALUES (@Nombre, @Descripcion);
END
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateUser]
    @Nombre NVARCHAR(100),
    @CorreoElectronico VARCHAR(255),
    @Contrasena NVARCHAR(100),
    @Telefono VARCHAR(20),
    @TipoUsuario NVARCHAR(50),
    @FechaRegistro DATETIME,
    @CorreoVerificado BIT,
    @TelefonoVerificado BIT,
    @Estado BIT,
    @HaPagado BIT
AS
BEGIN
    INSERT INTO Usuarios (Nombre, CorreoElectronico, Contrasena, Telefono, TipoUsuario, FechaRegistro, CorreoVerificado, TelefonoVerificado, Estado, HaPagado)
    VALUES (@Nombre, @CorreoElectronico, @Contrasena, @Telefono, @TipoUsuario, @FechaRegistro, @CorreoVerificado, @TelefonoVerificado, @Estado, @HaPagado);
END
GO
/****** Object:  StoredProcedure [dbo].[CreateUsuarioConRol]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateUsuarioConRol]
    @CorreoElectronico VARCHAR(255),
    @Nombre NVARCHAR(100),
    @Contrasena NVARCHAR(100),
    @FechaRegistro DATETIME,
    @Telefono NVARCHAR(20),
    @TipoUsuario NVARCHAR(50),
    @Estado BIT,
    @HaPagado BIT,
    @CorreoVerificado BIT,
    @TelefonoVerificado BIT,
    @RolId INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar si el usuario ya existe en la tabla Usuarios
        IF NOT EXISTS (SELECT 1 FROM Usuarios WHERE CorreoElectronico = @CorreoElectronico)
        BEGIN
            -- Insertar el nuevo usuario en la tabla Usuarios
            INSERT INTO Usuarios (
                CorreoElectronico, 
                Nombre, 
                Contrasena, 
                FechaRegistro, 
                Telefono, 
                TipoUsuario, 
                Estado, 
                HaPagado, 
                CorreoVerificado, 
                TelefonoVerificado
            )
            VALUES (
                @CorreoElectronico, 
                @Nombre, 
                @Contrasena, 
                @FechaRegistro, 
                @Telefono, 
                @TipoUsuario, 
                @Estado, 
                @HaPagado, 
                @CorreoVerificado, 
                @TelefonoVerificado
            );
        END

        -- Insertar o actualizar el rol del usuario en la tabla UsuarioRoles
        IF EXISTS (SELECT 1 FROM UsuarioRoles WHERE CorreoElectronico = @CorreoElectronico)
        BEGIN
            -- Actualizar el rol del usuario existente
            UPDATE UsuarioRoles
            SET RolId = @RolId
            WHERE CorreoElectronico = @CorreoElectronico;
        END
        ELSE
        BEGIN
            -- Insertar el nuevo rol del usuario
            INSERT INTO UsuarioRoles (CorreoElectronico, RolId)
            VALUES (@CorreoElectronico, @RolId);
        END

        -- Manejar el salt de la contraseña
        -- Eliminar el sal existente
        IF EXISTS (SELECT 1 FROM Salts WHERE CorreoElectronico = @CorreoElectronico)
        BEGIN
            DELETE FROM Salts WHERE CorreoElectronico = @CorreoElectronico;
        END

        -- Generar un nuevo sal y guardarlo
        DECLARE @Salt NVARCHAR(256) = CAST(NEWID() AS NVARCHAR(256));
        INSERT INTO Salts (CorreoElectronico, Salt)
        VALUES (@CorreoElectronico, @Salt);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        -- Lanzar el error capturado para mantener la cadena de errores
        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateUsuarioRole]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateUsuarioRole]
    @CorreoElectronico NVARCHAR(100),
    @Nombre NVARCHAR(100),
    @Contrasena NVARCHAR(100),
    @FechaRegistro DATETIME,
    @Telefono NVARCHAR(20),
    @TipoUsuario NVARCHAR(50),
    @Estado BIT,
    @HaPagado BIT,
    @CorreoVerificado BIT,
    @TelefonoVerificado BIT,
    @RolId INT
AS
BEGIN
    INSERT INTO UsuarioRoles (CorreoElectronico, RolId)
    VALUES (@CorreoElectronico, @RolId);
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCitaMedicionCorporal]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteCitaMedicionCorporal]
    @CorreoElectronico VARCHAR(255),
    @FechaCita DATETIME
AS
BEGIN
    DELETE FROM CitasMedicionCorporal
    WHERE CorreoElectronico = @CorreoElectronico
    AND FechaCita = @FechaCita;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteClaseGrupal]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteClaseGrupal]
    @Id INT
AS
BEGIN
    DELETE FROM ClasesGrupales
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteRole]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteRole]
    @Id INT
AS
BEGIN
    DELETE FROM Roles
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteSaltIfExists]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteSaltIfExists]
    @CorreoElectronico VARCHAR(255)
AS
BEGIN
    DELETE FROM Salts WHERE CorreoElectronico = @CorreoElectronico;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteUsuarioRole]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteUsuarioRole]
    @CorreoElectronico VARCHAR(255)
AS
BEGIN
    DELETE FROM Salts WHERE CorreoElectronico = @CorreoElectronico;
    DELETE FROM UsuarioRoles WHERE CorreoElectronico = @CorreoElectronico;
    DELETE FROM Usuarios WHERE CorreoElectronico = @CorreoElectronico;
END
GO
/****** Object:  StoredProcedure [dbo].[DevolverRolAcceso]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DevolverRolAcceso]
    @CorreoElectronico NVARCHAR(255)
AS
BEGIN
    DECLARE @RolId INT;

    -- Obtener el Rol del Usuario basándose solo en el correo electrónico
    SELECT @RolId = UR.RolId
    FROM Usuarios U
    INNER JOIN UsuarioRoles UR ON U.CorreoElectronico = UR.CorreoElectronico
    WHERE U.CorreoElectronico = @CorreoElectronico;

    -- Devolver el Rol del Usuario
    SELECT @RolId AS Rol;
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarMedidaCorporal]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarMedidaCorporal]
    @Id INT
AS
BEGIN
    DELETE FROM dbo.MedidasCorporales
    WHERE Id = @Id;
END

GO
/****** Object:  StoredProcedure [dbo].[GetAllCitasMedicionCorporal]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllCitasMedicionCorporal]
AS
BEGIN
    SELECT Id, CorreoElectronico, EntrenadorCorreo, FechaCita, Estado
    FROM CitasMedicionCorporal;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllClasesGrupales]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllClasesGrupales]
AS
BEGIN
    SELECT Id, Nombre, Descripcion, Cupo, Horario, UsuarioCorreo, EntrenadorCorreo
    FROM ClasesGrupales;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllRoles]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllRoles]
AS
BEGIN
    SELECT Id, Nombre, Descripcion
    FROM Roles;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsuarioRoles]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllUsuarioRoles]
AS
BEGIN
    SELECT
        u.CorreoElectronico,
        u.Nombre,
        u.Contrasena,
        u.FechaRegistro,
        u.Telefono,
        u.TipoUsuario,
        u.Estado,
        u.HaPagado,
        u.CorreoVerificado,
        u.TelefonoVerificado,
        ur.RolId
    FROM
        Usuarios u
    INNER JOIN
        UsuarioRoles ur ON u.CorreoElectronico = ur.CorreoElectronico
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsuariosConRoles]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllUsuariosConRoles]
AS
BEGIN
    SELECT 
        u.CorreoElectronico, 
        u.Nombre, 
        u.Contrasena, 
        u.FechaRegistro, 
        u.Telefono, 
        u.TipoUsuario, 
        u.Estado, 
        u.HaPagado, 
        u.CorreoVerificado, 
        u.TelefonoVerificado, 
        ur.RolId,
        r.Nombre AS RolNombre,
        r.Descripcion AS RolDescripcion
    FROM Usuarios u
    LEFT JOIN UsuarioRoles ur ON u.CorreoElectronico = ur.CorreoElectronico
    LEFT JOIN Roles r ON ur.RolId = r.Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetCitaByDateAndUser]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCitaByDateAndUser]
@CorreoElectronico VARCHAR(255),
@FechaCita DATETIME
AS
BEGIN
    SELECT * 
    FROM CitasMedicionCorporal
    WHERE CorreoElectronico = @CorreoElectronico 
    AND FechaCita = @FechaCita;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCitasAgendadasByUsuario]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCitasAgendadasByUsuario]
    @CorreoElectronico VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Id, CorreoElectronico, EntrenadorCorreo, FechaCita, Estado
    FROM CitasMedicionCorporal
    WHERE CorreoElectronico = @CorreoElectronico
    ORDER BY FechaCita ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCitasMedicionCorporalByUsuario]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCitasMedicionCorporalByUsuario]
    @CorreoElectronico VARCHAR(255)
AS
BEGIN
    SELECT Id, CorreoElectronico, EntrenadorCorreo, FechaCita, Estado
    FROM CitasMedicionCorporal
    WHERE CorreoElectronico = @CorreoElectronico;
END
GO
/****** Object:  StoredProcedure [dbo].[GetClaseGrupalByID]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetClaseGrupalByID]
    @Id INT
AS
BEGIN
    SELECT Id, Nombre, Descripcion, Cupo, Horario, UsuarioCorreo, EntrenadorCorreo
    FROM ClasesGrupales
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetEntrenadores]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEntrenadores]
AS
BEGIN
    SELECT u.CorreoElectronico, r.Nombre
    FROM UsuarioRoles ur
    INNER JOIN Usuarios u ON ur.CorreoElectronico = u.CorreoElectronico
    INNER JOIN Roles r ON ur.RolId = r.Id
    WHERE ur.RolId = 2;
END
GO
/****** Object:  StoredProcedure [dbo].[GetRoleById]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRoleById]
    @Id INT
AS
BEGIN
    SELECT Id, Nombre, Descripcion
    FROM Roles
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetRoleNameById]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRoleNameById]
    @Id INT
AS
BEGIN
    SELECT Nombre
    FROM Roles
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetUsersByRole]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsersByRole]
    @RoleName VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    -- Seleccionar usuarios con el rol especificado desde las tablas 'Usuarios' y 'UsuarioRoles'
    SELECT u.CorreoElectronico, u.Nombre, r.RolId AS RolAcceso
    FROM Usuarios u
    INNER JOIN UsuarioRoles r ON u.CorreoElectronico = r.CorreoElectronico
    WHERE r.RolId = @RoleName;
END
GO
/****** Object:  StoredProcedure [dbo].[GetUsersByRoleName]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsersByRoleName]
    @RoleName VARCHAR(50)
AS
BEGIN
    SELECT 
        u.CorreoElectronico,
        u.Nombre,
        u.Contrasena,
        u.Telefono,
        u.TipoUsuario,
        u.FechaRegistro,
        u.CorreoVerificado,
        u.TelefonoVerificado,
        u.Estado,
        u.HaPagado,
        ur.RolId
    FROM 
        Usuarios u
    INNER JOIN 
        UsuarioRoles ur ON u.CorreoElectronico = ur.CorreoElectronico
    WHERE 
        ur.RolId = (SELECT TOP 1 Id FROM Roles WHERE Nombre = @RoleName)
END
GO
/****** Object:  StoredProcedure [dbo].[GetUsuarioRoleByEmail]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsuarioRoleByEmail]
    @CorreoElectronico VARCHAR(255)
AS
BEGIN
    SELECT 
        u.CorreoElectronico, 
        u.Nombre, 
        u.Contrasena, 
        u.FechaRegistro, 
        u.Telefono, 
        u.TipoUsuario, 
        u.Estado, 
        u.HaPagado, 
        u.CorreoVerificado, 
        u.TelefonoVerificado, 
        ur.RolId,
        r.Nombre AS RolNombre,
        r.Descripcion AS RolDescripcion
    FROM Usuarios u
    INNER JOIN UsuarioRoles ur ON u.CorreoElectronico = ur.CorreoElectronico
    INNER JOIN Roles r ON ur.RolId = r.Id
    WHERE u.CorreoElectronico = @CorreoElectronico;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarMedidaCorporal]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarMedidaCorporal]
    @CorreoElectronico VARCHAR(255) = NULL,
    @FechaMedicion DATETIME,
    @Peso DECIMAL(10, 2),  -- Incrementar la precisión
    @Altura DECIMAL(10, 2),  -- Incrementar la precisión
    @EntrenadorCorreo VARCHAR(255) = NULL
AS
BEGIN
    INSERT INTO dbo.MedidasCorporales (CorreoElectronico, FechaMedicion, Peso, Altura, EntrenadorCorreo)
    VALUES (@CorreoElectronico, @FechaMedicion, @Peso, @Altura, @EntrenadorCorreo);
END

GO
/****** Object:  StoredProcedure [dbo].[InsertSalt]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertSalt]
    @CorreoElectronico VARCHAR(255),
    @Salt NVARCHAR(256)
AS
BEGIN
    INSERT INTO Salts (CorreoElectronico, Salt)
    VALUES (@CorreoElectronico, @Salt);
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerClasesGrupalesPorNombre]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[ObtenerClasesGrupalesPorNombre]
    @Nombre NVARCHAR(100)
AS
BEGIN
    -- Seleccionamos todas las columnas de la tabla ClasesGrupales donde el nombre coincida
    SELECT Id, Nombre, Descripcion, Cupo, Horario, EntrenadorCorreo, UsuarioCorreo
    FROM dbo.ClasesGrupales
    WHERE Nombre = @Nombre;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerEntrenadores]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerEntrenadores]
AS
BEGIN
    SELECT Nombre, CorreoElectronico
    FROM Usuarios
    WHERE TipoUsuario = 'Entrenador'
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerMedidasCorporales]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerMedidasCorporales]
AS
BEGIN
    SELECT Id, CorreoElectronico, FechaMedicion, Peso, Altura, EntrenadorCorreo
    FROM dbo.MedidasCorporales;
END

GO
/****** Object:  StoredProcedure [dbo].[ObtenerMedidasCorporalesPorId]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerMedidasCorporalesPorId]
    @Id INT
AS
BEGIN
    SELECT Id, CorreoElectronico, FechaMedicion, Peso, Altura, EntrenadorCorreo
    FROM dbo.MedidasCorporales
    WHERE Id = @Id;
END

GO
/****** Object:  StoredProcedure [dbo].[ObtenerMedidasPorCorreo]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerMedidasPorCorreo]
    @CorreoElectronico VARCHAR(255)
AS
BEGIN
    SELECT Id, CorreoElectronico, FechaMedicion, Peso, Altura, EntrenadorCorreo
    FROM dbo.MedidasCorporales
    WHERE CorreoElectronico = @CorreoElectronico;
END

GO
/****** Object:  StoredProcedure [dbo].[ObtenerUsuariosPorRol]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Crear el procedimiento almacenado
CREATE PROCEDURE [dbo].[ObtenerUsuariosPorRol]
    @RolId INT
AS
BEGIN
    -- Seleccionar los correos electrónicos de usuarios basados en el RolId
    SELECT u.CorreoElectronico
    FROM Usuarios u
    INNER JOIN UsuarioRoles ur ON u.CorreoElectronico = ur.CorreoElectronico
    WHERE ur.RolId = @RolId;
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarUsuario]
    @Nombre NVARCHAR(100),
    @CorreoElectronico VARCHAR(255),
    @Contrasena NVARCHAR(100),
    @Telefono VARCHAR(20),
    @TipoUsuario NVARCHAR(50),
    @FechaRegistro DATETIME,
    @CorreoVerificado BIT,
    @TelefonoVerificado BIT,
    @Estado BIT,
    @HaPagado BIT
AS
BEGIN
    INSERT INTO Usuarios (Nombre, CorreoElectronico, Contrasena, Telefono, TipoUsuario, FechaRegistro, CorreoVerificado, TelefonoVerificado, Estado, HaPagado)
    VALUES (@Nombre, @CorreoElectronico, @Contrasena, @Telefono, @TipoUsuario, @FechaRegistro, @CorreoVerificado, @TelefonoVerificado, @Estado, @HaPagado);
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuarioRole]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarUsuarioRole]
    @Nombre NVARCHAR(100),
    @CorreoElectronico VARCHAR(255),
    @Contrasena NVARCHAR(100),
    @Telefono NVARCHAR(20),
    @TipoUsuario NVARCHAR(50),
    @Estado BIT,
    @HaPagado BIT,
    @CorreoVerificado BIT,
    @TelefonoVerificado BIT,
    @RolId INT
AS
BEGIN
    -- Declarar variables para el salt y el hash de la contraseña
    DECLARE @Salt NVARCHAR(256);
    DECLARE @HashContrasena VARBINARY(256);

    -- Generar un salt aleatorio
    SET @Salt = CAST(NEWID() AS NVARCHAR(256));

    -- Combinar la contraseña con el salt y aplicar la función hash
    SET @HashContrasena = HASHBYTES('SHA2_256', @Contrasena + @Salt);

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Insertar el nuevo usuario en la tabla Usuarios
        INSERT INTO Usuarios (
            Nombre, 
            CorreoElectronico, 
            Contrasena, 
            Telefono, 
            TipoUsuario, 
            CorreoVerificado, 
            TelefonoVerificado, 
            Estado, 
            HaPagado,
            FechaRegistro 
        )
        VALUES (
            @Nombre, 
            @CorreoElectronico, 
            @HashContrasena, 
            @Telefono, 
            @TipoUsuario, 
            @CorreoVerificado, 
            @TelefonoVerificado, 
            @Estado, 
            @HaPagado,
            GETDATE()
        );

        -- Insertar el salt en la tabla Salts
        INSERT INTO Salts (CorreoElectronico, Salt)
        VALUES (@CorreoElectronico, @Salt);

        -- Insertar el nuevo usuario en la tabla UsuarioRoles
        INSERT INTO UsuarioRoles (CorreoElectronico, RolId)
        VALUES (@CorreoElectronico, @RolId);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[RetrieveCitasByEntrenadorCorreo]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RetrieveCitasByEntrenadorCorreo]
    @EntrenadorCorreo VARCHAR(255)
AS
BEGIN
    SELECT *
    FROM Citas
    WHERE EntrenadorCorreo = @EntrenadorCorreo
END
GO
/****** Object:  StoredProcedure [dbo].[RetrieveLatestOTP]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RetrieveLatestOTP]
    @CorreoElectronico VARCHAR(255)
AS
BEGIN
    SELECT TOP 1 ID, CorreoElectronico, CodigoOTP, FechaCreacion, Usado
    FROM OTP
    WHERE CorreoElectronico = @CorreoElectronico
    ORDER BY FechaCreacion DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[RetrieveNewOTP]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RetrieveNewOTP]
    @CorreoElectronico VARCHAR(255)
AS
BEGIN
    SELECT TOP 1 ID, CorreoElectronico, CodigoOTP, FechaCreacion, Usado
    FROM OTP
    WHERE CorreoElectronico = @CorreoElectronico
    ORDER BY FechaCreacion DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[RetrieveOTP]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RetrieveOTP]
    @CorreoElectronico NVARCHAR(100)
AS
BEGIN
    SELECT * FROM OTP WHERE CorreoElectronico = @CorreoElectronico
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarEjercicio]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarEjercicio]
    @Id INT,
    @Nombre NVARCHAR(100),
    @Tipo NVARCHAR(50),
    @Descripcion NVARCHAR(255),
    @Peso DECIMAL(10, 2),
    @Tiempo INT,
    @AMRAP BIT
AS
BEGIN
    UPDATE Ejercicios
    SET 
        Nombre = @Nombre,
        Tipo = @Tipo,
        Descripcion = @Descripcion,
        Peso = @Peso,
        Tiempo = @Tiempo,
        AMRAP = @AMRAP
    WHERE Id = @Id;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarEquipo]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarEquipo]
    @Id INT,
    @Nombre NVARCHAR(100),
    @Descripcion NVARCHAR(255),
    @GrupoMuscular NVARCHAR(100),
    @Cantidad INT,
    @Disponibilidad BIT
AS
BEGIN
    UPDATE Equipos
    SET Nombre = @Nombre,
        Descripcion = @Descripcion,
        GrupoMuscular = @GrupoMuscular,
        Cantidad = @Cantidad,
        Disponibilidad = @Disponibilidad
    WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarRutina]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarRutina]
    @RutinaId INT,
    @CorreoElectronico VARCHAR(255),
    @EntrenadorCorreo VARCHAR(255)
AS
BEGIN
    UPDATE Rutinas
    SET CorreoElectronico = @CorreoElectronico,
        EntrenadorCorreo = @EntrenadorCorreo
    WHERE Id = @RutinaId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarRutinaDetalle]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarRutinaDetalle]
    @Id INT,
    @RutinaId INT,
    @EjercicioId INT,
    @Sets INT,
    @Repeticiones INT,
    @Peso DECIMAL(10, 2),
    @DiaSemana NVARCHAR(1)
AS
BEGIN
    UPDATE RutinaDetalles
    SET EjercicioId = @EjercicioId,
        Sets = @Sets,
        Repeticiones = @Repeticiones,
        Peso = @Peso,
        DiaSemana = @DiaSemana
    WHERE Id = @Id AND RutinaId = @RutinaId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarUsuario]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarUsuario]
    @CorreoElectronico NVARCHAR(100),
    @Nombre NVARCHAR(100),
    @Contrasena NVARCHAR(100),
    @Telefono NVARCHAR(20),
    @TipoUsuario NVARCHAR(50),
    @FechaRegistro DATETIME,
    @CorreoVerificado BIT,
    @TelefonoVerificado BIT,
    @Estado BIT,
    @HaPagado BIT
AS
BEGIN
    UPDATE Usuarios
    SET Nombre = @Nombre,
        Contrasena = @Contrasena,
        Telefono = @Telefono,
        TipoUsuario = @TipoUsuario,
        FechaRegistro = @FechaRegistro,
        CorreoVerificado = @CorreoVerificado,
        TelefonoVerificado = @TelefonoVerificado,
        Estado = @Estado,
        HaPagado = @HaPagado
    WHERE CorreoElectronico = @CorreoElectronico
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearEquipo]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CrearEquipo]
    @Nombre NVARCHAR(100),
    @Descripcion NVARCHAR(255),
    @GrupoMuscular NVARCHAR(100),
    @Cantidad INT,
    @Disponibilidad BIT
AS
BEGIN
    INSERT INTO Equipos (Nombre, Descripcion, GrupoMuscular, Cantidad, Disponibilidad)
    VALUES (@Nombre, @Descripcion, @GrupoMuscular, @Cantidad, @Disponibilidad)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearRutina]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CrearRutina]
    @CorreoElectronico VARCHAR(255),
    @EntrenadorCorreo VARCHAR(255),
    @FechaCreacion DATETIME
AS
BEGIN
    INSERT INTO Rutinas (CorreoElectronico, EntrenadorCorreo, FechaCreacion)
    VALUES (@CorreoElectronico, @EntrenadorCorreo, @FechaCreacion);

    SELECT SCOPE_IDENTITY() AS RutinaId; -- Devuelve el ID de la rutina recién creada
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearRutinaDetalle]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CrearRutinaDetalle]
    @RutinaId INT,
    @EjercicioId INT,
    @Sets INT,
    @Repeticiones INT,
    @Peso DECIMAL(10, 2),
    @DiaSemana NVARCHAR(1)
AS
BEGIN
    INSERT INTO RutinaDetalles (RutinaId, EjercicioId, Sets, Repeticiones, Peso, DiaSemana)
    VALUES (@RutinaId, @EjercicioId, @Sets, @Repeticiones, @Peso, @DiaSemana);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateDescuento]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CreateDescuento]
    @Nombre NVARCHAR(100),
    @Descripcion NVARCHAR(255),
    @Porcentaje DECIMAL(5, 2),
    @FechaInicio DATETIME,
    @FechaFin DATETIME
AS
BEGIN
    INSERT INTO Descuentos (Nombre, Descripcion, Porcentaje, FechaInicio, FechaFin)
    VALUES (@Nombre, @Descripcion, @Porcentaje, @FechaInicio, @FechaFin);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreatePago]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CreatePago]
    @CorreoElectronico VARCHAR(255),
    @FechaPago DATETIME,
    @Monto DECIMAL(10, 2),
    @MetodoPago NVARCHAR(50),
    @EstadoPago NVARCHAR(20)
AS
BEGIN
    INSERT INTO Pagos (CorreoElectronico, FechaPago, Monto, MetodoPago, EstadoPago)
    VALUES (@CorreoElectronico, @FechaPago, @Monto, @MetodoPago, @EstadoPago);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateProgreso]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CreateProgreso]
    @CorreoElectronico VARCHAR(100),
    @FechaProgreso DATETIME,
    @Peso DECIMAL(10, 2),
    @MasaMuscular DECIMAL(10, 2),
    @PorcentajeGrasa DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO Progreso (CorreoElectronico, FechaProgreso, Peso, MasaMuscular, PorcentajeGrasa)
    VALUES (@CorreoElectronico, @FechaProgreso, @Peso, @MasaMuscular, @PorcentajeGrasa);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateProgresoUsuario]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CreateProgresoUsuario]
    @CorreoElectronico NVARCHAR(100),
    @FechaProgreso DATETIME,
    @Peso DECIMAL(5,2),
    @MasaMuscular DECIMAL(5,2),
    @PorcentajeGrasa DECIMAL(5,2)
AS
BEGIN
    INSERT INTO ProgresoUsuario (CorreoElectronico, FechaProgreso, Peso, MasaMuscular, PorcentajeGrasa)
    VALUES (@CorreoElectronico, @FechaProgreso, @Peso, @MasaMuscular, @PorcentajeGrasa);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateRutina]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CreateRutina]
    @CorreoElectronico NVARCHAR(100),
    @MedicionId INT,
    @EntrenadorCorreo NVARCHAR(100)
AS
BEGIN
    INSERT INTO Rutinas (CorreoElectronico, MedicionId, FechaCreacion, EntrenadorCorreo)
    VALUES (@CorreoElectronico, @MedicionId, GETDATE(), @EntrenadorCorreo);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateUsuario]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CreateUsuario]
    @CorreoElectronico VARCHAR(100),
    @Nombre VARCHAR(100),
    @Contrasena VARCHAR(100),
    @FechaRegistro DATE,
    @Telefono VARCHAR(20),
    @TipoUsuario VARCHAR(50),
    @Estado BIT,
    @HaPagado BIT,
    @CorreoVerificado BIT,
    @TelefonoVerificado BIT,
    @VerificationCode VARCHAR(6)
AS
BEGIN
    INSERT INTO Usuarios (CorreoElectronico, Nombre, Contrasena, FechaRegistro, Telefono, TipoUsuario, Estado, HaPagado, CorreoVerificado, TelefonoVerificado, VerificationCode)
    VALUES (@CorreoElectronico, @Nombre, @Contrasena, @FechaRegistro, @Telefono, @TipoUsuario, @Estado, @HaPagado, @CorreoVerificado, @TelefonoVerificado, @VerificationCode);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeletePago]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure para eliminar un pago
CREATE PROCEDURE [dbo].[sp_DeletePago]
    @Id INT
AS
BEGIN
    DELETE FROM Pagos
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteProgreso]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteProgreso]
    @Id INT
AS
BEGIN
    DELETE FROM Progreso
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteProgresoUsuario]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_DeleteProgresoUsuario]
    @Id INT
AS
BEGIN
    DELETE FROM ProgresoUsuario WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarEjercicio]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_EliminarEjercicio]
    @Id INT
AS
BEGIN
    DELETE FROM Ejercicios
    WHERE Id = @Id;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarEquipo]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_EliminarEquipo]
    @Id INT
AS
BEGIN
    DELETE FROM Equipos
    WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarRutina]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarRutina]
    @RutinaId INT
AS
BEGIN
    DELETE FROM Rutinas
    WHERE Id = @RutinaId;

    DELETE FROM RutinaDetalles
    WHERE RutinaId = @RutinaId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllPagos]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure para obtener todos los pagos
CREATE PROCEDURE [dbo].[sp_GetAllPagos]
AS
BEGIN
    SELECT * FROM Pagos;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllProgreso]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllProgreso]
AS
BEGIN
    SELECT Id, CorreoElectronico, FechaProgreso, Peso, MasaMuscular, PorcentajeGrasa
    FROM Progreso
    ORDER BY FechaProgreso ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllProgresoUsuario]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetAllProgresoUsuario]
AS
BEGIN
    SELECT * FROM ProgresoUsuario ORDER BY FechaProgreso;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPagoById]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure para obtener un pago por ID
CREATE PROCEDURE [dbo].[sp_GetPagoById]
    @Id INT
AS
BEGIN
    SELECT * FROM Pagos
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProgresoByCorreo]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetProgresoByCorreo]
    @CorreoElectronico VARCHAR(100)
AS
BEGIN
    SELECT Id, CorreoElectronico, FechaProgreso, Peso, MasaMuscular, PorcentajeGrasa
    FROM Progreso
    WHERE CorreoElectronico = @CorreoElectronico
    ORDER BY FechaProgreso ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProgresoById]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetProgresoById]
    @Id INT
AS
BEGIN
    SELECT Id, CorreoElectronico, FechaProgreso, Peso, MasaMuscular, PorcentajeGrasa
    FROM Progreso
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProgresoUsuarioByCorreo]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetProgresoUsuarioByCorreo]
    @CorreoElectronico NVARCHAR(100)
AS
BEGIN
    SELECT * FROM ProgresoUsuario WHERE CorreoElectronico = @CorreoElectronico ORDER BY FechaProgreso;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProgresoUsuarioById]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetProgresoUsuarioById]
    @Id INT
AS
BEGIN
    SELECT * FROM ProgresoUsuario WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRutinasByCorreo]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetRutinasByCorreo]
    @CorreoElectronico VARCHAR(100)
AS
BEGIN
    SELECT *
    FROM Rutinas
    WHERE CorreoElectronico = @CorreoElectronico
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerEjercicioPorId]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ObtenerEjercicioPorId]
    @Id INT
AS
BEGIN
    SELECT Id, Nombre, Tipo, Descripcion, Peso, Tiempo, AMRAP
    FROM Ejercicios
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerEquipoPorId]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerEquipoPorId]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id, Nombre, Descripcion, GrupoMuscular, Cantidad, Disponibilidad
    FROM Equipos
    WHERE Id = @Id;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerProgresoPorCorreo]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerProgresoPorCorreo]
    @CorreoElectronico VARCHAR(100)
AS
BEGIN
    SELECT Id, CorreoElectronico, FechaProgreso, Peso, MasaMuscular, PorcentajeGrasa
    FROM ProgresoUsuario
    WHERE CorreoElectronico = @CorreoElectronico
    ORDER BY FechaProgreso ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerRutinaDetallesPorRutinaId]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerRutinaDetallesPorRutinaId]
    @RutinaId INT
AS
BEGIN
    SELECT * FROM RutinaDetalles
    WHERE RutinaId = @RutinaId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerRutinaPorId]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerRutinaPorId]
    @RutinaId INT
AS
BEGIN
    SELECT * FROM Rutinas
    WHERE Id = @RutinaId;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerRutinas]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerRutinas]
AS
BEGIN
    SELECT * FROM Rutinas;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerTodosLosEjercicios]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerTodosLosEjercicios]
AS
BEGIN
    SELECT * FROM dbo.Ejercicios WITH(NOLOCK);
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerTodosLosEquipos]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ObtenerTodosLosEquipos]
AS
BEGIN
    SELECT * FROM dbo.Equipos WITH(NOLOCK)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerUsuario]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerUsuario]
    @CorreoElectronico NVARCHAR(100)
AS
BEGIN
    SELECT * FROM Usuarios WHERE CorreoElectronico = @CorreoElectronico
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerUsuarioPorCorreo]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerUsuarioPorCorreo]
    @CorreoElectronico varchar(255)
AS
BEGIN
    SELECT *
    FROM Usuarios
    WHERE CorreoElectronico = @CorreoElectronico
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarEjercicio]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RegistrarEjercicio]
    @Nombre NVARCHAR(100),
    @Tipo NVARCHAR(50),
    @Descripcion NVARCHAR(255),
    @Peso DECIMAL(10,2),
    @Tiempo INT,
    @AMRAP BIT
AS
BEGIN
    INSERT INTO Ejercicios (Nombre, Tipo, Descripcion, Peso, Tiempo, AMRAP)
    VALUES (@Nombre, @Tipo, @Descripcion, @Peso, @Tiempo, @AMRAP);
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_SearchUsersByName]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SearchUsersByName]
    @Name NVARCHAR(100)  -- Parámetro para buscar por nombre
AS
BEGIN
    SELECT 
        u.CorreoElectronico,
        u.Nombre,
        u.Contrasena,
        u.Telefono,
        u.TipoUsuario,
        u.FechaRegistro,
        u.CorreoVerificado,
        u.TelefonoVerificado,
        u.Estado,
        u.HaPagado,
        ur.RolId  -- Este es el rol asociado con el usuario
    FROM 
        Usuarios u
    LEFT JOIN 
        UsuarioRoles ur ON u.CorreoElectronico = ur.CorreoElectronico
    WHERE 
        u.Nombre LIKE @Name
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateEstadoPago]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure para actualizar el estado de un pago
CREATE PROCEDURE [dbo].[sp_UpdateEstadoPago]
    @Id INT,
    @EstadoPago NVARCHAR(20)
AS
BEGIN
    UPDATE Pagos
    SET EstadoPago = @EstadoPago
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateProgreso]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateProgreso]
    @Id INT,
    @CorreoElectronico VARCHAR(100),
    @FechaProgreso DATETIME,
    @Peso DECIMAL(10, 2),
    @MasaMuscular DECIMAL(10, 2),
    @PorcentajeGrasa DECIMAL(10, 2)
AS
BEGIN
    UPDATE Progreso
    SET CorreoElectronico = @CorreoElectronico,
        FechaProgreso = @FechaProgreso,
        Peso = @Peso,
        MasaMuscular = @MasaMuscular,
        PorcentajeGrasa = @PorcentajeGrasa
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateProgresoUsuario]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateProgresoUsuario]
    @Id INT,
    @CorreoElectronico NVARCHAR(100),
    @FechaProgreso DATETIME,
    @Peso DECIMAL(5,2),
    @MasaMuscular DECIMAL(5,2),
    @PorcentajeGrasa DECIMAL(5,2)
AS
BEGIN
    UPDATE ProgresoUsuario
    SET CorreoElectronico = @CorreoElectronico,
        FechaProgreso = @FechaProgreso,
        Peso = @Peso,
        MasaMuscular = @MasaMuscular,
        PorcentajeGrasa = @PorcentajeGrasa
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateUsuario]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateUsuario]
    @CorreoElectronico VARCHAR(100),
    @Nombre VARCHAR(100),
    @Contrasena VARCHAR(100),
    @Telefono VARCHAR(20),
    @TipoUsuario VARCHAR(50),
    @Estado BIT,
    @HaPagado BIT,
    @CorreoVerificado BIT,
    @TelefonoVerificado BIT,
    @VerificationCode VARCHAR(6)
AS
BEGIN
    UPDATE Usuarios
    SET Nombre = @Nombre,
        Contrasena = @Contrasena,
        Telefono = @Telefono,
        TipoUsuario = @TipoUsuario,
        Estado = @Estado,
        HaPagado = @HaPagado,
        CorreoVerificado = @CorreoVerificado,
        TelefonoVerificado = @TelefonoVerificado,
        VerificationCode = @VerificationCode
    WHERE CorreoElectronico = @CorreoElectronico;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCitaMedicionCorporal]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateCitaMedicionCorporal]
    @CorreoElectronico VARCHAR(255),
    @EntrenadorCorreo VARCHAR(255),
    @FechaCita DATETIME,
    @Estado NVARCHAR(20)
AS
BEGIN
    UPDATE CitasMedicionCorporal
    SET EntrenadorCorreo = @EntrenadorCorreo,
        FechaCita = @FechaCita,
        Estado = @Estado
    WHERE CorreoElectronico = @CorreoElectronico;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateClaseGrupal]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateClaseGrupal]
    @Id INT,
    @Nombre NVARCHAR(100),
    @Descripcion NVARCHAR(255),
    @Cupo INT,
    @Horario DATETIME,
    @UsuarioCorreo VARCHAR(255),
    @EntrenadorCorreo VARCHAR(255)
AS
BEGIN
    UPDATE ClasesGrupales
    SET 
        Nombre = @Nombre,
        Descripcion = @Descripcion,
        Cupo = @Cupo,
        Horario = @Horario,
        UsuarioCorreo = @UsuarioCorreo,
        EntrenadorCorreo = @EntrenadorCorreo
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateNewOTP]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateNewOTP]
    @CorreoElectronico VARCHAR(255),
    @CodigoOTP NVARCHAR(6),
    @Usado BIT
AS
BEGIN
    UPDATE OTP
    SET Usado = @Usado
    WHERE CorreoElectronico = @CorreoElectronico AND CodigoOTP = @CodigoOTP;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateOTP]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateOTP]
    @Id INT,
    @CodigoOTP VARCHAR(50),
    @Usado BIT,
    @FechaCreacion DATETIME
AS
BEGIN
    -- Actualiza la tabla de OTPs con los valores proporcionados
    UPDATE OTP  -- Reemplaza OTPsTable por el nombre real de tu tabla
    SET 
        CodigoOTP = @CodigoOTP,
        Usado = @Usado,
        FechaCreacion = @FechaCreacion
    WHERE 
        ID = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateRole]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRole]
    @Id INT,
    @Nombre NVARCHAR(50),
    @Descripcion NVARCHAR(255)
AS
BEGIN
    UPDATE Roles
    SET Nombre = @Nombre,
        Descripcion = @Descripcion
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUser]
    @CorreoElectronico VARCHAR(255),
    @Nombre NVARCHAR(100),
    @Contrasena NVARCHAR(100),
    @Telefono VARCHAR(20),
    @TipoUsuario NVARCHAR(50),
    @CorreoVerificado BIT,
    @TelefonoVerificado BIT,
    @Estado BIT,
    @HaPagado BIT
AS
BEGIN
    UPDATE Usuarios
    SET Nombre = @Nombre,
        Contrasena = @Contrasena,
        Telefono = @Telefono,
        TipoUsuario = @TipoUsuario,
        CorreoVerificado = @CorreoVerificado,
        TelefonoVerificado = @TelefonoVerificado,
        Estado = @Estado,
        HaPagado = @HaPagado
    WHERE CorreoElectronico = @CorreoElectronico;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUsuarioRole]    Script Date: 8/24/2024 11:09:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUsuarioRole]
    @OriginalCorreoElectronico VARCHAR(255),
    @CorreoElectronico VARCHAR(255),
    @Nombre NVARCHAR(100),
    @FechaRegistro DATETIME,
    @Telefono NVARCHAR(20),
    @TipoUsuario NVARCHAR(50),
    @Estado BIT,
    @HaPagado BIT,
    @CorreoVerificado BIT,
    @TelefonoVerificado BIT,
    @RolId INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Solo desactivar y actualizar si el correo electrónico ha cambiado
        IF @OriginalCorreoElectronico <> @CorreoElectronico
        BEGIN
            -- Verificar si existe una fila con el nuevo correo y el rol
            IF EXISTS (SELECT 1 FROM UsuarioRoles WHERE CorreoElectronico = @CorreoElectronico AND RolId = @RolId)
            BEGIN
                THROW 50000, 'La combinación de CorreoElectronico y RolId ya existe en UsuarioRoles.', 1;
            END

            -- Eliminar las restricciones de clave foránea en las tablas relacionadas
            IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK__UsuarioRo__Corre__28B808A7')
            BEGIN
                ALTER TABLE UsuarioRoles NOCHECK CONSTRAINT FK__UsuarioRo__Corre__28B808A7;
            END

            IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Salt_Usuario')
            BEGIN
                ALTER TABLE Salts NOCHECK CONSTRAINT FK_Salt_Usuario;
            END

            -- Actualizar la tabla Usuarios
            UPDATE Usuarios
            SET 
                CorreoElectronico = @CorreoElectronico,
                Nombre = @Nombre,
                FechaRegistro = @FechaRegistro,
                Telefono = @Telefono,
                TipoUsuario = @TipoUsuario,
                Estado = @Estado,
                HaPagado = @HaPagado,
                CorreoVerificado = @CorreoVerificado,
                TelefonoVerificado = @TelefonoVerificado
            WHERE CorreoElectronico = @OriginalCorreoElectronico;

            -- Actualizar la tabla UsuarioRoles
            UPDATE UsuarioRoles
            SET 
                CorreoElectronico = @CorreoElectronico,
                RolId = @RolId
            WHERE CorreoElectronico = @OriginalCorreoElectronico;

            -- Actualizar la tabla Salts
            UPDATE Salts
            SET 
                CorreoElectronico = @CorreoElectronico
            WHERE CorreoElectronico = @OriginalCorreoElectronico;

            -- Volver a habilitar las restricciones de clave foránea en las tablas relacionadas
            IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK__UsuarioRo__Corre__28B808A7')
            BEGIN
                ALTER TABLE UsuarioRoles CHECK CONSTRAINT FK__UsuarioRo__Corre__28B808A7;
            END

            IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Salt_Usuario')
            BEGIN
                ALTER TABLE Salts CHECK CONSTRAINT FK_Salt_Usuario;
            END
        END
        ELSE
        BEGIN
            -- Si el correo electrónico no cambia, simplemente actualizar los demás campos
            UPDATE Usuarios
            SET 
                Nombre = @Nombre,
                FechaRegistro = @FechaRegistro,
                Telefono = @Telefono,
                TipoUsuario = @TipoUsuario,
                Estado = @Estado,
                HaPagado = @HaPagado,
                CorreoVerificado = @CorreoVerificado,
                TelefonoVerificado = @TelefonoVerificado
            WHERE CorreoElectronico = @OriginalCorreoElectronico;

            UPDATE UsuarioRoles
            SET RolId = @RolId
            WHERE CorreoElectronico = @OriginalCorreoElectronico;
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
USE [master]
GO
ALTER DATABASE [db_aaaf3a_gymproyect2] SET  READ_WRITE 
GO
