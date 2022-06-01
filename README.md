# Personaje-js
***

## Pasos a seguir 

1. Revisar version de Node, debe ser superior o igual a 16.15.0
2. Instalar los paquetes con npm install
3. Insertar el .env
4. En el archivo .env modificar la ubicacion del servidor ('DB_SERVER')
5. En Sql Server, crear una database de nombre 'Personajedatabase'
6. Ejecutar los scripts de la carpeta 'create dataBase' en SQL Server 
7. npm start
8. Abrir el postman e importar (CTRL + O) el archivo DAI.postman_collection.json de la carpeta 'req colection'
9. Modificar la variable 'Url' con su puerto desde Postman y desde Visual en el archivo 'server.js'
10. El primer req es para crear el token de autorizacion. En las proximas req te lo va a solicitar
11. Entrar a 'Authorization', selecionar 'Bearer token', y pegar el token recibido en el anterior req
12. Comenzar a realizar requests :)
