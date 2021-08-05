'use strict';

const express = require('express');
const { Server } = require('ws');

const PORT = process.env.PORT || 3000;
const INDEX = '/index.html';

const server = express()
  .use((req, res) => res.sendFile(INDEX, { root: __dirname }))
  .listen(PORT, () => console.log(`Listening on ${PORT}`));

const wss = new Server({ server });


// console.log(`listening port :${PORT}`);

wss.on('connection', function connection(ws) {
    console.log('connection');

    ws.on('message', function incoming(message) {
        console.log('received: %s', message);
        wss.clients.forEach((client) => {
            client.send(message);
        });
    });

    ws.on('close', function() {
        console.log('close');
    });
});

