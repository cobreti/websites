var express = require('express');
var http = require('http');
var fs = require('fs');
var app = express();

app.configure( 'all', function() {

    app.use( function(req, res, next) {
       console.log('%s %s', req.method, req.url);
        next();
    });

    app.use( "/PorteFolio/NyxTraceViewer", function(req, res, next) {

        if ( req.url === '/' ) {
            res.redirect('/PorteFolio/NyxTraceViewer/home.html');
            return;
        }

        next();
    });

    app.use( "/PorteFolio/InterviewManager", function(req, res, next) {

        if ( req.url === '/' ) {
            res.redirect('/PorteFolio/InterviewManager/home.html');
            return;
        }

        next();
    });

    app.use( "/PorteFolio/NyxTraceViewer/files/get", function(req, res, next) {

        var files_info = {};
        var folder_count = 0;

        console.log(__dirname);

        fs.readdir(__dirname + '/sites/PorteFolio/NyxTraceViewer/files/Linux_64/', function(err, files) {

            if (typeof files !== 'undefined') {

                files_info.Linux_64 = {};

                var index = 0;
                var len = files.length;
                var exp = /\.gz?/;

                while (index < len) {

                    if (exp.exec(files[index]) !== null) {
                        files_info.Linux_64[files[index]] = {};
                    }

                    index += 1;
                }
            }

            folder_count += 1;

            if (folder_count == 3) {
                res.send(files_info);
            }
        });

        fs.readdir(__dirname + '/sites/PorteFolio/NyxTraceViewer/files/Windows_64/', function(err, files) {

            if (typeof files !== 'undefined') {

                files_info.Windows_64 = {};

                var index = 0;
                var len = files.length;
                var exp = /\.zip?/;

                while (index < len) {

                    if (exp.exec(files[index]) !== null) {
                        files_info.Windows_64[files[index]] = {};
                    }

                    index += 1;
                }
            }

            folder_count += 1;

            if (folder_count == 3) {
                res.send(files_info);
            }
        });

        fs.readdir(__dirname + '/sites/PorteFolio/NyxTraceViewer/files/OSX_64/', function(err, files) {

            if (typeof files !== 'undefined') {

                files_info.OSX_64 = {};

                var index = 0;
                var len = files.length;
                var exp = /\.dmg?/;


                while (index < len) {

                    if (exp.exec(files[index]) !== null) {
                        files_info.OSX_64[files[index]] = {};
                    }

                    index += 1;
                }
            }

            folder_count += 1;

            if (folder_count == 3) {
                res.send(files_info);
            }
        });

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

