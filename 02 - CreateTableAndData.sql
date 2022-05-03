USE [Personajedatabase]
GO
/****** Object:  User [Personaje]    Script Date: 3/5/2022 08:55:30 ******/
CREATE USER [Personaje] FOR LOGIN [Personaje] WITH DEFAULT_SCHEMA=[dbo]
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
SET IDENTITY_INSERT [dbo].[Personaje] ON 

INSERT [dbo].[Personaje] ([id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (1, N'FGHF', N'Candace', N'17', N'67', N'Una chica extrovertida')
SET IDENTITY_INSERT [dbo].[Personaje] OFF
GO
USE [master]
GO
ALTER DATABASE [Personajedatabase] SET  READ_WRITE 
GO