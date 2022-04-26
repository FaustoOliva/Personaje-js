USE [master]
GO
CREATE LOGIN [Personaje] WITH PASSWORD=N'Fausto123', DEFAULT_DATABASE=[Personajedatabase], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

USE [Personajedatabase]
GO
CREATE USER [Colo] FOR LOGIN [Personajes]
GO
USE [Personajedatabase]
GO
ALTER ROLE [db_owner] ADD MEMBER [Personajes]
