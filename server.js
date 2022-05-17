import express from "express";
import cors from "cors";
import PersonajeRouter from "./src/controllers/PersonajeController.js";
import SerieRouter from "./src/controllers/SerieController.js";
import OuthRouter from "./src/controllers/OuthController.js";

const app = express();
const port = 5000;

app.use(cors());
app.use(express.json());

app.use("/personaje", PersonajeRouter);
app.use("/serie", SerieRouter);
app.use("/auth", OuthRouter);
  
app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
