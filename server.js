var express = require('express');
var http = require('http');
var fs = require('fs');
var app = express();

app.configure( 'all', function() {

    app.use( function(req, res, next) {
       console.log('%s %s', req.method, req.url);
        next();
    });

    app.use( "/NyxTraceViewer", function(req, res, next) {

        if ( req.url === '/' ) {
            res.redirect('/NyxTraceViewer/home.html');
            return;
        }

        next();
    });

    app.use( "/PorteFolio", function(req, res, next) {

        if ( req.url === '/' ) {
            res.redirect('/PorteFolio/home.html');
            return;
        }

        next();
    });

    app.use(
        "/",
        express.static("sites")
    );

//    app.use( "/NyxTraceViewer", express.static("/sites/NyxTraceViewer/home.html") );
});

var http_server = http.createServer(app);

http_server.listen(8000);

