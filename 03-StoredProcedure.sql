CREATE PROCEDURE [dbo].[SP_GetAll]

AS
BEGIN

SELECT * from ${personajeTabla}

END


CREATE PROCEDURE [dbo].[SP_GetById]

@id int

AS
BEGIN

SELECT * from ${personajeTabla} where id = @id

END



CREATE PROCEDURE [dbo].[SP_Create]

@id int,
@Imagen Varchar, 
@Nombre varchar, 
@Edad varchar,  
@Peso varchar, 
@Historia varchar

AS
BEGIN

INSERT INTO ${personajeTabla}(Imagen, Nombre, Edad, Peso, Historia) VALUES (@Imagen, @Nombre, @Edad, @Peso, @Historia)

END

CREATE PROCEDURE [dbo].[SP_Update]

@id int,
@Imagen Varchar, 
@Nombre varchar, 
@Edad varchar,  
@Peso varchar, 
@Historia varchar

AS
BEGIN

UPDATE ${personajeTabla} SET Imagen = @Imagen, Nombre = @Nombre, Edad = @Edad, Peso = @Peso, Historia = @Historia WHERE id = @id

END

CREATE PROCEDURE [dbo].[SP_Delete]

@id int,
@Imagen Varchar, 
@Nombre varchar, 
@Edad varchar,  
@Peso varchar, 
@Historia varchar

AS
BEGIN

DELETE FROM ${personajeTabla} WHERE id = @id

END