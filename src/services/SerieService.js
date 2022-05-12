import sql from 'mssql'
import config from '../../db.js'
import 'dotenv/config'

const serieTabla = process.env.DB_TABLA_SERIE;

//RevisionIncompleta

export class SerieService {

    createSerie = async (Serie) => {
        console.log('This is a function on the service');
        console.log(Serie)
        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('Imagen',sql.VarChar, Serie?.imagen ?? '')
            .input('Titulo',sql.VarChar, Serie?.titulo ?? '')
            .input('FechaDeCreacion',sql.VarChar, Serie?.fechaDeCreacion ?? '')
            .input('Calificacion',sql.VarChar, Serie?.calificacion ?? '')
            .input('PersonajesAsociados',sql.VarChar, Serie?.personajesAsociados ?? '')
            .query(`INSERT INTO ${serieTabla}(Imagen, Titulo, FechaDeCreacion, Calificacion, PersonajesAsociados) VALUES (@Imagen, @Titulo, @FechaDeCreacion, @Calificacion, @PersonajesAsociados)`);
        console.log(response)

        return response.recordset;
    }

    updateSerieById = async (id, personaje) => {
        console.log('This is a function on the service');
        console.log(id, personaje)
        const pool = await sql.connect(config);
        const response = await pool.request()
        .input('Imagen',sql.VarChar, Serie?.imagen ?? '')
        .input('Titulo',sql.VarChar, Serie?.titulo ?? '')
        .input('FechaDeCreacion',sql.VarChar, Serie?.fechaDeCreacion ?? '')
        .input('Calificacion',sql.VarChar, Serie?.calificacion ?? '')
        .input('PersonajesAsociados',sql.VarChar, Serie?.personajesAsociados ?? '')
        .query(`UPDATE ${serieTabla} SET Imagen = @Imagen, Titulo = @Titulo, FechaDeCreacion = @FechaDeCreacion, Calificacion = @Calificacion, PersonajesAsociados = @PersonajesAsociados WHERE id = @id`);  
        console.log(response)
        return response.recordset;
    }

    deleteSerieById = async (id) => {
        console.log('This is a function on the service');

        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('id',sql.Int, id)
            .query(`DELETE FROM ${serieTabla} WHERE id = @id`);
        console.log(response)

        return response.recordset;
    }

    getPersonaje = async (nombre, edad) => {
        console.log('This is a function on the service');
        
        const pool = await sql.connect(config);
        let response;
        if(nombre && edad){
            response = await pool.request()
                .input('Nombre',sql.VarChar, nombre)
                .input('Edad',sql.VarChar, edad)
            .query(`SELECT * from ${personajeTabla} where nombre = @nombre and edad = @edad`);
        }else if(nombre && !edad){
            response = await pool.request()
                .input('Nombre',sql.VarChar, nombre)
            .query(`SELECT * from ${personajeTabla} where nombre = @nombre`);
        }else if(!nombre && edad){
            response = await pool.request()
                .input('Edad',sql.VarChar, edad)
            .query(`SELECT * from ${personajeTabla} where edad = @edad`);
        }else{
            response = await pool.request()
            .query(`SELECT * from ${personajeTabla}`);
        }

        console.log(response)

        return response.recordset;
    }

    getSerieById = async (id) => {
        console.log('This is a function on the service');

        //const SP_GETID = "SELECT * from ${personajeTabla} where id = @id"

        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('id',sql.Int, id)
            .query(`SELECT * from ${serieTabla} where id = @id`);
        console.log(response)

        return response.recordset[0];
    }

    getListSerie = async () => {
        console.log('This is a function on the service');

        //const SP_GETID = "SELECT * from ${personajeTabla} where id = @id"

        const pool = await sql.connect(config);
        const response = await pool.request()
            .query(`SELECT imagen, titulo, id from ${serieTabla} `);
        console.log(response)

        return response.recordset;
    }
}