USE [Personajedatabase]
GO
CREATE LOGIN [Personaje] WITH PASSWORD=N'Fausto123', DEFAULT_DATABASE=[Personajedatabase], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

USE [Personajedatabase]
GO
CREATE USER [Personaje] FOR LOGIN [Personaje]
GO
USE [Personajedatabase]
GO
ALTER ROLE [db_owner] ADD MEMBER [Personaje]

