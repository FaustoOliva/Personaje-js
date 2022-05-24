import sql from 'mssql'
import config from '../../db.js'
import 'dotenv/config'

const personajeTabla = process.env.DB_TABLA_PERSONAJE;
const serieTabla = process.env.DB_TABLA_Serie;
const intermedia = process.env.DB_TABLA_PERSOBAJEXSERIE
//Revisado

export class PersonajeService {

    getPersonaje = async (nombre, edad) => {
        console.log('This is a function on the service');

        const pool = await sql.connect(config);
        let response;
        if (nombre && edad) {
            response = await pool.request()
                .input('Nombre', sql.VarChar, nombre)
                .input('Edad', sql.VarChar, edad)
                .query(`SELECT * from ${personajeTabla} where nombre = @nombre and edad = @edad`);
        } else if (nombre && !edad) {
            response = await pool.request()
                .input('Nombre', sql.VarChar, nombre)
                .query(`SELECT * from ${personajeTabla} where nombre = @nombre`);
        } else if (!nombre && edad) {
            response = await pool.request()
                .input('Edad', sql.VarChar, edad)
                .query(`SELECT * from ${personajeTabla} where edad = @edad`);
        } else {
            response = await pool.request()
                .query(`SELECT * from ${personajeTabla}`);
        }

        console.log(response)

        return response.recordset;
    }

    getPersonajeById = async (id) => {
        console.log('This is a function on the service');

        //const SP_GETID = "SELECT * from ${personajeTabla} where id = @id"

        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('id', sql.Int, id)
            .query(`SELECT * from ${personajeTabla} where id = @id`);
        console.log(response)

        return response.recordset[0];
    }

    getListPersonaje = async () => {
        console.log('This is a function on the service');

        const pool = await sql.connect(config);
        const response = await pool.request()
            .query(`SELECT imagen,nombre,id from ${personajeTabla} `);
        console.log(response)

        return response.recordset;
    }

    createPersonaje = async (Personaje) => {
        console.log('This is a function on the service');
        console.log(Personaje)
        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('Imagen', sql.VarChar, Personaje?.imagen ?? '')
            .input('Nombre', sql.VarChar, Personaje?.nombre ?? '')
            .input('Edad', sql.VarChar, Personaje?.edad ?? '')
            .input('Peso', sql.VarChar, Personaje?.peso ?? '')
            .input('Historia', sql.VarChar, Personaje?.historia ?? '')
            .query(`INSERT INTO ${personajeTabla}(Imagen, Nombre, Edad, Peso, Historia) VALUES (@Imagen, @Nombre, @Edad, @Peso, @Historia)`);
        console.log(response)

        return response.recordset;
    }

    updatePersonajeById = async (id, personaje) => {
        console.log('This is a function on the service');
        console.log(id, personaje)
        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('id', sql.Int, id ?? '')
            .input('Imagen', sql.VarChar, personaje?.imagen ?? '')
            .input('Nombre', sql.VarChar, personaje?.nombre ?? '')
            .input('Edad', sql.VarChar, personaje?.edad ?? '')
            .input('Peso', sql.VarChar, personaje?.peso ?? '')
            .input('Historia', sql.VarChar, personaje?.historia ?? '')
            .query(`UPDATE ${personajeTabla} SET Imagen = @Imagen, Nombre = @Nombre, Edad = @Edad, Peso = @Peso, Historia = @Historia WHERE id = @id`);
        console.log(response)

        return response.recordset;
    }

    deletePersonajeById = async (id) => {
        console.log('This is a function on the service');

        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('id', sql.Int, id)
            .query(`DELETE FROM ${personajeTabla} WHERE id = @id`);
        console.log(response)

        return response.recordset;
    }

    getDetallesPersonaje = async (id) => {
        console.log('This is a function on the service');

        let personaje;
        let serie;

        const pool = await sql.connect(config);
        personaje = await pool.request()
            .input('id', sql.Int, id)
            .query(`Select * FROM ${personajeTabla} where id = @id`);
        console.log(personaje)

        serie = await pool.request()
            .input('id', sql.Int, id)
            .query(`select s.id, s.imagen, s.titulo, s.fechaDeCreacion, s.calificacion from ${serieTabla} s inner join ${intermedia} on s.id = ${intermedia}.idS inner join ${personajeTabla} on ${personajeTabla}.id = ${intermedia}.idP AND ${personajeTabla}.id = @id`);
        console.log(serie)

        personaje.recordset[0].seriesAsociadas = serie.recordset;

        return personaje.recordset;


    }

}