import express from 'express';
import morgan from 'morgan';

interface IServer {
    getApp: () => express.Application,
    listen: (port: number, callback: () => void) => void
}

class Server implements IServer {
    private readonly app: express.Application;

    constructor() {
        this.app = express();
        this.registerMiddlewares()
            .registerRouters();
    }

    public getApp() {
        return this.app;
    }

    public listen(port: number, callback: () => void) {
        this.app.listen(port, callback);
    }

    private registerMiddlewares() {
        this.app.use(express.json());
        this.app.use(express.urlencoded({ extended: true }));
        this.app.use(morgan('tiny'));
        return this;
    }

    private registerRouters() {
        return this;
    }
}

export default new Server();
