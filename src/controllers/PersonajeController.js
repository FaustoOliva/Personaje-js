import { Router } from 'express';
import { PersonajeService } from '../services/PersonajeService.js';
import { Authenticate } from '../common/jwt.strategy.js'; 

const router = Router();
const personajeService = new PersonajeService();

router.post('/create', Authenticate, async (req, res) => {
  console.log(`This is a post operation`);

  const texto = await personajeService.createPersonaje(req.body);

  return res.status(201).json(texto);
});

router.put('/:id', Authenticate, async (req, res) => {
  console.log(`Request URL Param: ${req.params.id}`);
  console.log(`This is a put operation`);

  const texto = await personajeService.updatePersonajeById(req.params.id, req.body);

  return res.status(200).json(texto);
});

router.delete('/:id', Authenticate, async (req, res) => {
  console.log(`Request URL Param: ${req.params.id}`);
  console.log(`This is a delete operation`);

  const texto = await personajeService.deletePersonajeById(req.params.id);

  return res.status(200).json(texto);
});

router.get('/get', Authenticate, async (req, res) => {
  console.log("nombre: ", req.query.nombre);
  console.log("edad: ", req.query.edad);
  console.log("peso: ", req.query.peso);
  console.log("serie: ", req.query.serie);
  console.log(`This is a get operation`);

  const {nombre, edad, peso, serie} = req.query;

  const personajes = await personajeService.getPersonajeFiltrado(nombre, edad, peso, serie);

  return res.status(200).json(personajes);
});


router.get('/characters', Authenticate, async (req, res) => {
  console.log(`This is a get operation`);

  const personajes = await personajeService.getListPersonaje();

  return res.status(200).json(personajes);
});

router.get('/detalles', Authenticate, async (req, res) => {
  console.log(`Request URL Param: ${req.query.id}`);
  console.log(`This is a get operation`);

  const personajes = await personajeService.getDetallesPersonaje(req.query.id);
  
  return res.status(200).json(personajes);
});

export default router;
