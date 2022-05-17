import express from "express";
import cors from "cors";
import PersonajeRouter from "./src/controllers/PersonajeController.js";
import SerieRouter from "./src/controllers/SerieController.js";

const app = express();
const port = 5000;

app.use(cors());
app.use(express.json());

app.use("/personaje", PersonajeRouter);
app.use("/serie", SerieRouter);
  
app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
