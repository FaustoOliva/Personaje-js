USE [Personajedatabase]
GO
/****** Object:  Table [dbo].[Personaje]    Script Date: 1/6/2022 10:02:34 ******/
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
/****** Object:  Table [dbo].[personajeXserie]    Script Date: 1/6/2022 10:02:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personajeXserie](
	[idpersonajeXserie] [int] IDENTITY(1,1) NOT NULL,
	[idP] [int] NULL,
	[idS] [int] NULL,
 CONSTRAINT [PK_Conexion] PRIMARY KEY CLUSTERED 
(
	[idpersonajeXserie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Serie]    Script Date: 1/6/2022 10:02:34 ******/
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
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Personaje] ON 

INSERT [dbo].[Personaje] ([id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (1, N'FGHF', N'Candace', N'17', N'67', N'Una chica extrovertida')
INSERT [dbo].[Personaje] ([id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (2, N'jgbujws', N'Homero', N'28', N'180', N'Un personaje amarillento ')
INSERT [dbo].[Personaje] ([id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (3, N'ddfrdr', N'ho', N'5', N'54', N'gggyj')
SET IDENTITY_INSERT [dbo].[Personaje] OFF
GO
SET IDENTITY_INSERT [dbo].[personajeXserie] ON 

INSERT [dbo].[personajeXserie] ([idpersonajeXserie], [idP], [idS]) VALUES (2, 1, 2)
INSERT [dbo].[personajeXserie] ([idpersonajeXserie], [idP], [idS]) VALUES (5, 2, 5)
INSERT [dbo].[personajeXserie] ([idpersonajeXserie], [idP], [idS]) VALUES (6, 3, 2)
SET IDENTITY_INSERT [dbo].[personajeXserie] OFF
GO
SET IDENTITY_INSERT [dbo].[Serie] ON 

INSERT [dbo].[Serie] ([id], [imagen], [titulo], [fechaDeCreacion], [calificacion]) VALUES (2, N'Hgdf', N'Los Teletunbis', CAST(N'2003-07-06' AS Date), 3)
INSERT [dbo].[Serie] ([id], [imagen], [titulo], [fechaDeCreacion], [calificacion]) VALUES (5, N'rt', N'Los avengers', CAST(N'2014-05-12' AS Date), 4)
SET IDENTITY_INSERT [dbo].[Serie] OFF
GO
ALTER TABLE [dbo].[personajeXserie]  WITH CHECK ADD  CONSTRAINT [FK_personajeXserie_Personaje] FOREIGN KEY([idP])
REFERENCES [dbo].[Personaje] ([id])
GO
ALTER TABLE [dbo].[personajeXserie] CHECK CONSTRAINT [FK_personajeXserie_Personaje]
GO
ALTER TABLE [dbo].[personajeXserie]  WITH CHECK ADD  CONSTRAINT [FK_personajeXserie_Serie] FOREIGN KEY([idS])
REFERENCES [dbo].[Serie] ([id])
GO
ALTER TABLE [dbo].[personajeXserie] CHECK CONSTRAINT [FK_personajeXserie_Serie]
GO
ALTER TABLE [dbo].[Serie]  WITH CHECK ADD CHECK  (([calificacion]<=(5) AND [calificacion]>=(0)))
GO
/****** Object:  StoredProcedure [dbo].[sp_get]    Script Date: 1/6/2022 10:02:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get]
@nombre varchar(50)
AS

BEGIN

SELECT p.id, p.Imagen, p.Nombre FROM Personaje p, personajeXserie WHERE p.id = personajeXserie.idP AND p.Nombre = @nombre

END
GO
USE [master]
GO
ALTER DATABASE [Personajedatabase] SET  READ_WRITE 
GO