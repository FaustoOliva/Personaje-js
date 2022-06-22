import axios from "axios";

const axiosClient = axios.create ({
    baseURL : "http://localhost:5000"
})

export const getPersonaje = async  => {
    return axiosClient.get('/personaje/characters').then(response => {
        if ( response.status < 300){
            console.log("No hubo fallas")
            return response.data;
        } else {
            console.log("Algo anduvo mal")
        }
    }).catch(error =>{
        console.log(error)

    })
}