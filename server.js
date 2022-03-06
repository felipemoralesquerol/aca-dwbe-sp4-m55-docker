const express = require('express');
const ip = require('ip');
const logger = require('morgan');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();
app.use(logger('dev'))

// Endpoints
app.get('/', (req, res) => {
    localTime = new Date();
    const localAddress = ip.address();
    const remoteAddress = req.ip;
    const message = localTime.toLocaleTimeString()+`: Server address in ${localAddress}. Access from ${remoteAddress}`
   
    console.log(message);
    res.send(message);
});

app.listen(PORT, HOST);
console.log(`Server NodeJs Example - Running on port ${PORT}`);