var express = require('express');
var http = require('http');
var fs = require('fs');
var app = express();

app.use( function(req, res, next) {
   console.log('%s %s', req.method, req.url);
    next();
});

app.use(
    "/",
    express.static("../../sites/PorteFolio/app")
);

app.use(
    "/NyxDoc/",
    express.static("../../sites/Nyx/doc")
);

var http_server = http.createServer(app);

http_server.listen(8000);

