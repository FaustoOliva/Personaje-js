import sql from 'mssql'
import config from '../../db.js'
import 'dotenv/config'

const personajeTabla = process.env.DB_TABLA_PERSONAJE;

export class PersonajeService {

    getPersonaje = async (nombre, edad) => {
        console.log('This is a function on the service');

        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('Nombre',sql.VarChar, nombre)
            .input('Edad',sql.VarChar, edad)
        .query(`SELECT * from ${personajeTabla} where nombre = @nombre and edad = @edad`);
        console.log(response)

        return response.recordset;
    }

    getPersonajeById = async (id) => {
        console.log('This is a function on the service');

        //const SP_GETID = "SELECT * from ${personajeTabla} where id = @id"

        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('id',sql.Int, id)
            .query(`SELECT * from ${personajeTabla} where id = @id`);
        console.log(response)

        return response.recordset[0];
    }

    createPersonaje = async (Personaje) => {
        console.log('This is a function on the service');
        console.log(Personaje)
        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('Imagen',sql.VarChar, Personaje?.imagen ?? '')
            .input('Nombre',sql.VarChar, Personaje?.nombre ?? '')
            .input('Edad',sql.VarChar, Personaje?.edad ?? '')
            .input('Peso',sql.VarChar, Personaje?.peso ?? '')
            .input('Historia',sql.VarChar, Personaje?.historia ?? '')
            .query(`INSERT INTO ${personajeTabla}(Imagen, Nombre, Edad, Peso, Historia) VALUES (@Imagen, @Nombre, @Edad, @Peso, @Historia)`);
        console.log(response)

        return response.recordset;
    }

    updatePersonajeById = async (id, personaje) => {
        console.log('This is a function on the service');
        console.log(id, personaje)
        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('Imagen',sql.VarChar, personaje?.imagen ?? '')
            .input('Nombre',sql.VarChar, personaje?.nombre ?? '')
            .input('Edad',sql.VarChar, personaje?.edad ?? '')
            .input('Peso',sql.VarChar, personaje?.peso ?? '')
            .input('Historia',sql.VarChar, personaje?.historia ?? '')
            .query(`UPDATE ${personajeTabla} SET Imagen = @Imagen, Nombre = @Nombre, Edad = @Edad, Peso = @Peso, Historia = @Historia WHERE id = @id`);
        console.log(response)

        return response.recordset;
    }

    deletePersonajeById = async (id) => {
        console.log('This is a function on the service');

        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('id',sql.Int, id)
            .query(`DELETE FROM ${personajeTabla} WHERE id = @id`);
        console.log(response)

        return response.recordset;
    }
}