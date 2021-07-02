var WebSocketServer = require('ws').Server;
const port = process.env.PORT || 3000;
var wss = new WebSocketServer({ port });

console.log(`listening port :${port}`);

wss.on('connection', function connection(ws) {
    console.log('connection');

    ws.on('message', function incoming(message) {
        console.log('received: %s', message);

        ws.send(message);
    });

    ws.on('close', function() {
        console.log('close');
    });
});

