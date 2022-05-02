import { createServer } from 'http';
import server from './server';

main();

function main() {
    const PORT = process.env.PORT || 3000;
    const app = server.getApp();
    const httpServer = createServer(app);
    httpServer.listen(PORT, () => console.log(`Server is running at ${PORT}...`));
}
