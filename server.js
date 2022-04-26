import express from "express";
import cors from "cors";
import PizzaRouter from "./src/controllers/pizzaController.js";

const app = express();
const port = 5000;

app.use(cors());
app.use(express.json());

app.use("/pizza", PizzaRouter);

app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
