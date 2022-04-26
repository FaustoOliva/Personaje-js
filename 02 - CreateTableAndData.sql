USE [master]
GO
/****** Object:  Database [Personajedatabase]    Script Date: 26/4/2022 08:54:03 ******/
CREATE DATABASE [Personajedatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Personajedatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Personajedatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Personajedatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Personajedatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Personajedatabase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Personajedatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Personajedatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Personajedatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Personajedatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Personajedatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Personajedatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [Personajedatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Personajedatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Personajedatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Personajedatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Personajedatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Personajedatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Personajedatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Personajedatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Personajedatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Personajedatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Personajedatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Personajedatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Personajedatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Personajedatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Personajedatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Personajedatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Personajedatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Personajedatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [Personajedatabase] SET  MULTI_USER 
GO
ALTER DATABASE [Personajedatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Personajedatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Personajedatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Personajedatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Personajedatabase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Personajedatabase', N'ON'
GO
ALTER DATABASE [Personajedatabase] SET QUERY_STORE = OFF
GO
USE [Personajedatabase]
GO
/****** Object:  User [Colo]    Script Date: 26/4/2022 08:54:04 ******/
CREATE USER [Colo] FOR LOGIN [Personajes] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [alumno]    Script Date: 26/4/2022 08:54:04 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Personaje]    Script Date: 26/4/2022 08:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personaje](
	[id] [int] NULL,
	[Imagen] [varchar](max) NULL,
	[Nombre] [varchar](max) NULL,
	[Edad] [varchar](max) NULL,
	[Peso] [varchar](max) NULL,
	[Historia] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Personaje] ([id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (0, N'https://static1.abc.es/media/play/2017/12/14/homer-simpson-superheroe-ketF--1240x698@abc.png', N'Homero', N'33', N'188', N'Homero es un ex militar de la dictadura fan de las tartas de mermelada')
GO
USE [master]
GO
ALTER DATABASE [Personajedatabase] SET  READ_WRITE 
GO