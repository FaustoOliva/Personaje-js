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
            .input('Imagen', sql.VarChar, Serie?.imagen ?? '')
            .input('Titulo', sql.VarChar, Serie?.titulo ?? '')
            .input('FechaDeCreacion', sql.Date, Serie?.fechaDeCreacion ?? '')
            .input('Calificacion', sql.VarChar, Serie?.calificacion ?? '')
            .query(`INSERT INTO ${serieTabla}(Imagen, Titulo, FechaDeCreacion, Calificacion) VALUES (@Imagen, @Titulo, @FechaDeCreacion, @Calificacion)`);
        console.log(response)

        return response.recordset;
    }

    updateSerieById = async (id, Serie) => {
        console.log('This is a function on the service');
        console.log(id, Serie)
        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('id', sql.Int, id ?? '')
            .input('Imagen', sql.VarChar, Serie?.imagen ?? '')
            .input('Titulo', sql.VarChar, Serie?.titulo ?? '')
            .input('FechaDeCreacion', sql.Date, Serie?.fechaDeCreacion ?? '')
            .input('Calificacion', sql.VarChar, Serie?.calificacion ?? '')
            .query(`UPDATE ${serieTabla} SET Imagen = @Imagen, Titulo = @Titulo, FechaDeCreacion = @FechaDeCreacion, Calificacion = @Calificacion WHERE id = @id`);
        console.log(response)
        return response.recordset;
    }

    deleteSerieById = async (id) => {
        console.log('This is a function on the service');

        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('id', sql.Int, id)
            .query(`DELETE FROM ${serieTabla} WHERE id = @id`);
        console.log(response)

        return response.recordset;
    }

    getListSerie = async () => {
        console.log('This is a function on the service');   

        const pool = await sql.connect(config);
        const response = await pool.request()
            .query(`SELECT id, imagen, titulo, fechaDeCreacion from ${serieTabla} `);
        console.log(response)

        return response.recordset;
    }

    getSerieById = async (id) => {
        console.log('This is a function on the service')    
    
        const pool = await sql.connect(config);
        const response = await pool.request()
            .input('id', sql.Int, id)
            .query(`SELECT * from ${serieTabla} where id = @id`);
        console.log(response)
    
        return response.recordset[0];
    }
}



