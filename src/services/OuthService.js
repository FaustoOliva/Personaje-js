import jwt from "jsonwebtoken";
import 'dotenv/config'

export class OuthService {

    getToken = async () => {
        const getRandomString = () => {
            var result = "";
            var characters =
                "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var charactersLength = characters.length;
            for (var i = 0; i < 18; i++) {
                result += characters.charAt(Math.floor(Math.random() * charactersLength));
            }

            return result;
        };

        const getSignedToken = () => {
            const userId = getRandomString();
            const userMail = `${userId}@example.com`;
            const token = "Token: " + jwt.sign(
                {
                    payload: "custom payload",
                    userEmail: userMail,
                },
                process.env.AUTH_HS256_KEY,
                {
                    issuer: "http://personaje.ort/",
                    subject: userId,
                    audience: ["http://localhost/"],
                    expiresIn: 60 * 24 * 24,
                },
                
            );
            return token;
        };

        console.log(getSignedToken());
        return getSignedToken();
    }
}
