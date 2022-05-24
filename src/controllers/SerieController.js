import { Router } from 'express';
import { SerieService } from '../services/SerieService.js';
import { Authenticate } from '../common/jwt.strategy.js';

const router = Router();
const serieService = new SerieService();


router.post('/create', Authenticate, async (req, res) => {  // CRUD
  console.log(`This is a post operation`);

  const serie = await serieService.createSerie(req.body);

  return res.status(201).json(serie);
});

router.put('/:id', Authenticate, async (req, res) => { // CRUD
  console.log(`Request URL Param: ${req.params.id}`);
  console.log(`This is a put operation`);

  const serie = await serieService.updateSerieById(req.params.id, req.body);

  return res.status(200).json(serie);
});

router.delete('/:id', Authenticate, async (req, res) => { // CRUD
  console.log(`Request URL Param: ${req.params.id}`);
  console.log(`This is a delete operation`);

  const serie = await serieService.deleteSerieById(req.params.id);

  return res.status(200).json(serie);
});

router.get('/movies', Authenticate, async (req, res) => { // Punto 7
  console.log(`This is a get operation`);

  const series = await serieService.getListSerie();

  return res.status(200).json(series);
});

router.get('/detalles', Authenticate, async (req, res) => { // Punto 8
  console.log(`Request URL Param: ${req.query.id}`);
  console.log(`This is a get operation`);

  const series = await serieService.getDetallesSerie(req.query.id);

  return res.status(200).json(series);
});

router.get('/filtrar', Authenticate, async (req, res) => { // Punto 10
  console.log(`Titulo:  ${req.query.titulo}`);
  console.log("Orden: ", req.query.orden);
  console.log(`This is a get operation`);

  const {titulo, orden} = req.query;


  const series = await serieService.getOrdenTitulo(titulo, orden);

  return res.status(200).json(series);
});

export default router;
