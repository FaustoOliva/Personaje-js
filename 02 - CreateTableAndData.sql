USE [Personajedatabase]
GO
/****** Object:  User [Personaje]    Script Date: 11/5/2022 10:12:11 ******/
CREATE USER [Personaje] FOR LOGIN [Personaje] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [alumno]    Script Date: 11/5/2022 10:12:11 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Personaje]
GO
/****** Object:  Table [dbo].[Personaje]    Script Date: 11/5/2022 10:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personaje](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Imagen] [varchar](max) NULL,
	[Nombre] [varchar](max) NULL,
	[Edad] [varchar](max) NULL,
	[Peso] [varchar](max) NULL,
	[Historia] [varchar](max) NULL,
 CONSTRAINT [PK__Personaj__3213E83FB4D5B95D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personajeXseries]    Script Date: 11/5/2022 10:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personajeXseries](
	[idpersonajeXseries] [int] IDENTITY(1,1) NOT NULL,
	[idP] [int] NULL,
	[idS] [int] NULL,
 CONSTRAINT [PK_Conexion] PRIMARY KEY CLUSTERED 
(
	[idpersonajeXseries] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Serie]    Script Date: 11/5/2022 10:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Serie](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imagen] [varchar](50) NULL,
	[titulo] [varchar](50) NULL,
	[fechaDeCreacion] [date] NULL,
	[calificacion] [int] NULL,
 CONSTRAINT [PK_Serie] PRIMARY KEY CLUSTERED 
 CONSTRAINT [PK_Person] CHECK (calificacion<=5)
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Personaje] ON 

INSERT [dbo].[Personaje] ([id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (1, N'FGHF', N'Candace', N'17', N'67', N'Una chica extrovertida')
INSERT [dbo].[Personaje] ([id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (2, N'jgbujws', N'Homero', N'28', N'180', N'Un personaje amarillento ')
SET IDENTITY_INSERT [dbo].[Personaje] OFF
GO
SET IDENTITY_INSERT [dbo].[Serie] ON 

INSERT [dbo].[Serie] ([id], [imagen], [titulo], [fechaDeCreacion], [calificacion]) VALUES (1, N'niti', N'niti', N'niti', 3)
SET IDENTITY_INSERT [dbo].[Serie] OFF
GO
USE [master]
GO
ALTER DATABASE [Personajedatabase] SET  READ_WRITE 
GO