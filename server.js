import express from "express";
import cors from "cors";
import PersonajeRouter from "./src/controllers/PersonajeController.js";
import SerieRouter from "./src/controllers/SerieController.js";
import OuthRouter from "./src/controllers/OuthController.js";
import swaggerUI from 'swagger-ui-express';
import swaggerJsDoc from 'swagger-jsdoc';

const app = express();
const port = 5000;

app.use(cors());
app.use(express.json());
const specs = swaggerJsDoc(options);

app.use("/personaje", PersonajeRouter);
app.use("/serie", SerieRouter);
app.use("/auth", OuthRouter);
app.use("/api-docs", swaggerUI.serve, swaggerUI.setup(specs));

app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
