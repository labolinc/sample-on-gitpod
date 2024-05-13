import axios from "axios";

export default defineNuxtPlugin(() => {
    const config = useRuntimeConfig();

    const instance = axios.create({
        withCredentials: true,
        baseURL: config.public.baseApiURL as string,
    });

    return {
        provide: {
            httpClient: instance,
        },
    };
});