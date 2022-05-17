import { Router } from 'express';
import { OuthService } from "../services/OuthService.js";
import "dotenv/config";

const router = Router();
const outhService = new OuthService();

router.get('/login', async res => {
    console.log(`This is a get operation`);

    const token = await outhService.getToken();

    return res.status(201).json(token); //No reconoce function
});


export default router;