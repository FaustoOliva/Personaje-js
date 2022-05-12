USE [Personajedatabase]
GO
/****** Object:  Table [dbo].[Personaje]    Script Date: 11/5/2022 22:34:02 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personajeXserie]    Script Date: 11/5/2022 22:34:02 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Serie]    Script Date: 11/5/2022 22:34:02 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Personaje] ON 

INSERT [dbo].[Personaje] ([id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (1, N'FGHF', N'Candace', N'17', N'67', N'Una chica extrovertida')
INSERT [dbo].[Personaje] ([id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (2, N'jgbujws', N'Homero', N'28', N'180', N'Un personaje amarillento ')
SET IDENTITY_INSERT [dbo].[Personaje] OFF
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
USE [master]
GO
ALTER DATABASE [Personajedatabase] SET  READ_WRITE 
GO
