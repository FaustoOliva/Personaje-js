import { Router } from 'express';
import { OuthService } from "../services/OuthService.js";
import "dotenv/config";

const router = Router();
const outhService = new OuthService();

router.get('/login', async (req, res) => {
    console.log(`This is a get operation`);

    const token = await outhService.getToken();
    console.log(`This ` + token);
    
    return res.status(200).json(token); //No reconoce function
});


export default router;