import { Router } from 'express';
import { SerieService } from '../services/SeriesService.js';
import { Authenticate } from '../common/jwt.strategy.js'; 

const router = Router();
const serieService = new SerieService();


router.get('/characters/', Authenticate, async (req, res) => {
  console.log(`This is a get operation`);

  const personajes = await serieService.getListPersonaje();

  return res.status(200).json(personajes);
});

router.post('', Authenticate, async (req, res) => {
  console.log(`This is a post operation`);

  const serie = await serieService.createSerie(req.body);

  return res.status(201).json(serie);
});

router.put('/:id', Authenticate, async (req, res) => {
  console.log(`Request URL Param: ${req.params.id}`);
  console.log(`This is a put operation`);

  const personaje = await serieService.updatePersonajeById(req.params.id, req.body);

  return res.status(200).json(personaje);
});

router.delete('/:id', Authenticate, async (req, res) => {
  console.log(`Request URL Param: ${req.params.id}`);
  console.log(`This is a delete operation`);

  const personaje = await serieService.deletePersonajeById(req.params.id);

  return res.status(200).json(personaje);
});

router.get('/get', Authenticate, async (req, res) => {
  console.log("nombre: ", req.query.nombre);
  console.log("edad: ", req.query.edad);
  console.log(`This is a get operation`);

  const {nombre, edad} = req.query;

  const personajes = await SeriesService.getPersonaje(nombre, edad);

  return res.status(200).json(personajes);
});

router.get('/getById', Authenticate, async (req, res) => {
  console.log(`Request URL Param: ${req.query.id}`);
  console.log(`This is a get operation`);

  const personaje = await SeriesService.getPersonajeById(req.query.id);

  return res.status(200).json(personaje);
});


export default router;
